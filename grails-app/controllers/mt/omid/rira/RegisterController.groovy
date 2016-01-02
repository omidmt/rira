package mt.omid.rira

import groovy.util.logging.Slf4j
import static org.springframework.http.HttpStatus.NOT_FOUND

@Slf4j
class RegisterController extends UnSecureController {

    def riraMailService

    /****
     * Accept invitation handler
     */
    def accept() {
        Invitation inv = Invitation.findByUid(params.id)
        if(inv == null) {
            log.warn "Invalid invitation id"
            flash.error = "Invalid or expired invitation."
            redirect uri: '/login', method: "GET"
            return
        }

        User user = new User()
        user.email = inv.email
        user.name = inv.name

        if (user.hasErrors()) {
            flash.error = 'Error on creating user'
            println user.dump()
            redirect uri: '/login'
            return
        }

        //user.save flush: true

        render view: 'create', model: [userInstance: user, uid: inv.uid]
    }

    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        Invitation inv = Invitation.findByUid(params.uid)
        if(inv == null) {
            log.warn "Invalid invitation id"
            flash.error = "Invalid or expired invitation."
            redirect uri: '/login', method: "GET"
            return
        }


        User user = new User()
        user.email = inv.email
        user.name = inv.name
        user.accountExpiry = inv.accountExpiry
        if(inv.role) user.roles = [inv.role]
        user.description = userInstance.description
        user.phone = userInstance.phone
        user.instantMessaging = userInstance.instantMessaging
        user.password = userInstance.password
        user.passwordConfirmation = userInstance.passwordConfirmation
        user.passwordExpiry = User.newPasswordExpiry()

        user.validate()

        if (user.hasErrors()) {
            respond user.errors, view: 'create', model: [uid: inv.uid]
            return
        }

        user.save flush:true
        inv.delete flush: true

        riraMailService.sendWelcomeMail(user, '********')
        flash.message = 'Your user is created'
        redirect uri: '/login'
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
