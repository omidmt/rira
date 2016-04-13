package mt.omid.rira.ntfy

import grails.util.Holders

class NotificationHistory {

    String message
    String user
    Date   sendDate
    String recipients

    static deletable = true

    static constraints =
    {
        user blank: false, size: 1..50
        message blank: false, size: 1..1000
        recipients blank: false, size: 1..2000
    }

    static mapping =
    {
        if(Holders.grailsApplication.mergedConfig.grails.plugin.rira.mssqlserver) {
            sendDate defaultValue: "GETDATE()"
            user column: '[user]'
        }
        else
            sendDate defaultValue: "now()"
        version false
        sort sendDate: "desc"
        table name: 'r_notification_history', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    String toString()
    {
        "$sendDate ${message.take( 50 )}"
    }
}
