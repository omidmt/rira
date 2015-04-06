package mt.omid.rira.utils

/**
 * Created by eomimeh on 8/26/2014.
 */
public enum ModuleType
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


    int id

    ModuleType( int id )
    {
        this.id = id
    }

    static ModuleType valueOfName( String name )
    {
        values().find { it.name == name }
    }

    static ModuleType valueOf( id )
    {
        values().find { it.id == id }
    }
}
