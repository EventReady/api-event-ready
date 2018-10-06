<cfscript>
	attendees = new com.Attendees();
	fn = new base.FNs();
	attendee = attendees.getAttendee( url.clientId, url.eventId, url.attendeeId );	
	response = {
		'success' : true,
		'data' : {
			'attendee' : fn.queryToArray( attendee )
		}
	};
	
</cfscript>

