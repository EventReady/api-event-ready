<cfcomponent>
	<cffunction name="getScheduleList" access="public" output="no">
		<cfargument name="day" />
		<cfargument name="start" required="yes" default="0" />
		<cfargument name="end" required="yes" default="0" />
		<cfargument name="term" required="no" default="" />
		
		<cfset formatted_days = {
			1 : "2018-06-13 00:00:00.000",
			2 : "2018-06-14 00:00:00.000",
			3 : "2018-06-15 00:00:00.000",
			4 : "2018-06-16 00:00:00.000",
			5 : "2018-06-17 00:00:00.000"
		} />
		<Cfset FN = new FNs() />
		<cfquery name="q" dataSource="#request.dsn#">

			WITH list AS(
				select *, 
				ROW_NUMBER() OVER (ORDER BY session_name) AS 'RowNumber'
				from dbo.Loc_Sessions 
				where start_date = <cfqueryparam value="#formatted_days[day]#" />
			) 
			SELECT * 
			FROM list
			<Cfif !len(arguments.term)>		
			WHERE RowNumber BETWEEN <cfqueryparam value="#arguments.start#" /> AND <cfqueryparam value="#arguments.end#" />
			<cfelseif len(arguments.term)>
				where session_name like <cfqueryparam value="%#arguments.term#%" /> 
				or event_number like <cfqueryparam value="%#arguments.term#%" />
				or room like <cfqueryparam value="%#arguments.term#%" />
				or start_time like <cfqueryparam value="%#arguments.term#%" />
			</cfif>
		</cfquery>
		<Cfreturn FN.queryToArray( q ) />
	</cffunction>
	
	<cffunction name="getScheduleDays" access="public" output="no">
		<cfargument name="locationId" />
		<cfquery name="q" dataSource="#request.dsn#"  cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
			SELECT distinct s.start_date
			FROM Loc_Sessions S 
			INNER JOIN Loc_Tracks T ON S.Track_ID = T.Track_ID 
			WHERE S.Location_ID = <cfqueryparam value="#locationId#" />
		</cfquery>
		<Cfreturn q />
	</cffunction>
	
	<cffunction name="getScheduleDetail" access="public" output="no">
		<cfargument name="scheduleId" />
		<cfquery name="q" dataSource="#request.dsn#">
			select top 1 * from dbo.Loc_Sessions 
			where session_id = <cfqueryparam value="#scheduleId#" />
		</cfquery>
		<Cfreturn q />
	</cffunction>

	<cffunction name="removeSchedule" access="public" output="no">
		<cfargument name="id" />
		<cfargument name="regid" />
		<cfargument name="eventid" />
		<cfquery name="q" dataSource="#request.dsn#">
			delete from dbo.XR_Reg_Location_Sessions
			where event_id = <cfqueryparam value="#eventid#" />
			and reg_id = <cfqueryparam value="#regid#" /> 
			and session_id = <cfqueryparam value="#id#" />
		</cfquery>	

		<cfquery name="q" dataSource="#request.dsn#">
			delete from dbo.XR_Reg_Location_Activities
			where event_id = <cfqueryparam value="#eventid#" />
			and reg_id = <cfqueryparam value="#regid#" /> 
			and location_id = <cfqueryparam value="#id#" />
		</cfquery>	
	</cffunction>
	<Cffunction name="getMySchedule" access="public" output="no">
		<cfargument name="locationId" />
		<cfargument name="regid" />
		<cfargument name="eventid" />
		<cfquery name="q" dataSource="#request.dsn#">
			SELECT S.Session_Name as Item, S.Room as Location, S.Start_Date, S.Start_Time, S.Start_Date as End_Date, S.End_Time,cast(S.Description as varchar(2000)) AS Description, 'Session' AS Type, S.Session_id AS ID 
			FROM Loc_Sessions S 
			INNER JOIN XR_Reg_Location_Sessions LS ON S.Session_ID = LS.Session_ID 
			WHERE LS.Reg_ID = <cfqueryparam value="#regid#" /> 
			AND LS.Status = 'Active' 
			and ls.event_id = <cfqueryparam value="#eventid#" />
			UNION 
			SELECT S.Activity_Name as Item, S.Location, S.Start_Date, S.Start_Time, S.End_Date, S.End_Time,cast(S.Description as varchar(2000)) AS Description, 'Activity' AS Type, S.Act_ID AS ID 
			FROM Loc_Activities S 
			INNER JOIN XR_Reg_Location_Activities LS ON S.Act_ID = LS.Act_ID 
			WHERE LS.Reg_ID =  <cfqueryparam value="#regid#" /> 
			and ls.event_id = <cfqueryparam value="#eventid#" />
			AND LS.Status = 'Active' 
			union all
			SELECT la.agenda_name as item, la.location,  la.Start_Date, la.Start_Time, la.End_Date, la.End_Time, la.description, 'Agenda' as Type, la.agenda_id as id
			FROM dbo.Loc_Agenda la where location_id = <cfqueryparam value="#locationId#" />			
			ORDER BY Start_Date, Start_Time, Item
		</cfquery>	
		<Cfreturn q />
	</Cffunction>
	
	<Cffunction name="addToSchedule" access="public" output="no">
		<cfargument name="locationId" />
		<cfargument name="regid" />
		<cfargument name="scheduleId" />
		<cfargument name="eventId" />
		
		<cfquery name="check" dataSource="#request.dsn#">
			select 1 from XR_Reg_Location_Sessions 
			where reg_id = <cfqueryparam value="#regid#" />
			and session_id = <cfqueryparam value="#scheduleId#" />
			AND Location_ID = <cfqueryparam value="#locationId#" />
		</cfquery>
		<Cfif ! check.recordCount>
			<cfquery name="session" dataSource="#request.dsn#">
				select top 1 * from dbo.Loc_Sessions 
				where session_id = <cfqueryparam value="#scheduleId#" />
			</cfquery>
		
			<cfquery name="q" dataSource="#request.dsn#">
				insert into XR_Reg_Location_Sessions (
					event_id, reg_id, location_id, session_id, status, status_date
				)
				values(
					<cfqueryparam value="#eventId#" />,
					<cfqueryparam value="#regId#" />,
					<cfqueryparam value="#locationId#" />,
					<cfqueryparam value="#scheduleId#" />,
					<cfqueryparam value="active" />,
					getDate()
				)
			</cfquery>
		</Cfif>
	
	</Cffunction>
</cfcomponent>
