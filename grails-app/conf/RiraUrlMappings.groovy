class RiraUrlMappings {
    static mappings = {

        "/notify/send" ( controller: 'Notify', action: 'send', method: 'POST' )
        "/notify/admin" ( controller: 'Notify', action: 'admin', method: 'POST' )

        name login : "/login" {
            controller = "Session"
            action = "login"
        }
        name logout: "/logout" {
            controller = "Session"
            action = "logout"
        }

        "/" {
            controller = "home"
            action = "index"
        }
    }
}