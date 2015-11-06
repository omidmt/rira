package mt.omid.rira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class NodeTypeController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NodeType.list(params), model: [nodeTypeInstanceCount: NodeType.count()]
    }

    def show(NodeType nodeTypeInstance) {
        respond nodeTypeInstance
    }

    def create() {
        respond new NodeType(params)
    }

    def clone(NodeType nodeTypeInstance) {
        render view: 'create', model: [nodeTypeInstance: new NodeType(nodeTypeInstance.properties)]
    }

    def createEmbeded() {
        render(template: "embededForm", model: [nodeTypeInstance: new NodeType(params)])
    }

    @Transactional
    def save(NodeType nodeTypeInstance) {
        if (nodeTypeInstance == null) {
            notFound()
            return
        }

        if (nodeTypeInstance.hasErrors()) {
            respond nodeTypeInstance.errors, view: 'create'
            return
        }

        nodeTypeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'nodeType.label', default: 'NodeType'), nodeTypeInstance])
                redirect nodeTypeInstance
            }
            '*' { respond nodeTypeInstance, [status: CREATED] }
        }
    }

    def edit(NodeType nodeTypeInstance) {
        respond nodeTypeInstance
    }

    def editEmbeded(NodeType nodeTypeInstance) {
        render(template: "embededForm", model: [nodeTypeInstance: nodeTypeInstance])
    }

    @Transactional
    def update(NodeType nodeTypeInstance) {
        if (nodeTypeInstance == null) {
            notFound()
            return
        }

        if (nodeTypeInstance.hasErrors()) {
            respond nodeTypeInstance.errors, view: 'edit'
            return
        }

        nodeTypeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'NodeType.label', default: 'NodeType'), nodeTypeInstance])
                redirect nodeTypeInstance
            }
            '*' { respond nodeTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NodeType nodeTypeInstance) {

        if (nodeTypeInstance == null) {
            notFound()
            return
        }

        nodeTypeInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NodeType.label', default: 'NodeType'), nodeTypeInstance])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'nodeType.label', default: 'NodeType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
