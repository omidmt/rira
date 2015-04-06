package mt.omid.rira

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
        name nullable: false, blank: false, size: 1..100
        email email: true, unique: true, blank: false

        password size: 8..255, password: true, bindable: true, nullable: true,
                validator:
                        {
                            val, self ->

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
                                else
                                {
                                    if( val )
                                    {
                                        if( !( val ==~ Konfig.KONFIGS.passwordComplexity ) )
                                        {
                                            // log.error "Validating password [${val ==~ Konfig.KONFIGS.passwordComplexity}]"
                                            return ['User.password.complexity.mismatch']
                                        }
                                        return
                                    }
                                    else
                                        return [ 'default.blank.message' ]
                                }
                        }
        passwordConfirmation password: true, bindable: true, nullable: true,
                validator:
                        {
                            val, self ->
                                val == self.password ? true : [ 'User.passwordConfirmation.invalid.matchingpasswords' ]
                        }

        passwd size: 0..100, display: false, bindable: false, nullable: true

        description nullable: true, size: 0..1000

        accountExpiry nullable: true
        passwordExpiry nullable: true
        lastLogin nullable: true, editable: false, bindable: false

        salt size: 1..1500, display: false, bindable: false, nullable: true // Must Be Cleared

        locked nullable: true
        failedLogins editable: false, bindable: false
        forcePasswordChange()

        roles nullable: true
        notifGroup nullable: true
        phone blank:false, matches: "[0-9]+", nullable: true
        instantMessaging nullable: true
    }

    static mapping = {
        passwd defaultValue: "'NP'"
        locked defaultValue: 'false'
        failedLogins defaultValue: '0'
        forcePasswordChange defaulValue: 'false'
        table "r_user"
    }

//    static mappedBy = [ roles: "members" ]

    public String toString()
    {
        return "${this.name} [${this.email}]"
    }

    def beforeInsert()
    {
//        log.info( "Before insert, encode password" )
        encodePassword()
    }

    def beforeUpdate()
    {
//        log.debug "Is password dirty ? ${isDirty( 'password' )}"

        // encode password to passwd if it is present in request
        if( password )
            encodePassword()

//        if( isDirty( 'password' ) )
//        {
//            log.error "Password is dirty, encode it"
//            encodePassword()
//        }
    }

    protected def encodePassword()
    {
        this.salt = makeSalt()
        this.passwd = encode "Password: ${this.password} ${salt}"
    }

    protected def makeSalt()
    {
//        encode "SALTe"
        encode "${(new Date()).getTime()}--Omid--${password}"
    }

    protected encode( String msg )
    {
        MessageDigest md = MessageDigest.getInstance( "SHA-512" )
        md.update( msg.getBytes() )
        return (String) md.digest().encodeBase64()
    }

    def static authenticate( String username, String password )
    {
        def user = User.findByEmailIlike( username )

        if( ! user )
            return null

        if( user.hasPassword( password ) )
            return user.clearLoginFailed()
        else
            user.loginFailed()
    }

    def static authenticateWithSalt( id, salt )
    {
        def user = User.findById( id )
        return ( user && user.salt == salt && !user.locked && ( user.accountExpiry ? user.accountExpiry > new Date() : true ) ) ? user : null
    }


    def hasPassword( pass )
    {
        passwd == encode( "Password: ${pass} ${salt}" )
    }

    def clearLoginFailed()
    {
        this.failedLogins = 0

        if( this.isDirty() )
            this.save()
        return this
    }

    def loginFailed()
    {
        this.failedLogins += 1

        // bypass if konfig is zero, means no fail checking
        if( Konfig.KONFIGS [ 'allowedFailedLogin' ] != 0 && this.failedLogins > Konfig.KONFIGS [ 'allowedFailedLogin' ] )
            this.locked = true

        this.save()
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
