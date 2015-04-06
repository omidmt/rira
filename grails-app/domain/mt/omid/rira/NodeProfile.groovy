package mt.omid.rira

class NodeProfile {

    String name
    String baseDir
    String primaryGroup
    int groupId
    String defaultShell

    int passwordMinAge
    int passwordMaxAge
    int passwordWarning


    static constraints = {
        name size: 1..100, nullable: false
        baseDir size: 1..255, nullable: false
        primaryGroup size: 1..255, nullable: false
        groupId nullable: false
        defaultShell size: 1..255, nullable: false

        passwordMinAge nullable: true, validator: { if( it < 0 ) return "Password lifetime must be positive number" }
        passwordMaxAge nullable: true, validator: { if( it < 0 ) return "Password lifetime must be positive number" }
        passwordWarning nullable: true, validator: { if( it < 0 ) return "Password lifetime must be positive number" }
    }

    def String toString()
    {
        return "${name}"
    }
}
