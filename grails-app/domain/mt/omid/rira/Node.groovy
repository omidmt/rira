package mt.omid.rira

import grails.util.Holders
import mt.omid.rira.utils.LoginMethod
import mt.omid.rira.utils.NodeType
import mt.omid.rira.utils.OS
import mt.omid.rira.utils.ServerType
import mt.omid.rira.utils.security.Encoder
import org.codehaus.groovy.grails.validation.routines.InetAddressValidator

class Node
{
    String name
    NodeProfile profile

    NodeType nodeType
    ServerType serverType
    OS os

    boolean active
    boolean master

    Date dateCreated
    Date lastUpdated

    static hasMany = [ connectivityPlans: ConnectivityPlan ]

    static constraints =
    {
        name blank: false, size: 1..50
        profile nullable: true

        active()
        master()
    }

    static mapping = {
        active defaultValue: 'true'
        master defaultValue: 'false'
        profile lazy: false
        connectivityPlans lazy: false
        table name: 'r_node', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    String toString()
    {
        name
    }
}
