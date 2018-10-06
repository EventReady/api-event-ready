<cfscript>
	sponsors = new com.Sponsors();
	fn = new com.FNs();
	sponsorsList = sponsors.getSponsors( url.clientId, url.eventId );	
	if( sponsorsList.recordCount ){
		response = {
			'success' : true,
			'data' : {
				'sponsors' : fn.queryToArray( sponsorsList )
			}
		};
	}else{
		response = {
			'success' : false,
			'message' : "invalid Request"
		};
	}
	
</cfscript>