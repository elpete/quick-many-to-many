component secured {

    function create( event, rc, prc ) {
        auth().user().roles().attach( rc.roleId );
        relocate( "/roles" );
    }

    function delete( event, rc, prc ) {
        auth().user().roles().detach( rc.roleId );
        relocate( "/roles" );
    }

}
