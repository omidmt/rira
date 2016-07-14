package mt.omid.rira

/**
 * Created by Omid Mehdizadeh on 6/12/2016.
 */
enum Status {
    ACTIVE(0),
    INACTIVE(1)

    final int id

    private Status( int id )
    {
        this.id = id
    }

    static Status valueOfName( String name )
    {
        values().find { it.name().equalsIgnoreCase(name) }
    }
}
