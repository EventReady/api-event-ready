<cfscript>
	auth = new com.Auth();
	fn = new com.FNs();
	reg = auth.authenticate( argumentCollection=app_request );	
	if( reg.recordCount ){
		response = {
			'success' : true,
			'data' : {
				'token' : toBase64( app_request.username & now().getTime() ),
				'registration' : fn.queryToStruct( reg )
			}
		};
	}else{
		response = {
			'success' : false,
			'message' : "invalid login attempt"
		};
	}
</cfscript>