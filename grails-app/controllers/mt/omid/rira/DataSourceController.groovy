package mt.omid.rira


import mt.omid.rira.SecureController

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class DataSourceController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DataSource.list(params), model: [dataSourceInstanceCount: DataSource.count()]
    }

    def show(DataSource dataSourceInstance) {
        respond dataSourceInstance
    }

    def create() {
        respond new DataSource(params)
    }

    def createEmbeded() {
        render(template: "embededForm", model: [dataSourceInstance: new DataSource(params)])
    }

    @Transactional
    def save(DataSource dataSourceInstance) {
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
                flash.message = message(code: 'default.created.message', args: [message(code: 'dataSource.label', default: 'DataSource'), dataSourceInstance.id])
                redirect dataSourceInstance
            }
            '*' { respond dataSourceInstance, [status: CREATED] }
        }
    }

    def edit(DataSource dataSourceInstance) {
        respond dataSourceInstance
    }

    def editEmbeded(DataSource dataSourceInstance) {
        render(template: "embededForm", model: [dataSourceInstance: dataSourceInstance])
    }

    @Transactional
    def update(DataSource dataSourceInstance) {
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DataSource.label', default: 'DataSource'), dataSourceInstance.id])
                redirect dataSourceInstance
            }
            '*' { respond dataSourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DataSource dataSourceInstance) {

        if (dataSourceInstance == null) {
            notFound()
            return
        }

        dataSourceInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DataSource.label', default: 'DataSource'), dataSourceInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dataSource.label', default: 'DataSource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
