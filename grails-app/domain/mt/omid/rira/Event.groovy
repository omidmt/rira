package mt.omid.rira

class Event {

    Date time
    Severity severity
    String header
    String description
    String sender
    String impact
    String resolution
    boolean fixed

    static constraints = {
        severity()
        time blank: false
        header size: 1..100
        description size: 1..1000
        sender size: 1..200
        impact nullable: true
        resolution nullable: true
        fixed()
    }

    public enum Severity
    {
        MINOR,
        INTERMEDIATE,
        MAJOR,
        CRITICAL
    }
}
