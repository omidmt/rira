package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class OSController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OS.list(params), model: [OSInstanceCount: OS.count()]
    }

    def show(OS OSInstance) {
        respond OSInstance
    }

    def create() {
        respond new OS(params)
    }

    def clone(OS OSInstance) {
        render view: 'create', model: [OSInstance: new OS(OSInstance.properties)]
    }

    def createEmbeded() {
        render(template: "embededForm", model: [OSInstance: new OS(params)])
    }

    @Transactional
    def save(OS OSInstance) {
        if (OSInstance == null) {
            notFound()
            return
        }

        if (OSInstance.hasErrors()) {
            respond OSInstance.errors, view: 'create'
            return
        }

        OSInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'OS.label', default: 'OS'), OSInstance])
                redirect OSInstance
            }
            '*' { respond OSInstance, [status: CREATED] }
        }
    }

    def edit(OS OSInstance) {
        respond OSInstance
    }

    def editEmbeded(OS OSInstance) {
        render(template: "embededForm", model: [OSInstance: OSInstance])
    }

    @Transactional
    def update(OS OSInstance) {
        if (OSInstance == null) {
            notFound()
            return
        }

        if (OSInstance.hasErrors()) {
            respond OSInstance.errors, view: 'edit'
            return
        }

        OSInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OS.label', default: 'OS'), OSInstance])
                redirect OSInstance
            }
            '*' { respond OSInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OS OSInstance) {

        if (OSInstance == null) {
            notFound()
            return
        }

        OSInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OS.label', default: 'OS'), OSInstance])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'OS.label', default: 'OS'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
