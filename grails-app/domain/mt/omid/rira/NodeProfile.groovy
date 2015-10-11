package mt.omid.rira

import grails.util.Holders

class NodeProfile {

    String name
    String baseDir
    String defaultGroup
    int defaultGroupId
    String defaultShell

    int defaultPasswordMinAge
    int defaultPasswordMaxAge
    int defaultPasswordWarning

    // Comma separated list of connectivity plan names that nodes may have with this profile
    String defaultConnectivityPlans

    static deletable = true
    static cloneable = true

    private static passwordValidator = { if( it < 0 ) return "Password lifetime must be positive number" }

    static constraints = {
        name unique: true, size: 1..100
        baseDir size: 1..255, widget: 'text'
        defaultGroup size: 1..255, widget: 'text'
        defaultGroupId range: 1..65500
        defaultShell size: 1..255, widget: 'text'

        defaultPasswordMinAge  nullable: true, validator: passwordValidator
        defaultPasswordMaxAge  nullable: true, validator: passwordValidator
        defaultPasswordWarning nullable: true, validator: passwordValidator

        defaultConnectivityPlans nullable: true, size: 0..1500 // comma separated list
    }

    String toString()
    {
        name
    }

    static mapping = {
        table name: 'r_node_profile', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }
}
