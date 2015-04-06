package mt.omid.rira.utils

/**
 * Created by eomimeh on 8/4/2014.
 */
public enum OS
{
    SOLARIS10       ( 1 ),
    RHEL6           ( 2 ),
    Windows         ( 3 ),
    GenericLinux    ( 4 ),
    Other           ( 5 )

    int id

    OS( int id )
    {
        this.id = id
    }

}