<cfscript>
	exhibitors = new com.Exhibitors();
	fn = new com.FNs();
	exhib = exhibitors.getExhibitor( url.clientId, url.eventId, url.exhibId );	
	if( exhib.recordCount ){
		response = {
			'success' : true,
			'data' : {
				'exhibitor' : fn.queryToArray( exhib )
			}
		};
	}else{
		response = {
			'success' : false,
			'message' : "invalid Request"
		};
	}
	
</cfscript>