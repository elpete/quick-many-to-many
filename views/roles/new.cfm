<cfoutput>
    <h3>Add a Role</h3>
    <hr />
    <form method="POST" action="#event.buildLink( "roles" )#">
        <input type="hidden" name="_token" value="#csrfGenerateToken()#" />
        <div class="form-group">
            <label for="name">Role Name</label>
            <input name="name" type="text" class="form-control" id="name" />
            <cfif prc.errors.keyExists( "name" )>
                <small class="form-text text-danger">
                    <cfloop array="#prc.errors.name#" index="error">
                        <p>#error.message#</p>
                    </cfloop>
                </small>
            </cfif>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Create Role</button>
        </div>
    </form>
</cfoutput>
