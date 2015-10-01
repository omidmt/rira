package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static scaffold = true

    def riraMailService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (!userInstance) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        riraMailService.sendWelcomeMail(userInstance, userInstance.password)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (!userInstance) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    def settings()
    {
    }

    @Transactional
    def updatePassword(String curPass, String newPass, String confPass)
    {

        User user = User.get( sessionService.currentUser.id )
//
//        if( newPass != confPass )
//        {
//            flash.error = "New password is not match confirmation"
//            redirect action: "settings"
//        }

        if( user.hasPassword( curPass ) )
        {
            user.password = newPass
            user.passwordConfirmation = confPass
            user.validate()
            if( user.hasErrors() )
            {
//                log.debug "User new pass is not valid ${user.errors*.toString()}"
                respond user.errors, view:'settings', model: [ user: user ]
                return
            }
            log.debug "User new pass is OK, saving..."
            user.save( true )
            riraMailService.sendAlertMail(user, "Your password is changed, please inform admin if you did not this or not informed about it.")
            sessionService.signIn( user, session )
            redirect action: 'settings'
        }
        else
        {
            flash.error = "Current password is not correct"
            redirect action: "settings"
        }

    }

    @Transactional
    def delete(User userInstance) {

        if (!userInstance) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
