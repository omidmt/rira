package mt.omid.rira.ntfy

class NotificationGroup {

    String name

    static hasMany = [  recipients : Recipient ]

    static constraints = {
        name size: 1..100
    }

    static mapping = {
        recipients cascade: 'all'
    }

    String toString()
    {
        name
    }
}
