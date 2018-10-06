<cfscript>
	message = new com.Messages();
	fn = new base.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}

	message = message.createResponse( regid, url.messageId, url.message, url.eventid, url.clientid );	
	response = {
		"success" : true
	};	
</cfscript>