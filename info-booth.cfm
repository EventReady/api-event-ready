<cfscript>
	notes = new com.InfoBooth();
	fn = new com.FNs();
	list = notes.getInfoBooth( url.clientid, url.eventid );
	
	response = {
		"success" : true,
		"list" : fn.queryToArray( list )
	};
	
</cfscript>