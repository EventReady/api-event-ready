<cfscript>
	notes = new com.Notes();
	fn = new base.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}

	list = notes.sendNotes( regid );
	
	response = {
		"success" : true
	};
</cfscript>