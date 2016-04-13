package mt.omid.rira

import grails.util.Holders
import mt.omid.rira.utils.LoginMethod
import org.codehaus.groovy.grails.validation.routines.InetAddressValidator

class ConnectivityPlan {

    def securityService

    String name
    String ip
    int port
    String user
    String password
    String passwordConfirmation
    String publicKey
    String privateKey
    String passphrase
    LoginMethod loginMethod

    Date dateCreated
    Date lastUpdated

    static deletable = true
    static cloneable = true

    static transients = [ 'passwordConfirmation' ]

    static belongsTo = [ node: Node ]

    static inetAddressValidator = { if( it ) return InetAddressValidator.instance.isValidInet4Address( it ) }

    static constraints = {

        name blank: false, size: 1..100
        ip nullable: true, validator: inetAddressValidator
        port nullable: true, validator: { val -> if( val < 0 || val > 65535 ) return "Port must be in the range of 0-65535" }
        loginMethod()

        user nullable: true, size: 0..100
        password password: true, nullable: true, size: 0..1500
        passwordConfirmation password: true, bindable: true, nullable: true,
                             validator: { val, self -> if( (self.password || val) && self.isDirty( 'password' ) ) val && val == self.password ? true : ['User.passwordConfirmation.invalid.matchingpasswords'] }
        privateKey nullable: true, size: 0..3000, widget: 'textarea'
        passphrase nullable: true, size: 0..1500, password: true, validator: { val, self -> if( self.privateKey && !val ) [ 'Node.passphrase.required' ] }
        publicKey nullable: true, size: 0..3000, widget: 'textarea'
        node nullable: true

        securityService display: false
    }

    static mapping ={
        table name: 'r_connectivity_plan', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
        user column: '[user]'
    }

    def beforeInsert()
    {
        if( password && password == passwordConfirmation )
        {
            password = securityService.encryptAES( password )
            passwordConfirmation = password
        }

        passphrase = encrypt( passphrase )

    }

    def beforeUpdate()
    {
//        log.info "Pass $password ${isDirty( 'password' )}"
        encryptPasswordAndConfirmation 'password'

        passphrase = encryptOrGetPersistentValue( passphrase, 'passphrase' )
//        log.debug "Pass enced $password"
    }

    def afterUpdate = this.&afterInsert
    def afterDelete = this.&afterInsert

    def afterInsert()
    {
        Node.refreshIPCache()
    }

    String getPasswordDecrypted(  )
    {
        decrypt password
    }

    String getPassphraseDecrypted(  )
    {
        decrypt passphrase
    }

    String toString()
    {
        "${node?.name}-${name}"
    }

    private String decrypt(String s)
    {
        s ? securityService.decryptAES(s) : ''
    }

    private String encrypt(String s)
    {
        s ? securityService.encryptAES(s) : s
    }

    private String encryptOrGetPersistentValue( String passphrase, String name )
    {
        passphrase && isDirty(name) ? securityService.encryptAES(passphrase) : getPersistentValue(name)
    }

    private void encryptPasswordAndConfirmation(String passwordName)
    {
        String password = this."$passwordName"
        String passwordConfirmation = this."${passwordName}Confirmation"
        if (password && isDirty(passwordName) && password == passwordConfirmation) {
            this."$passwordName" = this."${passwordName}Confirmation" = securityService.encryptAES(password)
        }
        else {
            this."$passwordName" = getPersistentValue(passwordName)
        }
    }
}
