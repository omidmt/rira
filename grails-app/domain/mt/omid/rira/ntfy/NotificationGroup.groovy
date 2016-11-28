package mt.omid.rira.ntfy

import grails.util.Holders

class NotificationGroup {

    String name

    static deletable = true

    static hasMany = [ members : NotificationGroupMember ]

    static transients = ['recipients']

    static constraints = {
        name size: 1..100, unique: true
    }

    static mapping = {
        table name: 'r_notification_group', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    String toString()
    {
        name
    }

    def getRecipients() {
        members.findAll()*.recipient
    }
}
