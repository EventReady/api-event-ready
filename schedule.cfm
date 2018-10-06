<cfscript>
	try{
	if( ! structKeyExists(url, "start") ){
		url.start = "A";
	}
	if( ! structKeyExists(url, "end") ){
		url.end = "CXXX";
	}
	if( ! structKeyExists(url, "term") ){
		url.term = "";
	}
	schedule = new com.Schedule();
	fn = new com.FNs();
//	schedule_days = fn.queryToArray( schedule.getScheduleDays( url.locationId ) );
	list = schedule.getScheduleList( url.day, url.start, url.end, url.term  );
	
	response = {
		"success" : true,
		"list" : list
	};

	}catch(any e){
		writedump( e );abort;
	}
	
</cfscript>