package mt.omid.rira.utils
/**
 * Created by eomimeh on 8/3/2014.
 */

public enum NodeType
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

    int id

    NodeType( int id )
    {
        this.id = id
    }

    static NodeType valueOfName( String name )
    {
        values().find { it.value() == name }
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