import mt.omid.rira.DataConnection
import mt.omid.rira.Konfig
import mt.omid.rira.Node
import mt.omid.rira.SecurityService

class RiraBootStrap {

    def seedService
    def riraMailService

    def init = {
        Konfig.initKonfig()
        Node.refreshCache()
        DataConnection.refreshCache()
        seedService.installSeedData()
        riraMailService.initialize()
        SecurityService.init()
    }
}
