package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class APIKeyController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond APIKey.list(params), model: [APIKeyInstanceCount: APIKey.count()]
    }

    def show(APIKey APIKeyInstance) {
        respond APIKeyInstance
    }

    def create() {
        respond new APIKey(params)
    }

    def clone(APIKey APIKeyInstance) {
        render view: 'create', model: [APIKeyInstance: new APIKey(APIKeyInstance.properties)]
    }

    def createEmbeded() {
        render(template: "embededForm", model: [APIKeyInstance: new APIKey(params)])
    }

    @Transactional
    def save(APIKey APIKeyInstance) {
        if (APIKeyInstance == null) {
            notFound()
            return
        }

        if (APIKeyInstance.hasErrors()) {
            respond APIKeyInstance.errors, view: 'create'
            return
        }

        APIKeyInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'APIKey.label', default: 'APIKey'), APIKeyInstance])
                redirect APIKeyInstance
            }
            '*' { respond APIKeyInstance, [status: CREATED] }
        }
    }

    def edit(APIKey APIKeyInstance) {
        respond APIKeyInstance
    }

    def editEmbeded(APIKey APIKeyInstance) {
        render(template: "embededForm", model: [APIKeyInstance: APIKeyInstance])
    }

    @Transactional
    def update(APIKey APIKeyInstance) {
        if (APIKeyInstance == null) {
            notFound()
            return
        }

        if (APIKeyInstance.hasErrors()) {
            respond APIKeyInstance.errors, view: 'edit'
            return
        }

        APIKeyInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'APIKey.label', default: 'APIKey'), APIKeyInstance])
                redirect APIKeyInstance
            }
            '*' { respond APIKeyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(APIKey APIKeyInstance) {

        if (APIKeyInstance == null) {
            notFound()
            return
        }

        APIKeyInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'APIKey.label', default: 'APIKey'), APIKeyInstance])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'APIKey.label', default: 'APIKey'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
