<cfscript>
	survey = new com.Surveys();
	fn = new base.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}
	survey.addSurveyAnswer( url.clientId, url.eventId, regid, url.surveyId, url.answer );	
	response = {
		"success" : true
	};
</cfscript>