package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class AuditController extends SecureController {

    static allowedMethods = []

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Audit.list(params), model: [auditInstanceCount: Audit.count()]
    }

    def show(Audit auditInstance) {
        respond auditInstance
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'audit.label', default: 'Audit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
