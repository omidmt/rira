package mt.omid.rira.ntfy


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class NotificationGroupController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static layout = "notif_admin"

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NotificationGroup.list(params), model: [notificationGroupInstanceCount: NotificationGroup.count()]
    }

    def show(NotificationGroup notificationGroupInstance) {
        respond notificationGroupInstance
    }

    def create() {
        respond new NotificationGroup(params)
    }

    def clone(NotificationGroup notificationGroupInstance) {
        render view: 'create', model: [notificationGroupInstance: new NotificationGroup(notificationGroupInstance.properties)]
    }

    def createEmbeded() {
        render(template: "embededForm", model: [notificationGroupInstance: new NotificationGroup(params)])
    }

    @Transactional
    def save(NotificationGroup notificationGroupInstance) {
        if (notificationGroupInstance == null) {
            notFound()
            return
        }

        if (notificationGroupInstance.hasErrors()) {
            respond notificationGroupInstance.errors, view: 'create'
            return
        }

        notificationGroupInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'notificationGroup.label', default: 'NotificationGroup'), notificationGroupInstance])
                redirect notificationGroupInstance
            }
            '*' { respond notificationGroupInstance, [status: CREATED] }
        }
    }

    def edit(NotificationGroup notificationGroupInstance) {
        respond notificationGroupInstance
    }

    def editEmbeded(NotificationGroup notificationGroupInstance) {
        render(template: "embededForm", model: [notificationGroupInstance: notificationGroupInstance])
    }

    @Transactional
    def update(NotificationGroup notificationGroupInstance) {
        if (notificationGroupInstance == null) {
            notFound()
            return
        }

        if (notificationGroupInstance.hasErrors()) {
            respond notificationGroupInstance.errors, view: 'edit'
            return
        }

        notificationGroupInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'NotificationGroup.label', default: 'NotificationGroup'), notificationGroupInstance])
                redirect notificationGroupInstance
            }
            '*' { respond notificationGroupInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NotificationGroup notificationGroupInstance) {

        if (notificationGroupInstance == null) {
            notFound()
            return
        }

        notificationGroupInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NotificationGroup.label', default: 'NotificationGroup'), notificationGroupInstance])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'notificationGroup.label', default: 'NotificationGroup'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
