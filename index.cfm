<cftry>

	<cfheader name="Access-Control-Allow-Origin" value="*">
	<Cfheader name="Access-Control-Allow-Methods" value="GET,POST,DELETE,PUT" />
	<Cfheader name="Access-Control-Allow-Headers" value="Origin, X-Requested-With, Content-Type, Accept, er-id, dsn, application/x-www-form-urlencoded" />
	
	<Cfset key = "j4cu5kY0cCZNuI3WkVSVJg==" />
	<Cfset secret = "Event Ready 2018 Event Ready" />
	<cfscript>
		//encrypted=encrypt(secret, key, "AES", "HEX");
		//writedump( encrypted );abort;
	</cfscript>

	<Cfif cgi.content_type NEQ "application/json" and cgi.content_type  neq "application/json;charset=utf-8">
		OK
		<Cfabort />
	</Cfif> 
	<cfset path =  listLast( url.fuseaction, "." ) />
	<Cfset variables.data = getHTTPRequestData().content />
	<Cfset variables.header = getHTTPRequestData().headers[ "er-id" ] />
	<cfset decoded = decrypt( variables.header, key, "AES", "hex" ) />
	<Cfif decoded neq secret>
		OK
		<Cfabort />
	</Cfif>
	<Cfset request.dsn = getHTTPRequestData().headers[ "dsn" ] />
	<cfset variables.app_request = {} />
	<Cfif len( variables.data )>
		<cfset variables.app_request = deserializeJSON(ToString( getHTTPRequestData().content ) ) />
	</Cfif>	
	<Cfset variables.response = {
		'success': false,
		'message': "#path#"
	 } />
		<cfinclude template="#path#.cfm" />
	
	<cfheader 
	    name="Content-Type" 
	    value="application/json">
	
	<cfoutput>#serializeJSON(response)#</cfoutput>  

	<cfcatch type="any">
		<cfdump var="#cfcatch#" abort />
		<Cfset variables.response = {
			'success': false,
			'message': "#cfcatch.message#"
		} />	
	</cfcatch>
</cftry>
