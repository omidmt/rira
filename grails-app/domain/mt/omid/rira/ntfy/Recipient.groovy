package mt.omid.rira.ntfy

import grails.util.Holders

class Recipient {

    String name
    String email
    String phone
    String instantMessaging

    static deletable = true
    static cloneable = true

    static hasMany = [ groups : NotificationGroupMember ]

    static transients = ['notifGroup']

    static constraints = {
        name size: 1..45, blank: false, unique: true
        email email: true
        phone nullable: true, matches: "[0-9]+"
        instantMessaging nullable: true
    }

    static mapping = {
        table name: 'r_recipient', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    String toString() {
        "$email [$phone]"
    }

    def getNotifGroup() {
        groups.findAll()*.notificationGroup
    }
}
