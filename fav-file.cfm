<cfscript>
	files = new com.Files();
	fn = new base.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}
	files.setFavFile( url.eventId, regid, url.fileid, url.set );	
	response = {
		'success' : true
	};
</cfscript>