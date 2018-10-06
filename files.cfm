<cfscript>
	files = new com.Files();
	fn = new base.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}
	filelist = files.getFiles( "mea-mft", "educatorsconference2018", url.clientId, url.eventId, regid );	
	response = {
		'success' : true,
		'data' : {
			'files' : fn.queryToArray( filelist )
		}
	};
	
</cfscript>