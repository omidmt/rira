package mt.omid.rira.ntfy

class NotificationGroup {

    String name

//    users : User,
    static hasMany = [  recipients : Recipient ]

    static constraints = {
        name size: 1..100
//        users nullable: true
        recipients nullable: true
    }

    static mapping = {
        recipients cascade: 'all'
    }

    public String toString()
    {
        return name
    }
}
