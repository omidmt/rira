package mt.omid.rira

import mt.omid.rira.utils.LoginMethod
import mt.omid.rira.utils.NodeType
import mt.omid.rira.utils.OS
import mt.omid.rira.utils.ServerType
import mt.omid.rira.utils.security.Encoder
import org.codehaus.groovy.grails.validation.routines.InetAddressValidator

class Node
{
    String name
    NodeProfile profile

    String ip1, ip2, ip3, ip4
    int port1, port2, port3, port4

    String user1
    String password1
    String user2, password2, user3, password3, user4, password4
    String password1Confirmation, password2Confirmation, password3Confirmation, password4Confirmation
    String publicKey1, publicKey2, publicKey3, publicKey4
    String privateKey1, privateKey2, privateKey3, privateKey4
    String passphrase1, passphrase2, passphrase3, passphrase4

    NodeType nodeType
    ServerType serverType
    LoginMethod loginMethod
    OS os

    boolean active
    boolean master

    Date dateCreated
    Date lastUpdated

    static transients = [ 'password1Confirmation', 'password2Confirmation', 'password3Confirmation', 'password4Confirmation' ]

    static inetAddressValidator = { if(it) return InetAddressValidator.instance.isValidInet4Address(it) }

    static constraints =
    {
        name blank: false, size: 1..50
        profile nullable: true

        active()
        master()

        ip1 nullable: true, validator: inetAddressValidator
        port1 nullable: true //, range: 0..65565

        user1 nullable: true, size: 0..100
        password1 password: true, nullable: true, size: 0..1500
        password1Confirmation password: true, bindable: true, nullable: true, validator: { val, self -> if( (self.password1 || val) && self.isDirty( 'password1' ) ) val && val == self.password1 ? true : ['User.passwordConfirmation.invalid.matchingpasswords'] }
        privateKey1 nullable: true, size: 0..3000
        passphrase1 nullable: true, size: 0..1500, password: true, validator: { val, self -> if( self.privateKey1 && !val ) [ 'Node.passphrase.required' ] }
        publicKey1 nullable: true, size: 0..3000

        ip2 nullable: true, validator: inetAddressValidator
        port2 nullable: true //, range: 0..65565

        user2 nullable: true, size: 0..100
        password2 password: true, nullable: true, size: 0..1500
        password2Confirmation password: true, bindable: true, nullable: true, validator: { val, self -> if( (self.password2 || val) && self.isDirty( 'password2' ) ) val == self.password2 ? true : ['User.passwordConfirmation.invalid.matchingpasswords'] }
        privateKey2 nullable: true, size: 0..3000
        passphrase2 nullable: true, size: 0..1500, password: true
        publicKey2 nullable: true, size: 0..3000

        ip3 nullable: true, validator: inetAddressValidator
        port3 nullable: true //, range: 0..65565

        user3 nullable: true, size: 0..100
        password3 password: true, nullable: true, size: 0..1500
        password3Confirmation password: true, bindable: true, nullable: true, validator: { val, self -> if( (self.password3 || val) && self.isDirty( 'password3' ) ) val == self.password3 ? true : ['User.passwordConfirmation.invalid.matchingpasswords'] }
        privateKey3 nullable: true, size: 0..3000
        passphrase3 nullable: true, size: 0..1500, password: true
        publicKey3 nullable: true, size: 0..3000

        ip4 nullable: true, validator: inetAddressValidator
        port4 nullable: true //, range: 0..65565

        user4 nullable: true, size: 0..100
        password4 password: true, nullable: true, size: 0..1500
        password4Confirmation password: true, bindable: true, nullable: true, validator: { val, self -> if( (self.password4 || val) && self.isDirty( 'password4' ) ) val == self.password4 ? true : ['User.passwordConfirmation.invalid.matchingpasswords'] }
        privateKey4 nullable: true, size: 0..3000
        passphrase4 nullable: true, size: 0..1500, password: true
        publicKey4 nullable: true, size: 0..3000
    }

//    String getPassword1()
//    {
//        def pass = Encoder.decrypt( password1 )
//        log.error "getPass1 $pass"
//        return pass
//    }

//    void setPassword1( String pass )
//    {
//        log.error "setPass1 $pass"
//        password1 = Encoder.encrypt( pass )
//        log.error "Enc Res $password1"
//    }

    static mapping =
    {
        active defaultValue: 'true'
        master defaultValue: 'false'
        profile lazy: false
    }

    def beforeInsert()
    {
        if( password1 && password1 == password1Confirmation )
        {
            password1 = Encoder.encrypt( password1 )
            password1Confirmation = password1
        }

        if( password2 && password2 == password2Confirmation )
        {
            password2 = Encoder.encrypt( password2 )
            password2Confirmation = password2
        }

        if( password3 && password3 == password3Confirmation )
        {
            password3 = Encoder.encrypt( password3 )
            password3Confirmation = password3
        }

        if( password4 && password4 == password4Confirmation )
        {
            password4 = Encoder.encrypt( password4 )
            password4Confirmation = password4
        }

        passphrase1 = encrypt( passphrase1 )
        passphrase2 = encrypt( passphrase2 )
        passphrase3 = encrypt( passphrase3 )
        passphrase4 = encrypt( passphrase4 )
    }

    def beforeUpdate()
    {
//        log.info "Pass1 $password1 ${isDirty( 'password1' )}"
        encryptPasswordAndConfirmation 'password1'
        encryptPasswordAndConfirmation 'password2'
        encryptPasswordAndConfirmation 'password3'
        encryptPasswordAndConfirmation 'password4'

        passphrase1 = encryptOrGetPersistentValue(passphrase1, 'passphrase1')
        passphrase2 = encryptOrGetPersistentValue(passphrase2, 'passphrase2')
        passphrase3 = encryptOrGetPersistentValue(passphrase3, 'passphrase3')
        passphrase4 = encryptOrGetPersistentValue(passphrase4, 'passphrase4')

//        log.debug "Pass enced $password1"
    }

    String getPassword1Decrypted(  )
    {
        decrypt password1
    }

    String getPassword2Decrypted(  )
    {
        decrypt password2
    }

    String getPassword3Decrypted(  )
    {
        decrypt password3
    }

    String getPassword4Decrypted(  )
    {
        decrypt password4
    }

    String getPassphrase1Decrypted(  )
    {
        decrypt passphrase1
    }

    String getPassphrase2Decrypted(  )
    {
        decrypt passphrase2
    }

    String getPassphrase3Decrypted(  )
    {
        decrypt passphrase3
    }

    String getPassphrase4Decrypted(  )
    {
        decrypt passphrase4
    }

//    def beforeValidate()
//    {
//        log.info "Validating..."
//    }

    String toString()
    {
        name
    }

    private String decrypt(String s) {
        s ? Encoder.decrypt(s) : ''
    }

    private String encrypt(String s) {
        s ? Encoder.encrypt(s) : s
    }

    private String encryptOrGetPersistentValue(String passphrase, String name) {
        passphrase && isDirty(name) ? Encoder.encrypt(passphrase) : getPersistentValue(name)
    }

    private void encryptPasswordAndConfirmation(String passwordName) {
        String password = this."$passwordName"
        String passwordConfirmation = this."${passwordName}Confirmation"
        if (password && isDirty(passwordName) && password == passwordConfirmation) {
            this."$passwordName" = this."${passwordName}Confirmation" = Encoder.encrypt(password)
        }
        else {
            this."$passwordName" = getPersistentValue(passwordName)
        }
    }
}
