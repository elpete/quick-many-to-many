component secured {

    function index( event, rc, prc ) {
        prc.roles = getInstance( "Role" ).all();
        event.setView( "roles/index" );
    }

    function new( event, rc, prc ) {
		param prc.errors = flash.get( "role_form_errors", {} );
        event.setView( "roles/new" );
    }

    function create( event, rc, prc ) {
        var result = validateModel(
			target = rc,
			constraints = {
				"name" : {
					"required" : true,
					"uniqueInDatabase" : { "table" : "roles", "column" : "name" }
				}
			}
		);

		if ( result.hasErrors() ) {
			flash.put( "role_form_errors", result.getAllErrorsAsStruct() );
			redirectBack();
			return;
		}

		getInstance( "Role" ).create( { "name" : rc.name } );

		relocate( uri = "/roles" );
    }

}
