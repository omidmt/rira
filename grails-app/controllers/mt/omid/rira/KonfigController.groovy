package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class KonfigController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Konfig.list(params), model: [konfigInstanceCount: Konfig.count()]
    }

    def show(Konfig konfigInstance) {
        respond konfigInstance
    }

    def create() {
        respond new Konfig(params)
    }

    def clone(Konfig konfigInstance) {
        render view: 'create', model: [konfigInstance: new Konfig(konfigInstance.properties)]
    }

    def createEmbeded() {
        render(template: "embededForm", model: [konfigInstance: new Konfig(params)])
    }

    @Transactional
    def save(Konfig konfigInstance) {
        if (konfigInstance == null) {
            notFound()
            return
        }

        if (konfigInstance.hasErrors()) {
            respond konfigInstance.errors, view: 'create'
            return
        }

        konfigInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'konfig.label', default: 'Konfig'), konfigInstance])
                redirect konfigInstance
            }
            '*' { respond konfigInstance, [status: CREATED] }
        }
    }

    def edit(Konfig konfigInstance) {
        respond konfigInstance
    }

    def editEmbeded(Konfig konfigInstance) {
        render(template: "embededForm", model: [konfigInstance: konfigInstance])
    }

    @Transactional
    def update(Konfig konfigInstance) {
        if (konfigInstance == null) {
            notFound()
            return
        }

        if (konfigInstance.hasErrors()) {
            respond konfigInstance.errors, view: 'edit'
            return
        }

        konfigInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Konfig.label', default: 'Konfig'), konfigInstance])
                redirect konfigInstance
            }
            '*' { respond konfigInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Konfig konfigInstance) {

        if (konfigInstance == null) {
            notFound()
            return
        }

        konfigInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Konfig.label', default: 'Konfig'), konfigInstance])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'konfig.label', default: 'Konfig'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def refreshCache() {
        Konfig.initKonfig()
        Node.refreshCache()
        DataConnection.refreshCache()

        Konfig.refreshExternalCaches()

        request.withFormat {
            form multipartForm {
                flash.message = "All caches refreshed"
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }
}
