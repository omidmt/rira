package mt.omid.rira

import grails.util.Holders

class Right {

    String act
    String ctrl
    Applico applico

    static deletable = true
    static cloneable = true

    static constraints = {
        act blank: false
        ctrl blank: false
        applico nullable: true
    }

//    static hasMany = [ roles: Role ]

//    static belongsTo = [ Role ]

    static mapping = {
        table name: 'r_right', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    String toString()
    {
        "$ctrl/$act"
    }
}
