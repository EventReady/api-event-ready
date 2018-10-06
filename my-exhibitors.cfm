<cfscript>
	exhibitors = new com.Exhibitors();
	fn = new com.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}

	exhibs = exhibitors.getMyExhibitors( url.eventId, regid );	
	response = {
		'success' : true,
		'data' : {
			'exhibitors' : fn.queryToArray( exhibs )
		}
	};
</cfscript>