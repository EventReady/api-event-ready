<cfscript>
	surveys = new com.Surveys();
	fn = new base.FNs();
	sp = surveys.getSurveys( url.clientId, url.eventId, url.startDate, url.endDate );	
	response = {
		'success' : true,
		'data' : {
			'surveys' : fn.queryToArray( sp )
		}
	};
</cfscript>