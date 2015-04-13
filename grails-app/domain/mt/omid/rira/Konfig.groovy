package mt.omid.rira

import grails.util.Holders
import groovy.util.logging.Slf4j

@Slf4j
class Konfig
{
    static KONFIGS = [:]

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

    static initKONFIGS()
    {
        log.info "Initializing KONFGIS"
        KONFIGS.clear()
//        log.info KONFIGS
//        log.info Konfig.all
        Konfig.all.each {
            KONFIGS[ it.key ] = it.value
        }

        convertValues()
//        log.info KONFIGS
    }

    static convertValues()
    {
        log.info( "Converting KONFIGS values" )
        KONFIGS.debug = KONFIGS.debug?.toLowerCase() == 'true'

        KONFIGS.appName = KONFIGS.appName ?: 'RIRA'

        KONFIGS.StrictHostKeyChecking = ( KONFIGS.StrictHostKeyChecking?.toLowerCase() == 'yes' || KONFIGS.StrictHostKeyChecking?.toLowerCase() == 'no' ) ? KONFIGS.StrictHostKeyChecking : 'no'

        KONFIGS.allowedFailedLogin = KONFIGS.allowedFailedLogin?.isInteger() ? KONFIGS.allowedFailedLogin as int : 0

        KONFIGS.sessionInactivityTimeout = KONFIGS.sessionInactivityTimeout?.isInteger() ? KONFIGS.sessionInactivityTimeout as int : 3600

        KONFIGS.defaultHome = KONFIGS.defaultHome ?: '/nodeState'

        KONFIGS.strictAuthorization = KONFIGS.strictAuthorization?.toLowerCase() == 'true'

        // Pattern in config shouldn't be enclosed in // when defining as string
        KONFIGS.passwordComplexity = KONFIGS.passwordComplexity ?: /^.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*[\W])(?=.*[\d]).*$/

        KONFIGS.muPasswordComplexity = KONFIGS.muPasswordComplexity ?: /^.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*[\W])(?=.*[\d]).*$/
    }

    def afterUpdate = this.&afterInsert
    def afterDelete = this.&afterInsert

    def afterInsert()
    {
        initKONFIGS()
    }

    static
    {
//        log.info "Initing KONFIGS"
//        initKONFIGS()
    }
}
