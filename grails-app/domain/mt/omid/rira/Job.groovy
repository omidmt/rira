package mt.omid.rira

import grails.util.Holders

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

    static deletable = true
    static cloneable = true // fields like log, time should be cleaned

    static constraints = {

        name size: 1..50
        description nullable: true, size: 0..500, widget: 'textarea', editable: false
        log nullable: true, size: 0..100000, widget: 'textarea', editable: false

        status nullable: true

        dateCreated display: false
        lastUpdated display: false
    }

    static mapping = {
        table name: "r_job", schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    void log( msg )
    {
        log += "\n$msg"
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

    final int id

    private JobStatus( int id )
    {
        this.id = id
    }

    static JobStatus valueOfName( String name )
    {
        values().find { it.name() == name }
    }

    static JobStatus valueOf( id )
    {
        values().find { it.id == id }
    }
}
