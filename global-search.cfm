<cfscript>
	search = new com.GlobalSearch();
	fn = new base.FNs();
	formatted_days = {
			1 : "2017-11-07 00:00:00.000",
			2 : "2017-11-08 00:00:00.000",
			3 : "2017-11-09 00:00:00.000"

	};
	ret = search.search( url.clientid, url.eventid, term, formatted_days );	
	searches = {
		"attendees" : fn.queryToArray( ret.attendees ),
		"exhibitors" : fn.queryToArray( ret.exhibitors ),
		"schedule" : fn.queryToArray( ret.schedule ),
		"sponsors" : fn.queryToArray( ret.sponsors ),
		"speakers" : fn.queryToArray( ret.speakers )
	};
	output = [];
	for( i=1; i<=arrayLen( searches.attendees ); i++ ){
		obj = searches.attendees[ i ];
		obj[ 'output' ] = searches.attendees[ i ].fullname;
		searchType = { "searchType" : "Attendees" };
		structAppend(obj, searchType, true );
		arrayAppend( output, obj );
	}
	for( i=1; i<=arrayLen( searches.exhibitors ); i++ ){
		obj = searches.exhibitors[ i ];
		obj[ 'output' ] = searches.exhibitors[ i ].exhibitor;
		searchType = { "searchType" : "Exhibitors" };
		structAppend(obj, searchType, true );
		arrayAppend( output, obj );
	}
	for( i=1; i<=arrayLen( searches.schedule ); i++ ){
		obj = searches.schedule[ i ];
		obj[ 'output' ] = searches.schedule[ i ].session_name;
		searchType = { "searchType" : "Schedules" };
		structAppend(obj, searchType, true );
		arrayAppend( output, obj );
	}
	for( i=1; i<=arrayLen( searches.sponsors ); i++ ){
		obj = searches.sponsors[ i ];
		obj[ 'output' ] = searches.sponsors[ i ].name;
		searchType = { "searchType" : "Sponsors" };
		structAppend(obj, searchType, true );
		arrayAppend( output, obj );
	}
	for( i=1; i<=arrayLen( searches.speakers ); i++ ){
		obj = searches.speakers[ i ];
		obj[ 'output' ] = searches.speakers[ i ].first_name & " " & searches.speakers[ i ].last_name;
		searchType = { "searchType" : "Speakers" };
		structAppend(obj, searchType, true );
		arrayAppend( output, obj );
	}
	response = {
		"success" : true,
		"data" : output
	};
</cfscript>