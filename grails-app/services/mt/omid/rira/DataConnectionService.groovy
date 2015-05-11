package mt.omid.rira

import grails.transaction.Transactional
import groovy.sql.Sql
import static mt.omid.rira.DataConnection.DATASOURCES as ds

import javax.annotation.PostConstruct

@Transactional
class DataConnectionService {

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
