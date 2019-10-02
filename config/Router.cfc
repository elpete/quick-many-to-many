component {

	function configure(){
		// Set Full Rewrites
		setFullRewrites( true );

		route( "/login" ).withHandler( "sessions" ).toAction( { "GET" : "new", "POST" : "create" } );

        route( "/logout", "sessions.delete" );

        route( "UserRoles" )
            .withAction( {
                "POST": "create",
                "DELETE": "delete"
            } )
            .toHandler( "UserRoles" );

		resources( resource = "roles" );
		resources( resource = "registrations", only = [ "new", "create" ] );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
