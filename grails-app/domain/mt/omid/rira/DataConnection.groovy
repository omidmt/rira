package mt.omid.rira

import grails.util.Holders
import groovy.util.logging.Slf4j

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


    static constraints = {
        name blank: false, size: 1..100, unique: true, validator: { it.contains( ' ' ) ? "Data Source Name Cannot Contain Space" : true }
        dsClass blank: false, size: 1..1000
        driver blank: false, size: 1..1000
        url blank: false, size: 1..1000
        username nullable: true, size: 0..100
        password nullable: true, size: 0..100
        others nullable: true, size: 0..2000
    }

    static mapping = {
        table name:'r_data_connection', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
        dsClass defaultValue: "'org.apache.tomcat.jdbc.pool.DataConnection'"
    }

    def afterInsert()
    {
        refreshCache()
    }

    def afterUpdate = this.&afterInsert

    def afterDelete()
    {
        removeDS( name )
    }

    def static refreshCache()
    {
        DATASOURCES.clear()

        DataConnection.all.each { ds ->
            try {
                Class<javax.sql.DataSource> dsCls = DataConnection.classLoader.loadClass( ds.dsClass )
                addDS( ds.name, dsCls, ds.driver, ds.url, ds.username, ds.password, ds.others )
            }
            catch( ClassNotFoundException cnfe )
            {
                log.error( "Datasource class [$ds.dsClass] cannot be loaded [$cnfe.message] to initialize run-time datasources" )
            }
            catch ( Exception e )
            {
                log.error( "Datasource [$ds.dsClass] adding failed [$e.message] on initializing run-time datasources" )
            }
        }
    }

    def static addDS( name, Class<javax.sql.DataSource> dsClass, driver, url, username, password, others )
    {
        if( DATASOURCES[ name ] ) {
            runtimeDataSourceService.removeDataSource( name )
        }

        DATASOURCES[ name ] = runtimeDataSourceService.addDataSource( name, dsClass ) {
            driverClassName = driver
            url = url
            username = username
            password = password
        }
    }

    def static removeDS( String name )
    {
        if( DATASOURCES[ name ] ) {
            DATASOURCES[ name ] = null
            runtimeDataSourceService.removeDataSource( name )
        }
    }

}
