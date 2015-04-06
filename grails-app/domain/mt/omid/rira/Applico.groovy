package mt.omid.rira

class Applico {

    String name
    String description
    String iconPath
    String path
    String family

    static constraints = {
        name blank: false, size: 1..50
        path blank: false, size: 1..255
        description nullable: true, size: 0..500
        iconPath nullable: true, size: 0..255
        family nullable: true, size: 0..50
    }

    def String toString()
    {
        return "${name} [${path}]"
    }

}
