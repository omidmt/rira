package mt.omid.rira

import static org.springframework.http.HttpStatus.UNAUTHORIZED
import static org.springframework.http.HttpStatus.UNAUTHORIZED
import static org.springframework.http.HttpStatus.UNAUTHORIZED

abstract class SecureController extends RiraController
{

    def beforeInterceptor = [ action: this.&authNauth ]

    def sessionService

    def afterInterceptor = { model, modelAndView ->
        model.applicos = sessionService.currentUser.applicos
    }

    private authNauth() {
        log.debug "Authenticate $controllerName/$actionName"
//        log.debug "Authenticate request $session"
        if (sessionService?.authenticate(session)) {
            if (sessionService.authorize(controllerName, actionName)) {
                return true
            }

            log.debug "Authorization failed"
            flash.error = "You do not have enough right to access this section."

            if (Konfig.KONFIGS.strictAuthorization)
                redirect controller: "session", action: "logout"
            else
                redirect controller: 'home', action: 'index'

            return false
        }

        log.debug "Authentication failed."
        flash.error = "Please sign in by your username & password"
        storeLocation()
        def errors = [ [code: UNAUTHORIZED.toString().toInteger(), desc: 'Authentication Failed'] ]
        withFormat {
            '*' {
                flash.error = "Please sign in by your username & password"
                redirect controller: 'Session', action: 'login'
            }
            json { respond errors, status: UNAUTHORIZED }
            xml { respond errors, status: UNAUTHORIZED }
        }
        return false
    }
}
