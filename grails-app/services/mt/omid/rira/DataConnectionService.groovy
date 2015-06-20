package mt.omid.rira

import groovy.sql.Sql
import static mt.omid.rira.DataConnection.DATASOURCES

class DataConnectionService {

    static transactional = false

    int [] batchInsert( String dsName, int size, String query, Closure closure )
    {
        if( !dsName )
            return null

        Sql sql
        try
        {
            sql = new Sql( DATASOURCES[ dsName ] )
            return sql.withBatch( size, query, closure )
        }
        finally
        {
            sql?.close()
        }
    }

    int [] batchInsert( String dsName, int size, Closure closure )
    {
        if( !dsName )
            return null

        Sql sql
        try
        {
            sql = new Sql( DATASOURCES[ dsName ] )
            return sql.withBatch( size, closure )
        }
        finally
        {
            sql?.close()
        }
    }

    def executeUpdate( String query, String dsName )
    {
        if( !dsName )
            return null

        Sql sql
        try
        {
            sql = new Sql( DATASOURCES[ dsName ] )
            return sql.executeUpdate( query )
        }
//        catch ( Exception e )
//        {
//            log.error( "Error in executing query $query [$e.message]", e )
//            return null
//        }
        finally
        {
            sql?.close()
        }
    }

    def executeInsert( String query, String dsName )
    {
        if( !dsName )
            return null

        Sql sql
        try
        {
            sql = new Sql( DATASOURCES[ dsName ] )
            return sql.executeInsert( query )
        }
//        catch ( Exception e )
//        {
//            log.error( "Error in executing query $query [$e.message]", e )
//            return null
//        }
        finally
        {
            sql?.close()
        }
    }

    def execute( String query, String dsName )
    {
        if( !dsName )
            return null

        Sql sql
        try
        {
            sql = new Sql( DATASOURCES[ dsName ] )
            return sql.execute( query )
        }
//        catch ( Exception e )
//        {
//            log.error( "Error in executing query $query [$e.message]", e )
//            return null
//        }
        finally
        {
            sql?.close()
        }
    }

    def executeQuery( String query, String dsName )
    {
        if( !dsName )
            return null

        Sql sql = new Sql( DATASOURCES[ dsName ] )

        try
        {
            return sql.executeQuery( query )
        }
//        catch( Exception e )
//        {
//            log.error( "Error in executing query $query [$e.message]", e )
//            return null
//        }
        finally
        {
            sql.close()
        }
    }
}
