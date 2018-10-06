<cfscript>
	auth = new com.Auth();
	fn = new base.FNs();
	reg = auth.authenticateSpeaker( argumentCollection=app_request );	
	if( reg.recordCount ){
		response = {
			'success' : true,
			'data' : {
				'token' : toBase64( app_request.username & now().getTime() ),
				'speaker' : fn.queryToStruct( reg )
			}
		};
	}else{
		response = {
			'success' : false,
			'message' : "invalid login attempt"
		};
	}
</cfscript>