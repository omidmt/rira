grails {
    plugin {
        rira {
            appName = 'RIRA'
            schema = 'rira'
            logoSmall = 'rira-logo-128.png'
            logoLarg = 'rira-logo-256.png'
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

grails.databinding.dateFormats = ['EEE MMM dd HH:mm:ss yyyy', 'YYYY-MM-DD HH:mm:ss', "YYYYMMDD'T'HH:mm:ss", 'ddd MMM DD HH:mm:ss YYYY', 'MMddyyyy', 'yyyy-MM-dd HH:mm:ss.S', "yyyy-MM-dd'T'hh:mm:ss'Z'" ]

grails.plugins.twitterbootstrap.fixtaglib = true
grails.plugins.twitterbootstrap.defaultBundle = 'bundle_bootstrap'

// Seed-me config
grails.plugin.seed.autoSeed=true

// log4j configuration
log4j.main = {
    error 'org.codehaus.groovy.grails',
          'org.springframework',
          'org.hibernate',
          'net.sf.ehcache.hibernate',

          'mt.omid.rira.utils.connectivity.SolarisConnection'
          'grails.plugins.cookiesession'
          'com.granicus.grails.plugins.cookiesession'

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

// mail plugin config
grails {
    mail {
        host = "localhost"
        port = 25
        username = ""
        password = ""
        props = []
    }
}

// async-mail plugin config
asynchronous.mail.default.attempt.interval=300000l       // Five minutes
asynchronous.mail.default.max.attempts.count=5
asynchronous.mail.send.repeat.interval=60000l           // One minute
asynchronous.mail.expired.collector.repeat.interval=607000l
asynchronous.mail.messages.at.once=1000
asynchronous.mail.send.immediately=true  // since 0.1.2
asynchronous.mail.override=false    // since 0.2.0
asynchronous.mail.clear.after.sent=false    // since 0.2.0
asynchronous.mail.disable=fasle    // since 0.7
asynchronous.mail.useFlushOnSave=true
asynchronous.mail.persistence.provider='hibernate4' // Possible values are 'hibernate', 'hibernate4', 'mongodb'
asynchronous.mail.gparsPoolSize=3
asynchronous.mail.newSessionOnImmediateSend=false

def afterConfigMerge = {config, mergeCtx ->
    /* Validate that the application has provided all the required settings. */
}
