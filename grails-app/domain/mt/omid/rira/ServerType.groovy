package mt.omid.rira

import grails.util.Holders

class ServerType {

    String name

    static cloneable = true
    static deletable = true

    static constraints = {
        name unique: true, size: 1..20
    }

    static mapping = {
        table name: 'r_server_type', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    public String toString() {
        name
    }
}
