package mt.omid.rira

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SessionController extends UnSecureController {

    static allowedMethods = [save: "POST", delete: "DELETE"]

    def securityService

    def create() {
        def title = "Sign In"
        redirect 'secure/login'
    }

    @Transactional
    def save() {
        // session.invalidate()
        def(username, password) = securityService.decryptLoginHash(params['cd'], params['sk'])
        User user = User.authenticate(username, password)

        if( !user )
        {
            flash.error = "Login failed; Invalid userID or password."
            def title = "Sign in"
            log.debug "Invalid login"
            auditActivity( "Login Attempted, Invalid credentials [$username]" )
            redirect action: 'login'
        }
        else if( user.locked )
        {
            flash.error = "Your account is locked, contact administrator."
            def title = "Sign in"
            auditActivity( "Login Attempt, Account is locked [$username]" )
            redirect action: 'login'
        }
        else if( user.passwordExpiry && user.passwordExpiry < new Date() )
        {
            flash.message = "Your password is expired, please choose new one."
            flash.user_email = user.email
            auditActivity( "Login Attempt, password is expired [$username]" )
        }
        // PC1002 Force Password Change
        else if( user.forcePasswordChange )
        {
            flash.message = "Please change your password"
            flash.user_email = user.email
            auditActivity( "Login Attempt, forced to change password [$username]" )
        }
        else if( user.accountExpiry && user.accountExpiry < new Date() )
        {
            flash.error = "Your account is expired."
            def title = "Sign in"
            auditActivity( "Login Attempt, account is expired [$username]" )
        }

        // Successful Login
        else
        {
            log.debug "Successful login"
            auditActivity( "Login Successfully [$username]" )
            flash.success = "Welcome to ${Konfig.KONFIGS['appName']}"
            sessionService.signIn( user, session )

            user.lastLogin = new Date()
            user.save()
            redirectBackOr( Konfig.KONFIGS[ 'defaultHome' ] )
        }
    }

    @Transactional
    def logout()
    {
        sessionService.signOut(session)
        redirect url: '/login'
    }

    def login()
    {
        // display login page
        log.info "Render login page"
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'session.label', default: 'Session'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
