package mt.omid.rira

import grails.util.Holders

class Invitation {

    String uid
    String email
    String name
    String invitee
    Role role
    Date accountExpiry
    Date expiry
    boolean used

    Date dateCreated

    static cloneable = true
    static deletable = true

    static constraints = {
        uid display: false, size: 1..200, unique: true
        name size: 2..50
        email email: true, unique: true
        accountExpiry nullable: true
        role nullable: true
        invitee size: 1..150, display: false
        expiry display: false
        used display: false
    }

    static mapping = {
        table name: 'r_invitation', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    String toString() {
        "$email"
    }
}
