package mt.omid.rira

import grails.util.Holders

class NodeType {

    String name

    static cloneable = true
    static deletable = true

    static hasMany = [modules: Module]

    static constraints = {
        name unique: true, size: 1..20
        modules()
    }

    static mapping = {
        table name: 'r_node_type', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
        modules lazy: false
    }

    public String toString() {
        name
    }
}
