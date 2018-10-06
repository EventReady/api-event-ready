<cfscript>
	notes = new com.Notes();
	fn = new com.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}

	list = notes.getNotes( regid );
	
	response = {
		"success" : true,
		"list" : fn.queryToArray( list )
	};
	
</cfscript>