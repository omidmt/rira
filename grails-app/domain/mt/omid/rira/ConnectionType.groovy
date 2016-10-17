package mt.omid.rira

import grails.util.Holders

class ConnectionType {

    String name

    static constraints = {
        name size: 1..100, blank: false
    }

    static mapping ={
        table name: 'r_connection_type', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    public String toString() {
        name
    }
}
