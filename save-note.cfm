<cfscript>
	notes = new com.Notes();
	fn = new com.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}

	list = notes.saveNote( regid, url.note, url.noteId );	
	response = {
		"success" : true
	};
	
</cfscript>