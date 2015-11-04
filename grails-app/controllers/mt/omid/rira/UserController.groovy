package mt.omid.rira

import groovy.util.logging.Slf4j
import groovy.time.TimeCategory

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Slf4j
@Transactional(readOnly = true)
class UserController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def securityService
    def riraMailService
    def userService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model: [userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    def clone(User userInstance) {
        render view: 'create', model: [ userInstance: new User(userInstance.properties)]
    }

    def createEmbeded()
    {
        render( template: "embededForm", model: [ userInstance: new User(params) ] )
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
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
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    def editEmbeded(User userInstance)
    {
        render( template: "embededForm", model: [ userInstance: userInstance ] )
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    def settings()
    {
    }

    @Transactional
    def updatePassword()
    {
        User updatedUser = userService.updateUserPassword(params['cd'], params['sk'], User.get(sessionService.currentUser.id))

        if(!updatedUser) {
            flash.error = "Current password is not correct"
            redirect action: "settings"
        }
        else if( updatedUser.hasErrors() )
        {
            flash.error = "Changing password failed"
            respond updatedUser.errors, view:'settings', model: [ user: updatedUser ]
        }
        else {
            flash.success = "Password is updated"
            redirect controller: 'home', action: 'index'
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Transactional
    def forcePasswordChange(User userInstance) {
        if (!userInstance) {
            auditActivity("Invalid user id is used for forcing password change [${params['id']}]")
            log.error "Invalid user id is used for forcing password change [${params['id']}]"
            notFound()
            return
        }

        userInstance.forcePasswordChange = true

        if (userInstance.save(true)) {
            log.info "User ${userInstance.name} [${userInstance.email}] forced password change"
            auditActivity("User ${userInstance.name} [${userInstance.email}] forced password change")
            withFormat {
                html {
                    flash.sucess = "User ${userInstance.email} forced password change"
                    redirect userInstance
                }
                '*' { respond userInstance, [status: OK] }
            }
        } else {
            log.info "User ${userInstance.name} [${userInstance.email}] force password change failed"
            auditActivity("User ${userInstance.name} [${userInstance.email}] force password change failed")
            withFormat {
                html {
                    flash.message = "User ${userInstance.email} force password change failed"
                    redirect userInstance
                }
                '*' { render status: UNPROCESSABLE_ENTITY }
            }
        }
    }

    @Transactional
    def lock(User userInstance) {
        if(!userInstance)
        {
            auditActivity("Invalid user id is used to lock [${params['id']}]")
            log.error "Invalid user id is used to lock [${params['id']}]"
            notFound()
            return
        }

        userInstance.locked = true
        if(userInstance.save(true)) {
            log.info "User ${userInstance.name} [${userInstance.email}] locked"
            auditActivity("User ${userInstance.name} [${userInstance.email}] loked")
            withFormat {
                html {
                    flash.message = "User ${userInstance.email} is locked"
                    redirect userInstance
                }
                '*' {
                    respond userInstance, [status: OK]
                }
            }
        }
        else {
            log.info "User ${userInstance.name} [${userInstance.email}] locking failed"
            auditActivity("User ${userInstance.name} [${userInstance.email}] locking failed")
            withFormat {
                html {
                    flash.message = "User ${userInstance.email} locking failed"
                    redirect userInstance
                }
                '*' { render status: UNPROCESSABLE_ENTITY }
            }
        }
    }

    /***
     * Unlocking clear failed logins counter
     * @param userInstance
     * @return
     */
    @Transactional
    def unlock(User userInstance) {
        if(!userInstance)
        {
            auditActivity("Invalid user id is used for unlocking [${params['id']}]")
            log.error "Invalid user id is used for unlocking [${params['id']}]"
            notFound()
            return
        }

        userInstance.locked = false
        userInstance.failedLogins = 0
        if(userInstance.save(true)) {
            log.info "User ${userInstance.name} [${userInstance.email}] unloked"
            auditActivity("User ${userInstance.name} [${userInstance.email}] unloked")

            withFormat {
                html {
                    flash.message = "User ${userInstance.email} is unlocked"
                    redirect userInstance
                }
                '*' { render userInstance, [status: OK] }
            }
        }
        else {
            log.info "User ${userInstance.name} [${userInstance.email}] unloking failed"
            auditActivity("User ${userInstance.name} [${userInstance.email}] unloking failed")

            withFormat {
                html {
                    flash.message = "User ${userInstance.email} unlocking failed"
                    redirect userInstance
                }
                '*' { render status: UNPROCESSABLE_ENTITY }
            }
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
