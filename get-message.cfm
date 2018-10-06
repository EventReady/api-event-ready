<cfscript>
	message = new com.Messages();
	fn = new base.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}

	messages = message.getMessage( regid, url.messageId, url.eventid, url.clientid );	
	replies = message.getResponses( url.messageId, url.eventid, url.clientid );	
	response = {
		"success" : true,
		"message" : fn.queryToArray( messages ),
		"replies" : fn.queryToArray( replies )
	};
	
</cfscript>