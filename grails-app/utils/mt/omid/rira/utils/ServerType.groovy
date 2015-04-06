package mt.omid.rira.utils

/**
 * Created by eomimeh on 8/3/2014.
 */
public enum ServerType
{
    NetraT2000      ( 1 ),
    SunFireT5220    ( 2 ),
    SunFireX4270M2  ( 3 ),
    SunFireT2000    ( 4 ),
    Other           ( 5 )

    int id

    ServerType( id )
    {
        this.id = id
    }

}