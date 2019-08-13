package mt.omid.rira.ntfy

import grails.util.Holders

class Template {

    String name
    String content

    static deletable = true
    static cloneable = true

    static constraints = {
        name blank: false, size: 1..100
        content blank: false, size: 1..100000
    }

    String toString()
    {
        name
    }

    static mapping = {
        table name: 'r_template', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }
}
