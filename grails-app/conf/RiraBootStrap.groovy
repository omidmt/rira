import mt.omid.rira.Konfig

class RiraBootStrap {

    def seedService

    def init = { servletContext ->
        Konfig.initKONFIGS()
        seedService.installSeedData()
    }

    def destroy = {
    }
}
