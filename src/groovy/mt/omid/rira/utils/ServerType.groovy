package mt.omid.rira.utils

import groovy.transform.CompileStatic

/**
 * @author eomimeh
 */
@CompileStatic
enum ServerType
{
    NetraT2000      ( 1 ),
    SunFireT5220    ( 2 ),
    SunFireX4270M2  ( 3 ),
    SunFireT2000    ( 4 ),
    Other           ( 5 )

    final int id

    private ServerType( int id )
    {
        this.id = id
    }
}
