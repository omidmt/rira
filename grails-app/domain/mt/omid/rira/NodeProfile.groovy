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

    private static passwordValidator = { if( it < 0 ) return "Password lifetime must be positive number" }

    static constraints = {
        name size: 1..100
        baseDir size: 1..255
        primaryGroup size: 1..255
        defaultShell size: 1..255

        passwordMinAge  nullable: true, validator: passwordValidator
        passwordMaxAge  nullable: true, validator: passwordValidator
        passwordWarning nullable: true, validator: passwordValidator
    }

    String toString()
    {
        name
    }
}
