package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class RightController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Right.list(params), model: [rightInstanceCount: Right.count()]
    }

    def show(Right rightInstance) {
        respond rightInstance
    }

    def create() {
        respond new Right(params)
    }

    def clone(Right rightInstance) {
        render view: 'create', model: [ rightInstance: new Right(rightInstance.properties)]
    }

    def createEmbeded()
    {
        render( template: "embededForm", model: [ rightInstance: new Right(params) ] )
    }

    @Transactional
    def save(Right rightInstance) {
        if (rightInstance == null) {
            notFound()
            return
        }

        if (rightInstance.hasErrors()) {
            respond rightInstance.errors, view: 'create'
            return
        }

        rightInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'right.label', default: 'Right'), rightInstance])
                redirect rightInstance
            }
            '*' { respond rightInstance, [status: CREATED] }
        }
    }

    def edit(Right rightInstance) {
        respond rightInstance
    }

    def editEmbeded(Right rightInstance)
    {
        render( template: "embededForm", model: [ rightInstance: rightInstance ] )
    }

    @Transactional
    def update(Right rightInstance) {
        if (rightInstance == null) {
            notFound()
            return
        }

        if (rightInstance.hasErrors()) {
            respond rightInstance.errors, view: 'edit'
            return
        }

        rightInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Right.label', default: 'Right'), rightInstance])
                redirect rightInstance
            }
            '*'{ respond rightInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Right rightInstance) {

        if (rightInstance == null) {
            notFound()
            return
        }

        def roles = Role.withCriteria {
            rights {
                eq 'id', rightInstance.id
            }
        }
        roles.each{ it.removeFromRights( rightInstance ) }

        rightInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Right.label', default: 'Right'), rightInstance])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'right.label', default: 'Right'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
