package mt.omid.rira

import grails.util.Holders

class APIKey {

    User user
    String key
    String allowedIPs   // comma separated list, NIY
    long maxPerDay
    long maxPerMonth
    long totalMax

    static deletable = true
    static cloneable = true

    static constraints = {
        user()
        key size: 1..250, nullable: true, display: false
        allowedIPs nullable: true, size: 0..1000
        maxPerDay()
        maxPerMonth()
        totalMax()
    }

    static mapping = {
        table name:'r_apikey', schema: Holders.grailsApplication.mergedConfig.grails.plugin.rira.schema
        user lazy: false
        key column: 'k'
    }

    def beforeInsert() {
        key = generateKey()
    }

    static APIKey authenticate(String key) {
        APIKey ak = APIKey.findByKey( key )
        return ( ak && !ak.user.locked && ( ak.user.accountExpiry ? ak.user.accountExpiry.after(new Date()) : true ) ) ? ak : null
    }

    public static String generateKey() {
        def pool = ['a'..'z','A'..'Z',0..9,'_','!', '@','#','$','*'].flatten()
        Random rand = new Random(System.currentTimeMillis())
        def keyChars = (0..50).collect { pool[rand.nextInt(pool.size())] }
        keyChars.join()
    }
}
