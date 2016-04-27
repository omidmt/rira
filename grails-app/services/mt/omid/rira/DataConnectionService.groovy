package mt.omid.rira

import groovy.sql.Sql
import static mt.omid.rira.DataConnection.DATASOURCES

class DataConnectionService {

    static transactional = false

    int [] batchInsert( String dsName, int size, String query, Closure closure )
    {
        if( !dsName || !DATASOURCES[ dsName ])
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
        if( !dsName || !DATASOURCES[ dsName ] )
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
        if( !dsName || !DATASOURCES[ dsName ] )
            return null

        Sql sql
        try
        {
            sql = new Sql( DATASOURCES[ dsName ] )
            return sql.executeUpdate( query )
        }
        finally
        {
            sql?.close()
        }
    }

    def executeInsert( String query, String dsName )
    {
        if( !dsName || !DATASOURCES[ dsName ] )
            return null

        Sql sql
        try
        {
            sql = new Sql( DATASOURCES[ dsName ] )
            return sql.executeInsert( query )
        }
        finally
        {
            sql?.close()
        }
    }

    def execute( String query, String dsName )
    {
        if( !dsName || !DATASOURCES[ dsName ] )
            return null

        Sql sql
        try
        {
            sql = new Sql( DATASOURCES[ dsName ] )
            return sql.execute( query )
        }
        finally
        {
            // It cannot be closed here, as it affect the result set operation with not allowed on resultset
            //sql?.close()
        }
    }

    def executeQuery( String query, String dsName )
    {
        if( !dsName || !DATASOURCES[ dsName ] )
            return null

        Sql sql = new Sql( DATASOURCES[ dsName ] )

        try
        {
            return sql.rows( query + ' ' + Konfig.KONFIGS.sqlLimit )
        }
        finally
        {
            // It cannot be closed here, as it affect the result set operation with not allowed on resultset
            // ignore the above comments as the code changed to use rows method
            sql.close()
        }
    }
}
