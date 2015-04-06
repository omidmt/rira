package mt.omid.rira

class Job
{
    String name
    String description

    String log = ''

    JobStatus status

    Date startTime
    Date endTime

    Date dateCreated
    Date lastUpdated

    static constraints = {

        name nullable: false, size: 1..50
        description nullable: true, size: 0..500, widget: 'textarea', editable: false
        log nullable: true, size: 0..100000, widget: 'textarea', editable: false

        status nullable: true

        dateCreated display: false
        lastUpdated display: false
    }

    static mapping = {
        table "r_job"
    }

    def log( msg )
    {
        this.log += "\n${msg}"
    }

}

enum JobStatus
{
    CREATED (0),
    STARTED (1),
    PAUSED (2),
    FINISHED (3),
    FAILED (4),
    CANCELED( 5 )

    int id

    def JobStatus( int id )
    {
        this.id = id
    }

    static JobStatus valueOfName( String name )
    {
        values().find { it.name == name }
    }

    static JobStatus valueOf( id )
    {
        values().find { it.id == id }
    }
}

