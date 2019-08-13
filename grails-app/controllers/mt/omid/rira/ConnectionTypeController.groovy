package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class ConnectionTypeController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        withFormat {
            'html' {
                respond ConnectionType.list(params), model: [connectionTypeInstanceCount: ConnectionType.count()]
            }
            'json' { respond ConnectionType.list(), [status: CREATED] }
            'xml' { respond ConnectionType.list(), [status: CREATED] }
        }
    }

    def show(ConnectionType connectionTypeInstance) {
        respond connectionTypeInstance
    }

    def create() {
        respond new ConnectionType(params)
    }

    def clone(ConnectionType connectionTypeInstance) {
        render view: 'create', model: [connectionTypeInstance: new ConnectionType(connectionTypeInstance.properties)]
    }

    def createEmbeded() {
        render(template: "embededForm", model: [connectionTypeInstance: new ConnectionType(params)])
    }

    @Transactional
    def save(ConnectionType connectionTypeInstance) {
        if (connectionTypeInstance == null) {
            notFound()
            return
        }

        if (connectionTypeInstance.hasErrors()) {
            respond connectionTypeInstance.errors, view: 'create'
            return
        }

        connectionTypeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'connectionType.label', default: 'ConnectionType'), connectionTypeInstance])
                redirect connectionTypeInstance
            }
            '*' { respond connectionTypeInstance, [status: CREATED] }
        }
    }

    def edit(ConnectionType connectionTypeInstance) {
        respond connectionTypeInstance
    }

    def editEmbeded(ConnectionType connectionTypeInstance) {
        render(template: "embededForm", model: [connectionTypeInstance: connectionTypeInstance])
    }

    @Transactional
    def update(ConnectionType connectionTypeInstance) {
        if (connectionTypeInstance == null) {
            notFound()
            return
        }

        if (connectionTypeInstance.hasErrors()) {
            respond connectionTypeInstance.errors, view: 'edit'
            return
        }

        connectionTypeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConnectionType.label', default: 'ConnectionType'), connectionTypeInstance])
                redirect connectionTypeInstance
            }
            '*' { respond connectionTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConnectionType connectionTypeInstance) {

        if (connectionTypeInstance == null) {
            notFound()
            return
        }

        connectionTypeInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConnectionType.label', default: 'ConnectionType'), connectionTypeInstance])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'connectionType.label', default: 'ConnectionType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
