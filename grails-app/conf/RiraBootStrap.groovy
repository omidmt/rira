import mt.omid.rira.Konfig

class RiraBootStrap {

    def seedService

    def init = {
        Konfig.initKONFIGS()
        seedService.installSeedData()
    }
}
