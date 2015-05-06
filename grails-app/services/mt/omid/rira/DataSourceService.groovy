package mt.omid.rira

import grails.transaction.Transactional
import groovy.sql.Sql

import javax.annotation.PostConstruct

@Transactional
class DataSourceService {

    def ds

    @PostConstruct
    def init()
    {
        ds = [:]
    }


    def addDS( name, Class<javax.sql.DataSource> dsClass, driver, url, username, password, others )
    {
        if( ds[ name ] ) {
            runtimeDataSourceService.removeDataSource( name )
        }

        ds[ name ] = runtimeDataSourceService.addDataSource( name, dsClass ) {
            driverClassName = driver
            url = url
            username = username
            password = password
        }
    }


    def getDS( String name ) {
        ds[ name ]
    }

    def execute( query, String dsName )
    {
        Sql sql = new Sql( ds[ dsName ] )

        try
        {
            return sql.execute( query )
        }
        catch ( Exception e )
        {
            log.error( "Error in executing query $query [$e.message]", e )
            return null
        }
        finally
        {
            sql.close()
        }
    }

    def executeQuery( query, String dsName )
    {
        Sql sql = new Sql( ds[ dsName ] )

        try
        {
            return sql.executeQuery( query )
        }
        catch( Exception e )
        {
            log.error( "Error in executing query $query [$e.message]", e )
            return null
        }
        finally
        {
            sql.close()
        }
    }
}
