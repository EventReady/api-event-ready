<cfscript>
	venues = new com.Venues();
	fn = new com.FNs();
	ret = venues.getVenues( argumentCollection=url );	
	if( ret.recordCount ){
		response = {
			'success' : true,
			'data' : {
				'venues' : fn.queryToArray( ret )
			}
		};
	}else{
		response = {
			'success' : false,
			'message' : "invalid Request"
		};
	}
</cfscript>