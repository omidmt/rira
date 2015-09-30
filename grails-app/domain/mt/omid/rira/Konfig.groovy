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

    String key
    String value
    String group
    Date dateCreated
    Date lastUpdated

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
        log.info "Initializing KONFGIS"
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
        if( KONFIGS.debug ) { Logger.getLogger( "grails.app.services.mt.omid" ).setLevel( Level.DEBUG ); Logger.getLogger( "mt.omid" ).setLevel( Level.DEBUG ) }
        else { Logger.getLogger( "grails.app.services.mt.omid" ).setLevel( Level.ERROR ); Logger.getLogger( "mt.omid" ).setLevel( Level.ERROR ) }

        KONFIGS.appName = KONFIGS.appName ?: Holders.grailsApplication.mergedConfig.grails.plugin.rira.appName

        if(!KONFIGS.localAddress) try { KONFIGS.localAddress = java.net.InetAddress.getLocalHost().getHostAddress() } catch(e) { log.error("Setting localAddress Konfig failed: " + e.message) }

        KONFIGS.StrictHostKeyChecking = ( KONFIGS.StrictHostKeyChecking?.toLowerCase() == 'yes' || KONFIGS.StrictHostKeyChecking?.toLowerCase() == 'no' ) ? KONFIGS.StrictHostKeyChecking : 'no'

        KONFIGS.allowedFailedLogin = KONFIGS.allowedFailedLogin?.isInteger() ? KONFIGS.allowedFailedLogin as int : 0

        KONFIGS.sessionInactivityTimeout = KONFIGS.sessionInactivityTimeout?.isInteger() ? KONFIGS.sessionInactivityTimeout as int : 3600

        KONFIGS.defaultHome = KONFIGS.defaultHome ?: '/home'

        KONFIGS.strictAuthorization = new Boolean( KONFIGS.strictAuthorization )

        // Pattern in config shouldn't be enclosed in // when defining as string
        KONFIGS.passwordComplexity = KONFIGS.passwordComplexity ?: /^.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*[\W])(?=.*[\d]).*$/

        KONFIGS.muPasswordComplexity = KONFIGS.muPasswordComplexity ?: /^.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*[\W])(?=.*[\d]).*$/

        KONFIGS.sqlLimit = KONFIGS.sqlLimit ?: ' limit 50000'

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
    }

    def static findExternalConverters()
    {
        EXTERNAL_KONFIG_CLASSES = KonfigConvertorFinder.findKonfigConvertorClass()
    }

    static convertExternalValues()
    {
        EXTERNAL_KONFIG_CLASSES.each { clsName ->
            try {
                Object beanObj
                Class beanClass = Class.forName( clsName )
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
