<cfscript>
	venues = new com.Venues();
	fn = new com.FNs();
	ret = venues.getVenue( argumentCollection=url );	
	if( ret.recordCount ){
		response = {
			'success' : true,
			'data' : {
				'venue' : fn.queryToStruct( ret )[1]
			}
		};
	}else{
		response = {
			'success' : false,
			'message' : "invalid Request"
		};
	}
</cfscript>