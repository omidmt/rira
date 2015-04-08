package mt.omid.rira.utils

import groovy.transform.CompileStatic

/**
 * @author eomimeh
 */
@CompileStatic
enum LoginMethod
{

//    SSHRootPassword ( 1 ),
//    SSHRootKey      ( 2 ),
    SSHIMAPasswordRBAC  ( 3 ),
    SSHIMAPasswordSUDO  ( 4 ),
    SSHIMAKeyRBAC       ( 5 ),
    SSHIMAKeySUDO       ( 6 ),
//    LDAP            ( 7 ),
//    FDSXML          ( 8 ),
//    Other           ( 9 )

    final int id

    private LoginMethod( int id )
    {
        this.id = id
    }
}