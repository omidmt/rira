package mt.omid.rira

import grails.util.Holders

class Audit {

    Date dateTime
    String user
    String origin
    String message

    static constraints = {
        dateTime()
        user nullable: true, size: 1..100
        origin nullable: true,  size: 1..100
        message nullable: true, size: 1..2000
    }

    static mapping = {
        table name: 'r_audit', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
        user column: '[user]'
    }
}
