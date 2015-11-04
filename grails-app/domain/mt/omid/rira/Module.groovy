package mt.omid.rira

import grails.util.Holders

class Module {

    String name

    static constraints = {
        name unique: true, size: 1..20
    }

    static mapping = {
        table name: 'r_module', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }
}
