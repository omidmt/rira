import org.codehaus.groovy.grails.io.support.FileSystemResource

includeTargets << grailsScript("_GrailsInit")

target(installRiraTemplates: "The description of the script goes here!") {
    depends(checkVersion, parseArguments)

    targetDir = "${basedir}/src/templates"
    overwrite = false

    // only if template dir already exists in, ask to overwrite templates
    if (new File(targetDir).exists()) {
        if (!isInteractive || confirmInput("Overwrite existing templates? ","overwrite.templates")) {
            overwrite = true
        }
    }
    else {
        ant.mkdir(dir: targetDir)
    }
//    copyGrailsResources("$targetDir/scaffolding/", "${riraPluginDir}/src/templates/scaffoldingss/*", overwrite)
    ant.copy(todir: "$targetDir/scaffolding", verbose: true, overwrite: overwrite) {
        fileset(dir: "$riraPluginDir/src/templates/scaffolding")
    }
//    copyGrailsResources("$targetDir/testing", "src/grails/templates/testing/*", overwrite)
//    ant.mkdir(dir:"${targetDir}/war")
//    copyGrailsResource("${targetDir}/war/web.xml", grailsResource("src/war/WEB-INF/web${servletVersion}.template.xml"), overwrite)

    event 'InstallRiraTemplates', [overwrite]

    event("StatusUpdate", ["Rira Templates installed successfully"])
}



setDefaultTarget(installRiraTemplates)

