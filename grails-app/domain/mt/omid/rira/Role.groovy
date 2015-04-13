package mt.omid.rira

import grails.util.Holders

class Role {

    String name

    static hasMany = [ rights : Right ]
//    static belongsTo = User

    static constraints = {
        name size: 1..100, unique: true, blank: false
        rights nullable: true
    }

    static mapping = {
        table name: 'r_role', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    String toString()
    {
        name
    }
}
