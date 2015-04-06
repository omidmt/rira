package mt.omid.rira.ntfy

class NotificationHistory {

    String message
    String user
    Date   sendDate
    String recipients;

    static constraints =
            {
                user blank: false, size: 1..50
                message blank: false, size: 1..1000
                recipients blank: false, size: 1..2000
            }

    static mapping =
            {
                sendDate defaultValue: "now()"
                version( false )
                sort sendDate: "desc"
            }

    def public String toString()
    {
        return "${sendDate} ${message.take( 50 )}";
    }
}
