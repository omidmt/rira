package mt.omid.rira.utils

/**
 * Created by eomimeh on 8/4/2014.
 */
public enum LoginMethod
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

    int id

    LoginMethod( int id )
    {
        this.id = id
    }

}