package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class NodeProfileController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NodeProfile.list(params), model: [nodeProfileInstanceCount: NodeProfile.count()]
    }

    def show(NodeProfile nodeProfileInstance) {
        respond nodeProfileInstance
    }

    def create() {
        respond new NodeProfile(params)
    }

    def clone(NodeProfile nodeProfileInstance) {
        render view: 'create', model: [ nodeProfileInstance: new NodeProfile(nodeProfileInstance.properties)]
    }

    def createEmbeded()
    {
        render( template: "embededForm", model: [ nodeProfileInstance: new NodeProfile(params) ] )
    }

    @Transactional
    def save(NodeProfile nodeProfileInstance) {
        if (nodeProfileInstance == null) {
            notFound()
            return
        }

        if (nodeProfileInstance.hasErrors()) {
            respond nodeProfileInstance.errors, view: 'create'
            return
        }

        nodeProfileInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'nodeProfile.label', default: 'NodeProfile'), nodeProfileInstance])
                redirect nodeProfileInstance
            }
            '*' { respond nodeProfileInstance, [status: CREATED] }
        }
    }

    def edit(NodeProfile nodeProfileInstance) {
        respond nodeProfileInstance
    }

    def editEmbeded(NodeProfile nodeProfileInstance)
    {
        render( template: "embededForm", model: [ nodeProfileInstance: nodeProfileInstance ] )
    }

    @Transactional
    def update(NodeProfile nodeProfileInstance) {
        if (nodeProfileInstance == null) {
            notFound()
            return
        }

        if (nodeProfileInstance.hasErrors()) {
            respond nodeProfileInstance.errors, view: 'edit'
            return
        }

        nodeProfileInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'NodeProfile.label', default: 'NodeProfile'), nodeProfileInstance])
                redirect nodeProfileInstance
            }
            '*'{ respond nodeProfileInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NodeProfile nodeProfileInstance) {

        if (nodeProfileInstance == null) {
            notFound()
            return
        }

        nodeProfileInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NodeProfile.label', default: 'NodeProfile'), nodeProfileInstance])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'nodeProfile.label', default: 'NodeProfile'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
