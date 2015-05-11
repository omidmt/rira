package mt.omid.rira

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Transactional(readOnly = true)
class DataConnectionController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DataConnection.list(params), model: [dataSourceInstanceCount: DataConnection.count()]
    }

    def show(DataConnection dataSourceInstance) {
        respond dataSourceInstance
    }

    def create() {
        respond new DataConnection(params)
    }

    def createEmbeded() {
        render(template: "embededForm", model: [dataSourceInstance: new DataConnection(params)])
    }

    @Transactional
    def save(DataConnection dataSourceInstance) {
        if (dataSourceInstance == null) {
            notFound()
            return
        }

        if (dataSourceInstance.hasErrors()) {
            respond dataSourceInstance.errors, view: 'create'
            return
        }

        dataSourceInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dataSource.label', default: 'DataConnection'), dataSourceInstance.id])
                redirect dataSourceInstance
            }
            '*' { respond dataSourceInstance, [status: CREATED] }
        }
    }

    def edit(DataConnection dataSourceInstance) {
        respond dataSourceInstance
    }

    def editEmbeded(DataConnection dataSourceInstance) {
        render(template: "embededForm", model: [dataSourceInstance: dataSourceInstance])
    }

    @Transactional
    def update(DataConnection dataSourceInstance) {
        if (dataSourceInstance == null) {
            notFound()
            return
        }

        if (dataSourceInstance.hasErrors()) {
            respond dataSourceInstance.errors, view: 'edit'
            return
        }

        dataSourceInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DataConnection.label', default: 'DataConnection'), dataSourceInstance.id])
                redirect dataSourceInstance
            }
            '*' { respond dataSourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DataConnection dataSourceInstance) {

        if (dataSourceInstance == null) {
            notFound()
            return
        }

        dataSourceInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DataConnection.label', default: 'DataConnection'), dataSourceInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dataSource.label', default: 'DataConnection'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
