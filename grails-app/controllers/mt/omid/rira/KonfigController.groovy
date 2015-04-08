package mt.omid.rira

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class KonfigController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static scaffold = true

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

    @Transactional
    def save(Konfig konfigInstance) {
        if (!konfigInstance) {
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
                flash.message = message(code: 'default.created.message', args: [message(code: 'konfig.label', default: 'Konfig'), konfigInstance.id])
                redirect konfigInstance
            }
            '*' { respond konfigInstance, [status: CREATED] }
        }
    }

    def edit(Konfig konfigInstance) {
        respond konfigInstance
    }

    @Transactional
    def update(Konfig konfigInstance) {
        if (!konfigInstance) {
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Konfig.label', default: 'Konfig'), konfigInstance.id])
                redirect konfigInstance
            }
            '*' { respond konfigInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Konfig konfigInstance) {

        if (!konfigInstance) {
            notFound()
            return
        }

        konfigInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Konfig.label', default: 'Konfig'), konfigInstance.id])
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
}
