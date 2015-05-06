package mt.omid.rira

class DataSource {

    String name
    String dsClass
    String driver
    String url
    String username
    String password
    String others

    def dataSourceService

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
        dsClass defaultValue: 'org.apache.tomcat.jdbc.pool.DataSource'
    }

    def static refreshAllDS()
    {
        DataSource.all.each { ds ->

            try {
                Class<javax.sql.DataSource> dsCls = DataSource.classLoader.loadClass(ds.dsClass)
                dataSourceService.addDS( ds.name, dsCls, ds.driver, ds.url, ds.username, ds.password, ds.others )
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

}
