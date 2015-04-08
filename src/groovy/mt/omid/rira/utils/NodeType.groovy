package mt.omid.rira.utils

import groovy.transform.CompileStatic

/**
 * @author eomimeh
 */
@CompileStatic
enum NodeType
{
    SDP     ( 1 ),
    CCN     ( 2 ),
    AIR     ( 3 ),
    VS      ( 4 ),
    MINSAT  ( 5 ),
    CRS     ( 6 ),
    VPN     ( 7 ),
    EMMFE   ( 8 ),
    EMMOLM  ( 9 ),
    EMA     ( 10 ),
    Other   ( 11 )

    final int id

    private NodeType( int id )
    {
        this.id = id
    }

    static NodeType valueOfName( String name )
    {
        values().find { it.name() == name }
    }

    def modules()
    {
        switch ( id )
        {
            case SDP:
            case SDP.id:
            case AIR:
            case AIR.id:
            case VS:
            case VS.id:
                return [ ModuleType.OS, ModuleType.FDS ]

            case CCN:
            case CCN.id:
                return [ ModuleType.OS, ModuleType.LDAP ]

            default:
                return [ ModuleType.OS ]
        }
    }
}