<cfscript>
	message = new com.Messages();
	fn = new base.FNs();
	message.deleteMessage( url.messageid, url.eventid, url.clientid );	
	response = {
		"success" : true
	};
	
</cfscript>