<cfscript>
	files = new com.Files();
	fn = new base.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}

	ret = files.getMyFiles( "mea-mft", "educatorsconference2018", url.eventId, regid );	
	response = {
		'success' : true,
		'data' : {
			'files' : fn.queryToArray( ret )
		}
	};
</cfscript>