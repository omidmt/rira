package mt.omid.rira.utils

import groovy.transform.CompileStatic

/**
 * @author eomimeh
 */
@CompileStatic
enum ModuleType
{
    OS( 1 ),
    FDS( 2 ),
    LDAP( 3 ),
//    SC( 4 ),
    EMA( 5 ),
    MM( 6 ),
    ALOM( 7 ),
    ILOM( 8 ),
    ILO( 9 )

    final int id

    private ModuleType( int id )
    {
        this.id = id
    }

    static ModuleType valueOfName( String name )
    {
        values().find { it.name() == name }
    }

    static ModuleType valueOf( id )
    {
        values().find { it.id == id }
    }
}
