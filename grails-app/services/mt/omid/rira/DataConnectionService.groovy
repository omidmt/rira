package mt.omid.rira

import groovy.sql.Sql

import javax.sql.DataSource
import java.sql.ResultSet
import java.sql.Statement
import static mt.omid.rira.Konfig.KONFIGS

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

    def fetchLargeData(String query, String dsName, Closure cls) {
        if(!dsName || !DATASOURCES[ dsName ])
            return null

        DataSource ds = DATASOURCES[dsName]
        Statement stmt = ds.getConnection().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY)
        stmt.setFetchSize(KONFIGS.largeDataFetchSize)

        try
        {
            ResultSet rs = stmt.executeQuery(query)
            cls.call(rs)
        }
        finally
        {
            // It cannot be closed here, as it affect the result set operation with not allowed on resultset
            // ignore the above comments as the code changed to use rows method
            stmt.close()
        }
    }
}
