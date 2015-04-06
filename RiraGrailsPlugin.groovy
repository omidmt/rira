class RiraGrailsPlugin {
    // the plugin version
    def version = "0.1.1"
    // the version or versions of Grails the plugin is designed for
    def grailsVersion = "2.4 > *"
    // resources that are excluded from plugin packaging
    def pluginExcludes = [
            "grails-app/views/error.gsp"
    ]
//    def loadBefore = [ 'seedMe' ]
    def dependsOn = [scaffolding : "2.1.2",
                  /* assetPipeline: "1.8.11 > *", */
                     seedMe  : "0.6.5",
                     console : "1.4.4 > *",
                     quartz  : "1.0-RC11 > *",
                     quartzMonitor : "1.0 > *",
                     cookieSession : "2.0.16 > *",
                     lessAssetPipeline : "1.10.0",
                     rest    : "0.8"
                    ]

    // Fill in these fields
    def title = "RIRA Plugin" // Headline display name of the plugin
    def author = "Omid Mehdizadeh"
    def authorEmail = "omid . mt @ gmail . com"
    def description = '''\
A framework to use in apps to provide security, notification, configuration and node management.
It also render a theme.
'''

    // URL to the plugin's documentation
    def documentation = "http://grails.org/plugin/rira"

    // Extra (optional) plugin metadata

    // License: one of 'APACHE', 'GPL2', 'GPL3'
//    def license = "APACHE"

    // Details of company behind the plugin (if there is one)
//    def organization = [ name: "My Company", url: "http://www.my-company.com/" ]

    // Any additional developers beyond the author specified above.
//    def developers = [ [ name: "Joe Bloggs", email: "joe@bloggs.net" ]]

    // Location of the plugin's issue tracker.
    def issueManagement = [ system: "Github", url: "https://github.com/omidmt/rira/issues" ]

    // Online location of the plugin's browseable source code.
    def scm = [ url: "https://github.com/omidmt/rira" ]

    def doWithWebDescriptor = { xml ->
        // TODO Implement additions to web.xml (optional), this event occurs before
    }

    def doWithSpring = {
        // TODO Implement runtime spring config (optional)
    }

    def doWithDynamicMethods = { ctx ->
        // TODO Implement registering dynamic methods to classes (optional)
    }

    def doWithApplicationContext = { ctx ->
        // TODO Implement post initialization spring config (optional)
    }

    def onChange = { event ->
        // TODO Implement code that is executed when any artefact that this plugin is
        // watching is modified and reloaded. The event contains: event.source,
        // event.application, event.manager, event.ctx, and event.plugin.
    }

    def onConfigChange = { event ->
        // TODO Implement code that is executed when the project configuration changes.
        // The event is the same as for 'onChange'.
    }

    def onShutdown = { event ->
        // TODO Implement code that is executed when the application shuts down (optional)
    }
}
