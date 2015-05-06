package mt.omid.rira

class DataSource {

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
        dsClass defaultValue: 'org.apache.tomcat.jdbc.pool.DataSource'
    }

}
