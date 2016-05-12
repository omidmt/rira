package mt.omid.rira

import grails.util.Holders
import groovy.util.logging.Slf4j

import javax.naming.Context
import javax.naming.InitialContext

@Slf4j
class DataConnection {

    static DATASOURCES = [:]
    def static runtimeDataSourceService


    String name
    String dsClass
    String driver
    String url
    String username
    String password
    String others

    static deletable = true
    static cloneable = true

    static constraints = {
        name blank: false, size: 1..100, unique: true, validator: { it.contains( ' ' ) ? "Data Source Name Cannot Contain Space" : true }
        dsClass blank: false, size: 1..1000
        driver blank: false, size: 1..1000,
                validator: { try {
                    Class.forName( it, false, DataConnection.classLoader )
                    return true
                }
                catch( e ){ return [ 'DataConnection.driver.notExist' ] }
                }
        url blank: false, size: 1..1000
        username nullable: true, size: 0..100
        password nullable: true, password: true, size: 0..100
        others nullable: true, size: 0..2000
    }

    static mapping = {
        table name:'r_data_connection', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
        dsClass defaultValue: "'org.apache.tomcat.jdbc.pool.DataSource'"
    }

    def afterInsert()
    {
        addDS( this )
    }

    def afterUpdate = this.&afterInsert

    def afterDelete()
    {
        removeDS( name )
    }

    def static refreshCache()
    {
        log.info "Refreshing DataConnection Cache"

        DataConnection.all.each { ds ->
            removeDS( ds.name )
            addDS( ds )
        }
    }

    def static addDS( DataConnection dc )
    {
        if( DATASOURCES[ dc.name ] ) {
            DATASOURCES.remove( dc.name )
            runtimeDataSourceService.removeDataSource( dc.name )
        }

        try {

            if(dc.url?.startsWith('java:'))
                DATASOURCES[dc.name] = addJndiDS(dc)
            else {
                Class<javax.sql.DataSource> dcCls = DataConnection.classLoader.loadClass(dc.dsClass)
                Class.forName(dc.driver, false, DataConnection.classLoader)

                DATASOURCES[dc.name] = runtimeDataSourceService.addDataSource(dc.name, dcCls) {
                    driverClassName = dc.driver
                    url = dc.url
                    username = dc.username ?: ""
                    password = dc.password ?: ""
                    testWhileIdle = true

//                initialSize = 42
//                testOnBorrow = true
//                testOnReturn = false
//                validationQuery = 'SELECT 1'
                }
            }
        }
        catch( ClassNotFoundException cnfe )
        {
            log.error( "Datasource class [$dc.dsClass] cannot be loaded [$cnfe.message] to initialize run-time datasources" )
        }
        catch ( Exception e )
        {
            log.error( "Datasource [$dc.dsClass] adding failed [$e.message] on initializing run-time datasources" )
        }
    }

    def static addJndiDS(DataConnection dc) {
        Context initialContext = new InitialContext();
        if ( initialContext == null){
            log.error("JNDI problem. Cannot get InitialContext.")
            return null
        }
        return initialContext.lookup(dc.url);
    }

    def static removeDS( String name )
    {
        if( DATASOURCES[ name ] ) {
            DATASOURCES.remove( name )
            runtimeDataSourceService.removeDataSource( name )
        }
    }

    String toString() {
        name
    }

}
