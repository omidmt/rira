package mt.omid.rira

import grails.util.Holders

class Job
{
    String name
    String description

    String log = ''
    String logFileName
    File logFile

    JobStatus status

    Date startTime
    Date endTime

    Date dateCreated
    Date lastUpdated

    static deletable = true
    static cloneable = true // fields like log, time should be cleaned

    static transients = ['logFile']

    static constraints = {

        name size: 1..50
        description nullable: true, size: 0..500, widget: 'textarea', editable: false
        log nullable: true, size: 0..100000, widget: 'textarea', editable: false
        logFileName nullable: true, size: 0..1000, widget: 'textarea', editable: false

        status nullable: true

        dateCreated display: false
        lastUpdated display: false

        startTime nullable: true
        endTime nullable: true
    }

    static mapping = {
        table name: "r_job", schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    void log( msg )
    {
        if(logFileName) {
            if(!logFile)
                logFile = new File("${Konfig.KONFIGS.jobLogDir}/${logFileName}")
            logFile.append(msg)
        }
        else {
            log += "\n$msg"
        }
    }

    def runNow(Closure cls) {
        cls.delegate = this
        ClosureJob.triggerNow([runnableClosure: cls])
        this.log("Job triggered")
        this.save(flush: true)
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
