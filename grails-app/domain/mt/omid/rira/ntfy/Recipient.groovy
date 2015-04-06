package mt.omid.rira.ntfy

class Recipient {

    String name
    String email
    String phone
    String instantMessaging

    static hasMany = [ notifGroup : NotificationGroup ]

    static belongsTo = NotificationGroup

    static constraints = {
        name size: 1..45, blank: false, nullable: false
        email email: true, nullable: false
        phone nullable: true, matches: "[0-9]+"
        instantMessaging nullable: true
    }

    public String toString()
    {
        return "${email} [${phone}]"
    }
}
