grails.project.work.dir = 'target'

grails.project.dependency.resolver = 'maven'
grails.project.dependency.resolution = {

    inherits 'global'
    log 'warn'

    repositories {
        mavenLocal()
        grailsCentral()
        mavenCentral()
    }

    dependencies {
        compile 'org.jsmpp:jsmpp:2.3.2'

        compile('org.bouncycastle:bcpg-jdk15on:1.52') {
          //  excludes 'bcprov-jdk15on'
        }
        compile 'org.bouncycastle:bcprov-ext-jdk15on:1.52'

        compile 'org.bouncycastle:bcpkix-jdk15on:1.52'

        compile("com.lowagie:itext:2.0.8") {
            excludes "bouncycastle:bcprov-jdk14:138", "org.bouncycastle:bcprov-jdk14:1.38"
        }
    }

    plugins {
        build(':release:3.0.1',
              ':rest-client-builder:2.0.3') {
            export = false
        }

        compile ':scaffolding:2.1.2'
        compile ':asset-pipeline:2.9.1'
        compile ':seed-me:0.6.5'
        compile ':console:1.5.4'  // Should be removed for production
//        compile ':quartz:1.0.2'
        compile ":quartz:1.0.2"
        compile ':quartz-monitor:1.0'
        compile ':cookie-session:2.0.18'
        compile ':less-asset-pipeline:2.1.0'
        compile ':rest:0.8'

        compile ':plugin-config:0.2.0'
        compile ":runtime-datasources:0.2"
        compile ":asynchronous-mail:1.2-1"

        runtime ":hibernate4:4.3.6.1"
    }
}
