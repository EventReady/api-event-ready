<cfcomponent>
	<cffunction name="authenticate" access="public" output="no">
		<cfargument name="username" required="yes" />
		<cfargument name="password" required="yes" />
		<cfargument name="clientId" required="yes" />
		<cfargument name="eventId" required="yes" />		
		<cfquery name="q" dataSource="#request.dsn#">
			select top 1 * from dbo.registrations 
			where reg_id = <cfqueryparam value="#val( username )#" />
			and password = <cfqueryparam value="#password#" />
			and client_id = <cfqueryparam value="#clientId#" />
		</cfquery>
		<Cfreturn q />
	</cffunction>

	<cffunction name="resetPassword" access="public" output="no">
		<cfargument name="regid" required="yes" />
		<cfargument name="clientId" required="yes" />
		<cfargument name="eventId" required="yes" />		

		<cfquery name="q" dataSource="#request.dsn#">
			select top 1 reg_id, email from dbo.registrations 
			where reg_id = <cfqueryparam value="#regid#" />
			and client_id = <cfqueryparam value="#clientId#" />
		</cfquery>
		
		<Cfif q.recordcount>
			<Cfset password = randString( 6 ) />
			
			<cfmail to="#q.email#" from="noreply@eventready" subject="Password Reset" type="html">			
				<h2>Password Reset</h2>
				<p>Your new password is: <strong>#password#</strong>
			</cfmail>			
			
			<cfquery name="r" dataSource="#request.dsn#">
				update dbo.registrations
				set password = <cfqueryparam value="#password#" />
				where reg_id = <cfqueryparam value="#q.reg_id#" />
			</cfquery>
		</Cfif>		
	</cffunction>

	<cffunction name="RandString" output="no" returntype="string">
		<cfargument name="length" type="numeric" required="yes">
	
		<cfset var result="">
		<cfset var i=0>
		
		<cfloop index="i" from="1" to="#ARGUMENTS.length#">
			<cfset result=result&Chr(RandRange(65, 90))>
		</cfloop>
	
	<cfreturn result>
	</cffunction>
</cfcomponent>