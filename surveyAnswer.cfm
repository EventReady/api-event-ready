<cfscript>
	surveys = new com.Surveys();
	fn = new base.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else{
		regid = ToString( ToBinary( url.item ) );
	}
	sp = surveys.getSurveyAnswer( url.clientId, url.eventId, url.surveyId, regId );	
	response = {
		'success' : true,
		'data' : {
			'surveyAnswer' : fn.QueryToStruct( sp )
		}
	};
</cfscript>