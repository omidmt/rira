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
        compile 'org.jsmpp:jsmpp:2.2.1'
    }

    plugins {
        build(':release:3.0.1',
              ':rest-client-builder:2.0.3') {
            export = false
        }

        compile ':scaffolding:2.1.2'
        compile ':asset-pipeline:2.1.5'
        compile ':seed-me:0.6.5'
        compile ':console:1.5.4'  // Should be removed for production
//        compile ':quartz:1.0.2'
        compile ':quartz:1.0-RC11'
        compile ':quartz-monitor:1.0'
        compile ':cookie-session:2.0.17'
        compile ':less-asset-pipeline:2.1.0'
        compile ':rest:0.8'

        compile ':plugin-config:0.2.0'
    }
}
