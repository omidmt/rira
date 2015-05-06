package mt.omid.rira


import mt.omid.rira.SecureController

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class ConnectivityPlanController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConnectivityPlan.list(params), model: [connectivityPlanInstanceCount: ConnectivityPlan.count()]
    }

    def show(ConnectivityPlan connectivityPlanInstance) {
        respond connectivityPlanInstance
    }

    def create() {
        respond new ConnectivityPlan(params)
    }

    def createEmbeded() {
        render(template: "embededForm", model: [connectivityPlanInstance: new ConnectivityPlan(params)])
    }

    @Transactional
    def save(ConnectivityPlan connectivityPlanInstance) {
        if (connectivityPlanInstance == null) {
            notFound()
            return
        }

        if (connectivityPlanInstance.hasErrors()) {
            respond connectivityPlanInstance.errors, view: 'create'
            return
        }

        connectivityPlanInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'connectivityPlan.label', default: 'ConnectivityPlan'), connectivityPlanInstance.id])
                redirect connectivityPlanInstance
            }
            '*' { respond connectivityPlanInstance, [status: CREATED] }
        }
    }

    def edit(ConnectivityPlan connectivityPlanInstance) {
        respond connectivityPlanInstance
    }

    def editEmbeded(ConnectivityPlan connectivityPlanInstance) {
        render(template: "embededForm", model: [connectivityPlanInstance: connectivityPlanInstance])
    }

    @Transactional
    def update(ConnectivityPlan connectivityPlanInstance) {
        if (connectivityPlanInstance == null) {
            notFound()
            return
        }

        if (connectivityPlanInstance.hasErrors()) {
            respond connectivityPlanInstance.errors, view: 'edit'
            return
        }

        connectivityPlanInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConnectivityPlan.label', default: 'ConnectivityPlan'), connectivityPlanInstance.id])
                redirect connectivityPlanInstance
            }
            '*' { respond connectivityPlanInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConnectivityPlan connectivityPlanInstance) {

        if (connectivityPlanInstance == null) {
            notFound()
            return
        }

        connectivityPlanInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConnectivityPlan.label', default: 'ConnectivityPlan'), connectivityPlanInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'connectivityPlan.label', default: 'ConnectivityPlan'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
