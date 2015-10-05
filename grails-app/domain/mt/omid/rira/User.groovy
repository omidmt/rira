package mt.omid.rira

import grails.util.Holders
import mt.omid.rira.ntfy.NotificationGroup

import java.security.MessageDigest

class User {

    String email
    String name
    String description
    String password
    String passwordConfirmation
    String passwd
    String salt
    String phone
    String instantMessaging

    Date accountExpiry
    Date passwordExpiry
    Date lastLogin

    boolean locked
    boolean forcePasswordChange
    int failedLogins

    static hasMany = [ roles : Role, notifGroup: NotificationGroup ]

    static belongsTo = [ NotificationGroup ]

    Date dateCreated
    Date lastUpdated

    static transients = [ 'password', 'passwordConfirmation' ]

    static constraints = {
        name blank: false, size: 1..100
        email email: true, unique: true, blank: false

        password size: 8..255, password: true, bindable: true, nullable: true, validator: { val, self ->
            // Is it update ?
            if( self.id )
            {
                if( val )
                {
                    self.version += 1
                    if( !( val ==~ Konfig.KONFIGS.passwordComplexity ) )
                    {
                        // log.error "Validating password [${val ==~ Konfig.KONFIGS.passwordComplexity}]"
                        return [ 'User.password.complexity.mismatch' ]
                    }
                }
                return
            }

            if( val )
            {
                if( !( val ==~ Konfig.KONFIGS.passwordComplexity ) )
                {
                    // log.error "Validating password [${val ==~ Konfig.KONFIGS.passwordComplexity}]"
                    return ['User.password.complexity.mismatch']
                }
                return
            }

            return [ 'default.blank.message' ]
        }

        passwordConfirmation password: true, bindable: true, nullable: true, validator: { val, self ->
            val == self.password ? true : [ 'User.passwordConfirmation.invalid.matchingpasswords' ]
        }

        passwd size: 0..100, display: false, bindable: false, nullable: true

        description nullable: true, size: 0..1000

        accountExpiry nullable: true
        passwordExpiry nullable: true
        lastLogin nullable: true, editable: false, bindable: false

        salt size: 1..1500, display: false, bindable: false, nullable: true // Must Be Cleared

        locked()
        failedLogins editable: false, bindable: false
        forcePasswordChange()

        phone blank:false, matches: "[0-9]+", nullable: true
        instantMessaging nullable: true

        applicos display: false, nullable: true
        rights display: false, nullable: true
    }

    static mapping = {
        passwd defaultValue: "'NP'"
        locked defaultValue: 'false'
        failedLogins defaultValue: '0'
        forcePasswordChange defaulValue: 'false'
        table name: "r_user", schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

//    static mappedBy = [ roles: "members" ]

    String toString()
    {
        "$name [$email]"
    }

    def beforeInsert()
    {
//        log.info( "Before insert, encode password" )
        email = email.toLowerCase()
        encodePassword()
    }

    def beforeUpdate()
    {
//        log.debug "Is password dirty ? ${isDirty( 'password' )}"
        email = email.toLowerCase()

        // encode password to passwd if it is present in request
        if( password )
            encodePassword()

//        if( isDirty( 'password' ) )
//        {
//            log.error "Password is dirty, encode it"
//            encodePassword()
//        }
    }

    protected void encodePassword()
    {
        salt = makeSalt()
        passwd = encode "Password: $password $salt"
    }

    protected String makeSalt()
    {
//        encode "SALTe"
        encode "${System.currentTimeMillis()}--Omid--$password"
    }

    protected String encode( String msg )
    {
        MessageDigest md = MessageDigest.getInstance( "SHA-512" )
        md.update( msg.bytes )
        return md.digest().encodeBase64()
    }

    static authenticate( String username, String password )
    {
        def user = User.findByEmailIlike( username )

        if( ! user )
            return null

        if( user.hasPassword( password ) )
            return user.clearLoginFailed()

        user.loginFailed()
    }

    static boolean authenticateWithSalt( id, salt )
    {
        def user = User.findById( id )
        return ( user && user.salt == salt && !user.locked && ( user.accountExpiry ? user.accountExpiry.after(new Date()) : true ) ) ? user : null
    }

    boolean hasPassword( pass )
    {
        passwd == encode( "Password: $pass $salt" )
    }

    def clearLoginFailed()
    {
        failedLogins = 0

        if( isDirty() )
            save()
        return this
    }

    def loginFailed()
    {
        failedLogins ++

        // bypass if konfig is zero, means no fail checking
        if( Konfig.KONFIGS [ 'allowedFailedLogin' ] != 0 && failedLogins > Konfig.KONFIGS [ 'allowedFailedLogin' ] )
            locked = true

        save()
        return null
    }

    def getRights()
    {
        roles.rights.flatten()
    }

    def getApplicos()
    {
        roles.rights.flatten().applico - null
    }
}
