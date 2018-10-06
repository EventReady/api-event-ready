<cfset path = "../circuits/Scheduler/" & fusebox.fuseaction />
<cfheader name="Access-Control-Allow-Origin" value="*">
<Cfheader name="Access-Control-Allow-Methods" value="GET,POST,DELETE,PUT" />
<Cfheader name="Access-Control-Allow-Headers" value="Origin, X-Requested-With, Content-Type, Accept, er-id,application/x-www-form-urlencoded" />
<cfset attributes.upper_level = "Scheduler">
<!---

<cfmail to="spiraldev@gmail.com" from="matt@eventready.com" type="html" subject="er - app">
	<cfdump var="#getHTTPRequestData()#">
	<cfdump var="#form#">
</cfmail>
--->

<!--- CORS CHECK --->
<Cfif cgi.content_type NEQ "application/json" and cgi.content_type  neq "application/json;charset=utf-8">
	OK
	<Cfabort />
</Cfif> 
<Cfset variables.data = getHTTPRequestData().content />
<Cfset variables.header = getHTTPRequestData().headers[ "er-id" ] />
<cfset variables.app_request = {} />
<Cfif len( variables.data )>
	<cfset variables.app_request = deserializeJSON(ToString( getHTTPRequestData().content ) ) />
</Cfif>	
<Cfset variables.response = {
	'success': false,
	'message': "#path#"
 } />
<cftry>
	<cfinclude template="#path#.cfm" />
	<cfcatch type="any">
		<cfdump var="#cfcatch#" abort />
		<Cfset variables.response = {
			'success': false,
			'message': "#cfcatch.message#"
		} />	
	</cfcatch>
</cftry>

<cfheader 
    name="Content-Type" 
    value="application/json">

<cfoutput>#serializeJSON(response)#</cfoutput>  