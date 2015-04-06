package mt.omid.rira

class Right {

    String act
    String ctrl
    Applico applico

    static constraints = {
        act blank: false
        ctrl blank: false
        applico nullable: true
    }

//    static hasMany = [ roles: Role ]

//    static belongsTo = [ Role ]

    static mapping = {
        table 'r_right'
    }

    public String toString()
    {
        return "${ctrl}/${act}"
    }
}
