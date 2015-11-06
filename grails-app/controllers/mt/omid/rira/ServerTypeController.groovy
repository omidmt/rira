package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class ServerTypeController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ServerType.list(params), model: [serverTypeInstanceCount: ServerType.count()]
    }

    def show(ServerType serverTypeInstance) {
        respond serverTypeInstance
    }

    def create() {
        respond new ServerType(params)
    }

    def clone(ServerType serverTypeInstance) {
        render view: 'create', model: [serverTypeInstance: new ServerType(serverTypeInstance.properties)]
    }

    def createEmbeded() {
        render(template: "embededForm", model: [serverTypeInstance: new ServerType(params)])
    }

    @Transactional
    def save(ServerType serverTypeInstance) {
        if (serverTypeInstance == null) {
            notFound()
            return
        }

        if (serverTypeInstance.hasErrors()) {
            respond serverTypeInstance.errors, view: 'create'
            return
        }

        serverTypeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'serverType.label', default: 'ServerType'), serverTypeInstance])
                redirect serverTypeInstance
            }
            '*' { respond serverTypeInstance, [status: CREATED] }
        }
    }

    def edit(ServerType serverTypeInstance) {
        respond serverTypeInstance
    }

    def editEmbeded(ServerType serverTypeInstance) {
        render(template: "embededForm", model: [serverTypeInstance: serverTypeInstance])
    }

    @Transactional
    def update(ServerType serverTypeInstance) {
        if (serverTypeInstance == null) {
            notFound()
            return
        }

        if (serverTypeInstance.hasErrors()) {
            respond serverTypeInstance.errors, view: 'edit'
            return
        }

        serverTypeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ServerType.label', default: 'ServerType'), serverTypeInstance])
                redirect serverTypeInstance
            }
            '*' { respond serverTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ServerType serverTypeInstance) {

        if (serverTypeInstance == null) {
            notFound()
            return
        }

        serverTypeInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ServerType.label', default: 'ServerType'), serverTypeInstance])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'serverType.label', default: 'ServerType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
