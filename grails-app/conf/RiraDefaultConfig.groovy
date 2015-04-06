grails {
    plugin {
        rira {
            appName = 'RIRA'
            {
                ntfy
                {
                    smscIP = '127.0.0.1'
                    smppPort = 2775
                    sysId = 'sysid'
                    sysType = 'systype'
                    sysPass = 'sysPass'
                    typeOfNumber = 2
                    npIndicator = 0
                }
            }
        }
    }
}

grails.exceptionresolver.params.exclude = ['password', 'passwd']

//grails.app.context = '/'

grails.assets.minifyJs = false

// Cookie Session Config
grails.plugin.cookiesession.enabled = true
grails.plugin.cookiesession.encryptcookie = false
grails.plugin.cookiesession.cryptoalgorithm = "AES"
grails.plugin.cookiesession.secret = "CookieSecret1029"
grails.plugin.cookiesession.cookiename = "riracook"

grails.assets.less.compiler = 'standard'

grails.databinding.dateFormats = [ "EEE MMM dd HH:mm:ss yyyy", "yyyy-MM-dd HH:mm:ss" ]

grails.plugins.twitterbootstrap.fixtaglib = true
grails.plugins.twitterbootstrap.defaultBundle = 'bundle_bootstrap'

// Seed-me config
grails.plugin.seed.autoSeed=true

// log4j configuration
log4j.main = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
            'org.codehaus.groovy.grails.web.pages',          // GSP
            'org.codehaus.groovy.grails.web.sitemesh',       // layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping',        // URL mapping
            'org.codehaus.groovy.grails.commons',            // core / classloading
            'org.codehaus.groovy.grails.plugins',            // plugins
            'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate',

            'mt.omid.rira.utils.connectivity.SolarisConnection'

//    debug  'grails.app'
//    debug 'seedme'
//    SQL Debug enabled
//    debug 'org.hibernate.SQL'
//    trace 'org.hibernate.type.descriptor.sql.BasicBinder'
//    debug 'org.hibernate.tool.hbm2ddl'
//    error stdout: "StackTrace"
//    trace 'groovyx.net.http'
//    debug 'org.apache.http'
}

def afterConfigMerge = {config, mergeCtx ->
    /* Validate that the application has provided all the required settings. */
}