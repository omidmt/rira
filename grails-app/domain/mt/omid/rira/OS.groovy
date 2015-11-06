package mt.omid.rira

import grails.util.Holders

class OS {

    String name

    static cloneable = true
    static deletable = true

    static constraints = {
        name size: 1..20, unique: true
    }

    static mapping = {
        table name: 'r_os', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    public String toString() {
        name
    }
}
