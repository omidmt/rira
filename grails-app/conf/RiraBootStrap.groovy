import groovy.util.logging.Slf4j
import mt.omid.rira.DataConnection
import mt.omid.rira.Konfig
import mt.omid.rira.Node
import mt.omid.rira.SecurityService
import mt.omid.rira.ntfy.RiraMailService

@Slf4j
class RiraBootStrap {

    def seedService

    def init = {
        println "Bootstrapping RIRA"
        Konfig.initKonfig()
        Node.refreshCache()
        DataConnection.refreshCache()
        seedService.installSeedData()
        RiraMailService.initialize()
        SecurityService.init()
    }
}
