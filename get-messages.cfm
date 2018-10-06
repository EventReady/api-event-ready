<cfscript>
	message = new com.Messages();
	fn = new base.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}

	messages = message.getMessages( regid, url.eventid, url.clientid );	
	response = {
		"success" : true,
		"messages" : fn.queryToArray( messages )
	};
	
</cfscript>