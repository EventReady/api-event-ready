<cfscript>
	speakers = new com.Speakers();
	fn = new com.FNs();
	ret = speakers.getSpeaker( argumentCollection=url );
	sessions = speakers.getSpeakerSessions( argumentCollection=url );	
	if( ret.recordCount ){
		response = {
			'success' : true,
			'data' : {
				'speaker' : fn.queryToStruct( ret )[1],
				'sessions' : fn.queryToArray( sessions )
			}
		};
	}else{
		response = {
			'success' : false,
			'message' : "invalid Request"
		};
	}
</cfscript>