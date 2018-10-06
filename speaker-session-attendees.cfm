<cfscript>
	schedule = new com.Schedule();
	fn = new base.FNs();
	list = schedule.getSpeakerSessionAttendees( url.sessionId );
	response = {
		"success" : true,
		"list" : fn.queryToArray( list )
	};
	
</cfscript>