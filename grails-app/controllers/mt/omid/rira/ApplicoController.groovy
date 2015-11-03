package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class ApplicoController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Applico.list(params), model: [applicoInstanceCount: Applico.count()]
    }

    def show(Applico applicoInstance) {
        respond applicoInstance
    }

    def create() {
        respond new Applico(params)
    }

    def clone(Applico applicoInstance) {
        render view: 'create', model: [applicoInstance: new Applico(applicoInstance.properties)]
    }

    def createEmbeded() {
        render(template: "embededForm", model: [applicoInstance: new Applico(params)])
    }

    @Transactional
    def save(Applico applicoInstance) {
        if (applicoInstance == null) {
            notFound()
            return
        }

        if (applicoInstance.hasErrors()) {
            respond applicoInstance.errors, view: 'create'
            return
        }

        applicoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'applico.label', default: 'Applico'), applicoInstance])
                redirect applicoInstance
            }
            '*' { respond applicoInstance, [status: CREATED] }
        }
    }

    def edit(Applico applicoInstance) {
        respond applicoInstance
    }

    def editEmbeded(Applico applicoInstance) {
        render(template: "embededForm", model: [applicoInstance: applicoInstance])
    }

    @Transactional
    def update(Applico applicoInstance) {
        if (applicoInstance == null) {
            notFound()
            return
        }

        if (applicoInstance.hasErrors()) {
            respond applicoInstance.errors, view: 'edit'
            return
        }

        applicoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Applico.label', default: 'Applico'), applicoInstance])
                redirect applicoInstance
            }
            '*' { respond applicoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Applico applicoInstance) {

        if (applicoInstance == null) {
            notFound()
            return
        }

        applicoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Applico.label', default: 'Applico'), applicoInstance])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'applico.label', default: 'Applico'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
