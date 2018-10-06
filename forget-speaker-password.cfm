<cfscript>
	auth = new com.Auth();
	fn = new base.FNs();
	auth.resetSpeakerPassword( argumentCollection=app_request );	
	response = {
		'success' : true
	};
</cfscript>