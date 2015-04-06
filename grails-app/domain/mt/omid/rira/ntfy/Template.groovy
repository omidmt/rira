package mt.omid.rira.ntfy

class Template {

    String name
    String content

    static constraints = {
        name blank: false, size: 1..100
        content blank: false, size: 1..1000
    }

    public String toString()
    {
        return name
    }
}
