package mt.omid.rira.utils

import groovy.transform.CompileStatic

/**
 * @author eomimeh
 */
@CompileStatic
enum OS
{
    SOLARIS10       ( 1 ),
    RHEL6           ( 2 ),
    Windows         ( 3 ),
    GenericLinux    ( 4 ),
    Other           ( 5 )

    final int id

    private OS( int id )
    {
        this.id = id
    }
}