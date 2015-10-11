package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class DataConnectionController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DataConnection.list(params), model: [dataConnectionInstanceCount: DataConnection.count()]
    }

    def show(DataConnection dataConnectionInstance) {
        respond dataConnectionInstance
    }

    def create() {
        respond new DataConnection(params)
    }

    def clone(DataConnection dataConnectionInstance) {
        render view: 'create', model: [dataConnectionInstance: new DataConnection(dataConnectionInstance.properties)]
    }

    def createEmbeded() {
        render(template: "embededForm", model: [dataConnectionInstance: new DataConnection(params)])
    }

    @Transactional
    def save(DataConnection dataConnectionInstance) {
        if (dataConnectionInstance == null) {
            notFound()
            return
        }

        if (dataConnectionInstance.hasErrors()) {
            respond dataConnectionInstance.errors, view: 'create'
            return
        }

        dataConnectionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dataConnection.label', default: 'DataConnection'), dataConnectionInstance])
                redirect dataConnectionInstance
            }
            '*' { respond dataConnectionInstance, [status: CREATED] }
        }
    }

    def edit(DataConnection dataConnectionInstance) {
        respond dataConnectionInstance
    }

    def editEmbeded(DataConnection dataConnectionInstance) {
        render(template: "embededForm", model: [dataConnectionInstance: dataConnectionInstance])
    }

    @Transactional
    def update(DataConnection dataConnectionInstance) {
        if (dataConnectionInstance == null) {
            notFound()
            return
        }

        if (dataConnectionInstance.hasErrors()) {
            respond dataConnectionInstance.errors, view: 'edit'
            return
        }

        dataConnectionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DataConnection.label', default: 'DataConnection'), dataConnectionInstance])
                redirect dataConnectionInstance
            }
            '*' { respond dataConnectionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DataConnection dataConnectionInstance) {

        if (dataConnectionInstance == null) {
            notFound()
            return
        }

        dataConnectionInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DataConnection.label', default: 'DataConnection'), dataConnectionInstance])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dataConnection.label', default: 'DataConnection'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
