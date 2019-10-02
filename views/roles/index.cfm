<cfoutput>
    <h3>Available Roles</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Name</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <cfif prc.roles.isEmpty()>
                <tr>
                    <td colspan="2">
                        No roles created yet<br />
                        <a href="#event.buildLink( "roles.new" )#">Create one now</a>
                    </td>
                </tr>
            <cfelse>
                <cfloop array="#prc.roles#" index="role">
                    <tr>
                        <td>#role.getName()#</td>
                        <td>
                            <cfif auth().user().getRoles().filter( function( userRole ) {
                                return userRole.keyValue() == role.keyValue();
                            } ).isEmpty()>
                                <form method="POST" action="#event.buildLink( "UserRoles" )#">
                                    <input type="hidden" name="_token" value="#csrfGenerateToken()#" />
                                    <input type="hidden" name="roleId" value="#role.keyValue()#" />
                                    <button class="btn btn-primary" type="submit">Add to logged in user</button>
                                </form>
                            <cfelse>
                                <form method="POST" action="#event.buildLink( "UserRoles" )#">
                                    <input type="hidden" name="_token" value="#csrfGenerateToken()#" />
                                    <input type="hidden" name="_method" value="DELETE" />
                                    <input type="hidden" name="roleId" value="#role.keyValue()#" />
                                    <button class="btn btn-primary" type="submit">Remove from logged in user</button>
                                </form>
                            </cfif>
                        </td>
                    </tr>
                </cfloop>
            </cfif>
        </tbody>
    </table>
</cfoutput>
