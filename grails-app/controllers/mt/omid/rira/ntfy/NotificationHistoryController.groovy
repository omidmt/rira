package mt.omid.rira.ntfy

import mt.omid.rira.SecureController

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NotificationHistoryController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static scaffold = true
    static layout = 'notif_admin'

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NotificationHistory.list(params), model: [notificationHistoryInstanceCount: NotificationHistory.count()]
    }

    def show(NotificationHistory notificationHistoryInstance) {
        respond notificationHistoryInstance
    }

    def create() {
        respond new NotificationHistory(params)
    }

    @Transactional
    def save(NotificationHistory notificationHistoryInstance) {
        if (notificationHistoryInstance == null) {
            notFound()
            return
        }

        if (notificationHistoryInstance.hasErrors()) {
            respond notificationHistoryInstance.errors, view: 'create'
            return
        }

        notificationHistoryInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'notificationHistory.label', default: 'NotificationHistory'), notificationHistoryInstance.id])
                redirect notificationHistoryInstance
            }
            '*' { respond notificationHistoryInstance, [status: CREATED] }
        }
    }

    def edit(NotificationHistory notificationHistoryInstance) {
        respond notificationHistoryInstance
    }

    @Transactional
    def update(NotificationHistory notificationHistoryInstance) {
        if (notificationHistoryInstance == null) {
            notFound()
            return
        }

        if (notificationHistoryInstance.hasErrors()) {
            respond notificationHistoryInstance.errors, view: 'edit'
            return
        }

        notificationHistoryInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'NotificationHistory.label', default: 'NotificationHistory'), notificationHistoryInstance.id])
                redirect notificationHistoryInstance
            }
            '*' { respond notificationHistoryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NotificationHistory notificationHistoryInstance) {

        if (notificationHistoryInstance == null) {
            notFound()
            return
        }

        notificationHistoryInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NotificationHistory.label', default: 'NotificationHistory'), notificationHistoryInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'notificationHistory.label', default: 'NotificationHistory'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
