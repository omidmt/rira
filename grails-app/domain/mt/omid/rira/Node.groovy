package mt.omid.rira

import grails.util.Holders
import groovy.util.logging.Slf4j
import mt.omid.rira.utils.NodeType
import mt.omid.rira.utils.OS
import mt.omid.rira.utils.ServerType

@Slf4j
class Node
{
    static NODES = [:]
    static NODES_IP = [:]

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

    static clonnable = true

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

    def static refreshCache()
    {
        log.info "Refreshing NODES Cache"
        NODES.clear()

        Node.all.each { node ->
            NODES[ node.name.toLowerCase() ] = node
        }
        refreshIPCache()
    }

    def static refreshIPCache()
    {
        log.info "Refreshing NODES_IP Cache"
        NODES_IP.clear()

        Node.all.each { node ->
            NODES_IP[ node.name.toLowerCase() ] = []
            node.connectivityPlans.each { cp ->
                NODES_IP[ node.name.toLowerCase() ] << cp.ip
            }
        }
    }

    def afterUpdate = this.&afterInsert
    def afterDelete = this.&afterInsert

    def afterInsert()
    {
        refreshCache()
    }
}
