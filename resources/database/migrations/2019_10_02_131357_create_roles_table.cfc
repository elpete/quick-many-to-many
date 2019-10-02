component {

    function up( schema, query ) {
        schema.create( "roles", function(table) {
			table.increments( "id" );
			table.string( "name" ).unique();
		} );
    }

    function down( schema, query ) {
        schema.drop( "roles" )
    }

}
