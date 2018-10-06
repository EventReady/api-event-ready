<cfscript>

	if( ! structKeyExists(url, "start") ){
		url.start = "A";
	}
	if( ! structKeyExists(url, "end") ){
		url.end = "CXXX";
	}
	if( ! structKeyExists(url, "term") ){
		url.term = "";
	}

	attendees = new com.Attendees();
	fn = new com.FNs();
	exhibs = attendees.getAttendees( url.clientId, url.eventId, url.start, url.end, url.term );	
	if( exhibs.recordCount ){
		response = {
			'success' : true,
			'data' : {
				'attendees' : fn.queryToArray( exhibs )
			}
		};
	}else{
		response = {
			'success' : false,
			'message' : "invalid Request"
		};
	}
	
</cfscript>

