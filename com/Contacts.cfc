<cfcomponent>
	<cffunction name="getContacts" access="public" output="no">
		<cfargument name="clientId" required="yes" />		
		<cfquery name="q" dataSource="#request.dsn#">
			select top 100 first_name + ' ' + last_name as full_name, * from dbo.registrations 
			where client_id = <cfqueryparam value="#clientId#" />
		</cfquery>
		<Cfreturn q />
	</cffunction>

</cfcomponent>