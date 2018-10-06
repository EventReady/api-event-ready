<cfscript>
try{
		
	dashboard = new com.Dashboard();
	
	fn = new com.FNs();
	callout = dashboard.getCallout( url.eventId );	
	spotlight = dashboard.getSpotlight( url.eventId );	
	if( callout.recordCount ){
		response = {
			'success' : true,
			'callout' : fn.QueryToStruct( callout )[1],			
			'spotlight' : fn.QueryToStruct( spotlight )[1]			
		};
	}else{
		response = {
			'success' : false,
			'message' : "invalid Request"
		};
	}
	
}catch(any e){
	writedump(e);abort;	
}
	
</cfscript>