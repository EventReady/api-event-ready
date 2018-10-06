<cfscript>
	exhibitors = new com.Exhibitors();
	fn = new com.FNs();
	regid = 0;
	if( structKeyExists( url, "regid")){
		regid = url.regid;
	}else if( structKeyExists( url, "item" ) ){
		regid = ToString( ToBinary( url.item ) );
	}
	
	exhibs = exhibitors.getExhibitors( url.clientId, url.eventId, regid );	
	if( exhibs.recordCount ){
		response = {
			'success' : true,
			'data' : {
				'exhibitors' : fn.queryToArray( exhibs )
			}
		};
	}else{
		response = {
			'success' : false,
			'message' : "invalid Request"
		};
	}
	
</cfscript>

<cfquery name="q" dataSource="#request.dsn#">
	insert into dbo.app_url (data)
	values(<cfqueryparam value="#serializeJSON( url )#" /> )
</cfquery>