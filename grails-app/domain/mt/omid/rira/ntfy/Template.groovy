package mt.omid.rira.ntfy

import grails.util.Holders

class Template {

    String name
    String content

    static constraints = {
        name blank: false, size: 1..100
        content blank: false, size: 1..1000
    }

    String toString()
    {
        name
    }

    static mapping = {
        table name: 'r_template', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }
}
