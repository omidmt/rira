package mt.omid.rira

import grails.util.Holders
import groovy.util.logging.Slf4j
import mt.omid.rira.utils.KonfigConvertorFinder
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.codehaus.groovy.grails.plugins.GrailsPlugin

@Slf4j
class Konfig
{
    static KONFIGS = [:]
    static EXTERNAL_KONFIG_CLASSES = []

    public static boolean debug = false

    String key
    String value
    String group
    Date dateCreated
    Date lastUpdated

    static deletable = true
    static cloneable = true

    static constraints = {
        key blank: false, size: 1..200
        value size: 0..1000
        group nullable: true
    }

    static mapping = {
        key column: 'K'
        value column: 'V'
        group column: 'G'
        table name: 'r_konfig', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
    }

    static initKonfig()
    {
        findExternalConverters()
        refreshCache()
    }

    static refreshCache()
    {
        log.info "Initializing KONFIGS"
        synchronized ( KONFIGS ) {
            KONFIGS.clear()

            Konfig.all.each {
                KONFIGS[it.key] = it.value
            }
            convertValues()
        }

        convertExternalValues()
    }

    static convertValues()
    {
        log.info( "Converting KONFIGS values" )
        KONFIGS.debug = new Boolean( KONFIGS.debug )
        if( KONFIGS.debug ) {
            Logger.getLogger( "grails.app.services.mt.omid" ).setLevel( Level.DEBUG )
            Logger.getLogger( "mt.omid" ).setLevel( Level.DEBUG )
        }
        else {
            Logger.getLogger( "grails.app.services.mt.omid" ).setLevel( Level.ERROR )
            Logger.getLogger( "mt.omid" ).setLevel( Level.ERROR )
        }
        Konfig.debug = KONFIGS.debug

        KONFIGS.appName = KONFIGS.appName ?: Holders.grailsApplication.mergedConfig.grails.plugin.rira.appName

        if(!KONFIGS.localAddress) try { KONFIGS.localAddress = java.net.InetAddress.getLocalHost().getHostAddress() } catch(e) { log.error("Setting localAddress Konfig failed: " + e.message) }

        KONFIGS.StrictHostKeyChecking = ( KONFIGS.StrictHostKeyChecking?.toLowerCase() == 'yes' || KONFIGS.StrictHostKeyChecking?.toLowerCase() == 'no' ) ? KONFIGS.StrictHostKeyChecking : 'no'

        KONFIGS.allowedFailedLogin = KONFIGS.allowedFailedLogin?.isInteger() ? KONFIGS.allowedFailedLogin as int : 0

        KONFIGS.sessionInactivityTimeout = KONFIGS.sessionInactivityTimeout?.isInteger() ? KONFIGS.sessionInactivityTimeout as int : 3600

        KONFIGS.defaultHome = KONFIGS.defaultHome ?: '/home'

        KONFIGS.strictAuthorization = new Boolean( KONFIGS.strictAuthorization )

        // Pattern in config shouldn't be enclosed in // when defining as string
        KONFIGS.passwordComplexity = KONFIGS.passwordComplexity ? /$Konfig.KONFIGS.passwordComplexity/ : /^.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*[\W])(?=.*[\d]).*$/

