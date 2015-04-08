package mt.omid.rira.utils

import groovy.transform.CompileStatic

/**
 * @author eomimeh
 */
@CompileStatic
enum CheckStatus
{
    OK (0),
    LOGIN_FAILED (1),
    TIMEOUT (2),
    OTHER_ERROR (4)

    final int id

    private CheckStatus( int id )
    {
        this.id = id
    }

    static CheckStatus valueOfName( String name )
    {
        values().find { it.name() == name }
    }

    static CheckStatus valueOf( id )
    {
        values().find { it.id == id }
    }
}
