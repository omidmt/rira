package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class ModuleController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Module.list(params), model: [moduleInstanceCount: Module.count()]
    }

    def show(Module moduleInstance) {
        respond moduleInstance
    }

    def create() {
        respond new Module(params)
    }

    def clone(Module moduleInstance) {
        render view: 'create', model: [moduleInstance: new Module(moduleInstance.properties)]
    }

    def createEmbeded() {
        render(template: "embededForm", model: [moduleInstance: new Module(params)])
    }

    @Transactional
    def save(Module moduleInstance) {
        if (moduleInstance == null) {
            notFound()
            return
        }

        if (moduleInstance.hasErrors()) {
            respond moduleInstance.errors, view: 'create'
            return
        }

        moduleInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'module.label', default: 'Module'), moduleInstance])
                redirect moduleInstance
            }
            '*' { respond moduleInstance, [status: CREATED] }
        }
    }

    def edit(Module moduleInstance) {
        respond moduleInstance
    }

    def editEmbeded(Module moduleInstance) {
        render(template: "embededForm", model: [moduleInstance: moduleInstance])
    }

    @Transactional
    def update(Module moduleInstance) {
        if (moduleInstance == null) {
            notFound()
            return
        }

        if (moduleInstance.hasErrors()) {
            respond moduleInstance.errors, view: 'edit'
            return
        }

        moduleInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Module.label', default: 'Module'), moduleInstance])
                redirect moduleInstance
            }
            '*' { respond moduleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Module moduleInstance) {

        if (moduleInstance == null) {
            notFound()
            return
        }

        moduleInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Module.label', default: 'Module'), moduleInstance])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'module.label', default: 'Module'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
