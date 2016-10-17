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

        "/connections/ip/$nodeType/$connectionType" (controller: "connectivityPlan", action: "ip")
        "/connections/ipNkey/$nodeType/$connectionType" (controller: "connectivityPlan", action: "ipNkey")
        "/connections/ipNpswd/$nodeType/$connectionType" (controller: "connectivityPlan", action: "ipNpswd")

        "/" {
            controller = "home"
            action = "index"
        }
    }
}