<cfscript>
	auth = new com.Auth();
	fn = new com.FNs();
	auth.resetPassword( argumentCollection=app_request );	
	response = {
		'success' : true
	};
</cfscript>