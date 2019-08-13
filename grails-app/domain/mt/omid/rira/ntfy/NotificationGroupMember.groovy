package mt.omid.rira.ntfy

class NotificationGroupMember implements Serializable {

    static belongsTo = [notificationGroup: NotificationGroup, recipient: Recipient]

    static constraints = {
        notificationGroup nullable: false
        recipient nullable: false
    }

    static mapping = {
        version false
        recipient column: 'recipient_id', index: 'recipient_idx'
        id composite: ['notificationGroup', 'recipient']
        table 'r_notificationgroup_members'
    }

    String toString() {
        "${notificationGroup} - ${recipient}"
    }
}
