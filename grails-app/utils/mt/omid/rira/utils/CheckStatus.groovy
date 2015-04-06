package mt.omid.rira.utils

/**
 * Created by eomimeh on 8/31/2014.
 */
public enum CheckStatus
{
    OK (0),
    LOGIN_FAILED (1),
    TIMEOUT (2),
    OTHER_ERROR (4)


    int id

    def CheckStatus( int id )
    {
        this.id = id
    }

    static CheckStatus valueOfName( String name )
    {
        values().find { it.name == name }
    }

    static CheckStatus valueOf( id )
    {
        values().find { it.id == id }
    }
}
