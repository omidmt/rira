package mt.omid.rira

import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class NodeController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Node.list(params), model: [nodeInstanceCount: Node.count()]
    }

    def show(Node nodeInstance) {
        respond nodeInstance
    }

    def create() {
        respond new Node(params)
    }

    def clone(Node nodeInstance) {
        render view: 'create', model: [ nodeInstance: new Node(nodeInstance.properties)]
    }

    def createEmbeded()
    {
        render( template: "embededForm", model: [ nodeInstance: new Node(params) ] )
    }

    @Transactional
    def save(Node nodeInstance) {
        if (nodeInstance == null) {
            notFound()
            return
        }

        if (nodeInstance.hasErrors()) {
            respond nodeInstance.errors, view: 'create'
            return
        }

        nodeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'node.label', default: 'Node'), nodeInstance])
                redirect nodeInstance
            }
            '*' { respond nodeInstance, [status: CREATED] }
        }
    }

    def edit(Node nodeInstance) {
        respond nodeInstance
    }

    def editEmbeded(Node nodeInstance)
    {
        render( template: "embededForm", model: [ nodeInstance: nodeInstance ] )
    }

    @Transactional
    def update(Node nodeInstance) {
        if (nodeInstance == null) {
            notFound()
            return
        }

        if (nodeInstance.hasErrors()) {
            respond nodeInstance.errors, view: 'edit'
            return
        }

        nodeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Node.label', default: 'Node'), nodeInstance])
                redirect nodeInstance
            }
            '*'{ respond nodeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Node nodeInstance) {

        if (nodeInstance == null) {
            notFound()
            return
        }

        try {
            nodeInstance.delete flush: true
        }
        catch(DataIntegrityViolationException dex) {
            log.error("The node ${nodeInstance}, external foreignkeys is not deleted yet: [$dex.message]")
            flash.error = "The node ${nodeInstance}, external foreignkeys is not deleted yet: [$dex.message]"
            redirect nodeInstance
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Node.label', default: 'Node'), nodeInstance])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'node.label', default: 'Node'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
