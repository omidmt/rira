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

    static constraints =
            {
                name blank: false, size: 1..50
                profile nullable: true
                nodeType nullable: false
                serverType nullable: false
                loginMethod nullable: false
                os nullable: false

                active()
                master()

                ip1 nullable: true, validator: { if(it) return InetAddressValidator.getInstance().isValidInet4Address(it) }
                port1 nullable: true //, range: 0..65565

                user1 nullable: true, size: 0..100
                password1 password: true, nullable: true, size: 0..1500
                password1Confirmation password: true, bindable: true, nullable: true, validator: { val, self -> if( (self.password1 || val) && self.isDirty( 'password1' ) ) val && val == self.password1 ? true : ['User.passwordConfirmation.invalid.matchingpasswords'] }
                privateKey1 nullable: true, size: 0..3000
                passphrase1 nullable: true, size: 0..1500, password: true, validator: { val, self -> if( self.privateKey1 && !val ) [ 'Node.passphrase.required' ] }
                publicKey1 nullable: true, size: 0..3000

                ip2 nullable: true, validator: { if(it) return InetAddressValidator.getInstance().isValidInet4Address(it) }
                port2 nullable: true //, range: 0..65565

                user2 nullable: true, size: 0..100
                password2 password: true, nullable: true, size: 0..1500
                password2Confirmation password: true, bindable: true, nullable: true, validator: { val, self -> if( (self.password2 || val) && self.isDirty( 'password2' ) ) val == self.password2 ? true : ['User.passwordConfirmation.invalid.matchingpasswords'] }
                privateKey2 nullable: true, size: 0..3000
                passphrase2 nullable: true, size: 0..1500, password: true
                publicKey2 nullable: true, size: 0..3000

                ip3 nullable: true, validator: { if(it) return InetAddressValidator.getInstance().isValidInet4Address(it) }
                port3 nullable: true //, range: 0..65565

                user3 nullable: true, size: 0..100
                password3 password: true, nullable: true, size: 0..1500
                password3Confirmation password: true, bindable: true, nullable: true, validator: { val, self -> if( (self.password3 || val) && self.isDirty( 'password3' ) ) val == self.password3 ? true : ['User.passwordConfirmation.invalid.matchingpasswords'] }
                privateKey3 nullable: true, size: 0..3000
                passphrase3 nullable: true, size: 0..1500, password: true
                publicKey3 nullable: true, size: 0..3000

                ip4 nullable: true, validator: { if(it) return InetAddressValidator.getInstance().isValidInet4Address(it) }
                port4 nullable: true //, range: 0..65565

                user4 nullable: true, size: 0..100
                password4 password: true, nullable: true, size: 0..1500
                password4Confirmation password: true, bindable: true, nullable: true, validator: { val, self -> if( (self.password4 || val) && self.isDirty( 'password4' ) ) val == self.password4 ? true : ['User.passwordConfirmation.invalid.matchingpasswords'] }
                privateKey4 nullable: true, size: 0..3000
                passphrase4 nullable: true, size: 0..1500, password: true
                publicKey4 nullable: true, size: 0..3000

            }

//    public String getPassword1()
//    {
//        def pass = Encoder.decrypt( this.password1 )
//        log.error "getPass1 ${pass}"
//        return pass
//    }

//    public void setPassword1( String pass )
//    {
//        log.error "setPass1 ${pass}"
//        this.password1 = Encoder.encrypt( pass )
//        log.error "Enc Res ${this.password1}"
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

        if( passphrase1 )
        {
            passphrase1 = Encoder.encrypt( passphrase1 )
        }

        if( passphrase2 )
        {
            passphrase2 = Encoder.encrypt( passphrase2 )
        }

        if( passphrase3 )
        {
            passphrase3 = Encoder.encrypt( passphrase3 )
        }

        if( passphrase4 )
        {
            passphrase4 = Encoder.encrypt( passphrase4 )
        }
    }

    def beforeUpdate()
    {
//        log.info "Pass1 ${password1} ${isDirty( 'password1' )}"
        if( password1 && isDirty( 'password1' ) && password1 == password1Confirmation )
        {
            password1 = Encoder.encrypt( password1 )
            password1Confirmation = password1
        }
        else
        {
            password1 = getPersistentValue( 'password1' )
        }

        if( password2 && isDirty( 'password2' ) && password2 == password2Confirmation )
        {
            password2 = Encoder.encrypt( password2 )
            password2Confirmation = password2
        }
        else
        {
            password2 = getPersistentValue( 'password2' )
        }

        if( password3 && isDirty( 'password3' ) && password3 == password3Confirmation )
        {
            password3 = Encoder.encrypt( password3 )
            password3Confirmation = password3
        }
        else
        {
            password3 = getPersistentValue( 'password3' )
        }

        if( password4 && isDirty( 'password4' ) && password4 == password4Confirmation )
        {
            password4 = Encoder.encrypt( password4 )
            password4Confirmation = password4
        }
        else
        {
            password4 = getPersistentValue( 'password4' )
        }

        if( passphrase1 && isDirty( 'passphrase1' ) )
        {
            passphrase1 = Encoder.encrypt( passphrase1 )
        }
        else
        {
            passphrase1 = getPersistentValue( 'passphrase1' )
        }

        if( passphrase2 && isDirty( 'passphrase2' ) )
        {
            passphrase2 = Encoder.encrypt( passphrase2 )
        }
        else
        {
            passphrase2 = getPersistentValue( 'passphrase2' )
        }

        if( passphrase3 && isDirty( 'passphrase3' ) )
        {
            passphrase3 = Encoder.encrypt( passphrase3 )
        }
        else
        {
            passphrase3 = getPersistentValue( 'passphrase3' )
        }

        if( passphrase4 && isDirty( 'passphrase4' ) )
        {
            passphrase4 = Encoder.encrypt( passphrase4 )
        }
        else
        {
            passphrase4 = getPersistentValue( 'passphrase4' )
        }



//        log.debug "Pass enced ${password1}"
    }

    def getPassword1Decrypted(  )
    {
        if( password1 )
            return Encoder.decrypt( password1 )
        else
            ""
    }

    def getPassword2Decrypted(  )
    {
        if( password2 )
            return Encoder.decrypt( password2 )
        else
            ""
    }

    def getPassword3Decrypted(  )
    {
        if( password3 )
            return Encoder.decrypt( password3 )
        else
            ""
    }

    def getPassword4Decrypted(  )
    {
        if( password4 )
            return Encoder.decrypt( password4 )
        else
            ""
    }

    def getPassphrase1Decrypted(  )
    {
        if( passphrase1 )
            return Encoder.decrypt( passphrase1 )
        else
            ""
    }

    def getPassphrase2Decrypted(  )
    {
        if( passphrase2 )
            return Encoder.decrypt( passphrase2 )
        else
            ""
    }

    def getPassphrase3Decrypted(  )
    {
        if( passphrase3 )
            return Encoder.decrypt( passphrase3 )
        else
            ""
    }

    def getPassphrase4Decrypted(  )
    {
        if( passphrase4 )
            return Encoder.decrypt( passphrase4 )
        else
            ""
    }

//    def beforeValidate()
//    {
//        log.info "Validating..."
//    }

    def String toString()
    {
        return name
    }
}
