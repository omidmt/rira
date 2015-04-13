package mt.omid.rira.ntfy

import grails.util.Holders

class Recipient {

    String name
    String email
    String phone
    String instantMessaging

    static hasMany = [ notifGroup : NotificationGroup ]

    static belongsTo = NotificationGroup

    static constraints = {
        name size: 1..45, blank: false
        email email: true
        phone nullable: true, matches: "[0-9]+"
        instantMessaging nullable: true
    }

    static mapping = {
        table name: 'r_recipient', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    String toString()
    {
        "$email [$phone]"
    }
}