        KONFIGS.muPasswordComplexity = KONFIGS.muPasswordComplexity ?: /^.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*[\W])(?=.*[\d]).*$/

        KONFIGS.passwordExpiryExtension = KONFIGS.passwordExpiryExtension?.isInteger() ? KONFIGS.passwordExpiryExtension : 90

        KONFIGS.sqlLimit = KONFIGS.sqlLimit ?: 'limit 50000'

        def mailConfig = [ grails: [ mail: [:] ]  ]
        KONFIGS.smtpServer = KONFIGS.smtpServer ?: 'localhost'
        mailConfig.grails.mail.host = KONFIGS.smtpServer

        KONFIGS.smtpPort = KONFIGS.smtpPort ?: 25
        mailConfig.grails.mail.port = KONFIGS.smtpPort

        KONFIGS.smtpUser = KONFIGS.smtpUser ?: ''
        mailConfig.grails.mail.username = KONFIGS.smtpUser

        KONFIGS.smtpPassword = KONFIGS.smtpPassword ?: ''
        mailConfig.grails.mail.password = KONFIGS.smtpPassword

        KONFIGS.mailFromAddress = KONFIGS.mailFromAddress ?: 'radmin@rira.app'

        try{ Holders.pluginManager.getGrailsPlugin('mail').notifyOfEvent(GrailsPlugin.EVENT_ON_CONFIG_CHANGE, mailConfig) }
        catch(e){ log.error( "Reconfiguring mail plugin failed: " + e.message ) }

        KONFIGS.sendPasswordInMail = new Boolean(KONFIGS.sendPasswordInMail)

        KONFIGS.pemPrivateKey = KONFIGS.pemPrivateKey ?: """-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA1zPgYpxg5e8h7+FITvtzcBOblXSHVzyyoX1gCvTsFR9Q5FJ+
ITBV/R3rflRpOaxQIA2cXElJx2foOK5BiDtvBWsbuSOXmPZv8xR1yURohl7Cjv9C
sFGg/DpLU69J8SC4UKm+VmYz8tpNOSq0XpQ09qCtbLcq7Pvxhe9Vg43Nv5PubCZW
kdiSEVTOfsSLveox4TU3+tsrbewLVg7MdOQJwe6aDAwNp5uAclQAhVnQQKAbdqf+
cry97+6lYap2Sz00RtS+UboQ+X8joJtbE44lgGqrZOd2ErDT1NOXfpWXYUmIbz77
/bMU7ecwGDaG+JTuH7i5+7f/s9TheGDzIpGSNwIDAQABAoIBAAN7D1II/Xg6me3r
UuQUJRXW+1k7fUTn8muyP29t7rOYwhIvU2LuCTYC2eA9NUZ9hv49uh20AcF76MGh
7+VoMK+Bv/0KmlUbB0yDNDSBKr+hoLv3XPjFGTl7J+S+nQ+NW+3SEQYMuSJgbYdT
LX+qHgEvMB7mB4e1u35TFKsADCfhEQ2jOEb2ROUEbSYjpepW7eWsjVihuchSB/kS
QUhXHDNWio5r86EPaSQuskRKlQrHC79OplrWZGaR8eFspTQ21oyCrg0eTpz94wt3
Cc9BfcczRx8zSUkjHk6xtmoqWMEurMBm8LH5GKuNAxuwa28lTbg2xyEgNkk08U1x
43eGYkECgYEA8Wdp1+OJvAYM+YavSo98F83TJ3fg5vhFEa48wTvxbhMox5bYK3Q/
XRBiBPonrupEGJO0mY6uW2Gd1kdsZuBjBbsGk5htbigwVaZc928WqRNK6gOWq70/
Ed6x8Zxn5xl8QNsBD0udm04IS1MfhA0pMZHjUngbWW5gr6DoaRzMn+8CgYEA5Dbn
gQ1Uqr6lA69wDIkInFhYpAeMhafuZCLvbCpcvd5pl0wF/AoNW4LUaPNSp0nHmQUm
MVTm9iCWQT9O0GrXlRp7b1x5I3hPwwZMkmya+s9npbuKop+7T4f/kaBN1CM68NvN
mWVVj6/jFOcD5wJtdaqx0c0wmGdzlrL08BTHajkCgYEArTY2i+GIApGU3bX2MNmj
gLD+wWMSzKd3Z6hNj5kjMogsyolBsmxGys/mhQu5TZhqI/hXrZbjJE52ojm9XlPC
uWno3h6Q5mmPxOUJ78CV0ds19ZN9mNzBVGEl7Ob85qUyspZxvDfVboofCW0rP+Tx
mc/D/HiRpym71kjuef1gFaECgYEA4DIsBjURa1g1BkTQoA/zXJzSH/qmixtp8Af+
C9YmHAUm2JLAAlXhv3fsslnwZhXuNx6+4ZHWABANbHYEOG3t8jX88272NulX+nDy
wppdOm6NFV0DmjWvrzcc1HSWYQRnP/2/oqXRg4I4ZO16gPR6kjEp1cFtrxtai76t
MDpJmckCgYBxQCjWImbh7xbjM88xZzQrmwaYljvdYKbNMk2zRybdC1ojnUjAe7Fn
B6BoiKwOU88D4NgFxgZXDHhvZBvgpCG/zCSbho6RVEy/wralfwtbtJOm+TBgvqyl
vqNsBCUxpQS/dZlMXMn0j7AEF306dIRs+G6+MPJIxLb85eUW0SgwQA==
-----END RSA PRIVATE KEY-----
"""
        KONFIGS.pemKeyPassword = KONFIGS.pemKeyPassword ?: ""

        KONFIGS.pemPublicKey = KONFIGS.pemPublicKey ?: """-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1zPgYpxg5e8h7+FITvtz
cBOblXSHVzyyoX1gCvTsFR9Q5FJ+ITBV/R3rflRpOaxQIA2cXElJx2foOK5BiDtv
BWsbuSOXmPZv8xR1yURohl7Cjv9CsFGg/DpLU69J8SC4UKm+VmYz8tpNOSq0XpQ0
9qCtbLcq7Pvxhe9Vg43Nv5PubCZWkdiSEVTOfsSLveox4TU3+tsrbewLVg7MdOQJ
we6aDAwNp5uAclQAhVnQQKAbdqf+cry97+6lYap2Sz00RtS+UboQ+X8joJtbE44l
gGqrZOd2ErDT1NOXfpWXYUmIbz77/bMU7ecwGDaG+JTuH7i5+7f/s9TheGDzIpGS
NwIDAQAB
-----END PUBLIC KEY-----"""

        KONFIGS.invitationExpiryDays = KONFIGS.invitationExpiryDays?.isInteger() ? KONFIGS.invitationExpiryDays as int : 3

        KONFIGS.hideMenu = new Boolean( KONFIGS.hideMenu )

        KONFIGS.jobLogDir = KONFIGS.jobLogDir ?: './'

        KONFIGS.largeDataFetchSize = KONFIGS.largeDataFetchSize?.isInteger() ? KONFIGS.largeDataFetchSize as int : Integer.MIN_VALUE
    }

    def static findExternalConverters()
    {
        EXTERNAL_KONFIG_CLASSES = []
        def konfigConverters = Holders.grailsApplication.mergedConfig.grails.plugin.rira.konfig.plugins.converters ?: []
        konfigConverters << Holders.grailsApplication.mergedConfig.grails.plugin.rira.konfig.converters
        if(konfigConverters != null && konfigConverters.class == ArrayList.class) {
            EXTERNAL_KONFIG_CLASSES = konfigConverters
        }

        if(Holders.grailsApplication.mergedConfig.grails.plugin.rira.konfig.scanKonfigConverters == true) {
            def scannedKonfConvs = KonfigConvertorFinder.findKonfigConverterClass()
            EXTERNAL_KONFIG_CLASSES = (EXTERNAL_KONFIG_CLASSES + scannedKonfConvs).unique()
        }
    }

    static convertExternalValues()
    {
        EXTERNAL_KONFIG_CLASSES.each { Class clsName ->
            try {
                Object beanObj
                Class beanClass = Class.forName( clsName.canonicalName )
                if( beanClass.getMethod( KonfigConvertorFinder.KONFIG_CONVERTER_METHOD_NAME, (Class<?>[]) null) ) {
                    beanClass.invokeMethod(KonfigConvertorFinder.KONFIG_CONVERTER_METHOD_NAME, null)
                }
            }
            catch( e )
            {
                log.error "convert() method of class [$clsName] could not be invoked successfully [$e.message]"
            }
        }
    }

    static refreshExternalCaches()
    {
        EXTERNAL_KONFIG_CLASSES.each { clsName ->
            try {
                Object beanObj
                Class beanClass = Class.forName( clsName )
                if( beanClass.getMethod( KonfigConvertorFinder.KONFIG_REFRESH_CACHE_METHOD_NAME, (Class<?>[]) null) )
                {
                    beanClass.invokeMethod( KonfigConvertorFinder.KONFIG_REFRESH_CACHE_METHOD_NAME, null )
                }
            }
            catch( e )
            {
                log.error "convert() method of class [$clsName] could not be invoked successfully [$e.message]"
            }
        }
    }

    def afterUpdate = this.&afterInsert
    def afterDelete = this.&afterInsert

    def afterInsert()
    {
        refreshCache()
    }

    static
    {
//        log.info "Initing KONFIGS"
//        refreshCache()
    }
}
