component {

    function up( schema, query ) {
        schema.create( "user_role_map", function( table ) {
            table.increments( "id" );
            table.unsignedInteger( "user_id" ).references( "id" ).onTable( "users" );
            table.unsignedInteger( "role_id" ).references( "id" ).onTable( "roles" );
        } );
    }

    function down( schema, query ) {
        schema.drop( "user_role_map" );
    }

}
