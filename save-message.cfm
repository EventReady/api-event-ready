<cfscript>
	message = new com.Messages();
	fn = new base.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}

	message.createMessage( regid, url.contact, url.subject, url.message, url.eventid, url.clientid );	
	response = {
		"success" : true
	};
	
</cfscript>