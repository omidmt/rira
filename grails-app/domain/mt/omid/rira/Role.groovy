package mt.omid.rira

class Role {

    String name

    static hasMany = [ rights : Right ]
//    static belongsTo = User

    static constraints = {
        name size: 1..100, unique: true, blank: false
        rights nullable: true
    }

    static mapping = {
        table 'r_role'
    }

    String toString()
    {
        name
    }
}
