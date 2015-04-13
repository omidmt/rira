package mt.omid.rira.ntfy

import grails.util.Holders

class NotificationGroup {

    String name

    static hasMany = [  recipients : Recipient ]

    static constraints = {
        name size: 1..100
    }

    static mapping = {
        recipients cascade: 'all'
        table name: 'r_notification_group', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    String toString()
    {
        name
    }
}
