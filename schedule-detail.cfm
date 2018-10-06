<cfscript>
	schedule = new com.Schedule();
	fn = new com.FNs();
	schedule_detail = fn.queryToArray( schedule.getScheduleDetail( url.scheduleid ) );
	
	response = {
		"success" : true,
		"schedule" : schedule_detail
	};
	
</cfscript>