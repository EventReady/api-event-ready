<cfscript>
	sponsor = new com.Sponsors();
	fn = new com.FNs();
	sp = sponsor.getSponsor( url.sponsorId );	
	if( sp.recordCount ){
		response = {
			'success' : true,
			'data' : {
				'sponsor' : fn.queryToArray( sp )
			}
		};
	}else{
		response = {
			'success' : false,
			'message' : "invalid Request"
		};
	}
	
</cfscript>