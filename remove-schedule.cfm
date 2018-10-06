<cfscript>
	schedule = new com.Schedule();
	fn = new com.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}

	list = schedule.removeSchedule( url.id, regid, url.eventid );
	
	response = {
		"success" : true
	};
	
</cfscript>