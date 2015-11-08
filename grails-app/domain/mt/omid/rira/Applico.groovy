package mt.omid.rira

import grails.util.Holders

class Applico {

    String name
    String description
    String iconPath
    String path
    String family

    String server
    String port
    String context

    static deletable = true
    static cloneable = true

    static constraints = {
        name blank: false, size: 1..50
        path blank: false, size: 1..255
        description nullable: true, size: 0..500
        iconPath nullable: true, size: 0..255
        family nullable: true, size: 0..50

        server nullable: true, size: 0..100
        port nullable: true, size: 0..5
        context nullable: true, size: 0..100
    }

    String toString()
    {
        "$name [$path]"
    }

    static mapping = {
        table name:'r_applico', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }
}
