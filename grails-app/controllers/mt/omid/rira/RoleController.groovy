package mt.omid.rira

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RoleController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static scaffold = true

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Role.list(params), model: [roleInstanceCount: Role.count()]
    }

    def show(Role roleInstance) {
        respond roleInstance
    }

    def create() {
        respond new Role(params)
    }

    @Transactional
    def save(Role roleInstance) {
        if (!roleInstance) {
            notFound()
            return
        }

        if (roleInstance.hasErrors()) {
            respond roleInstance.errors, view: 'create'
            return
        }

        roleInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'role.label', default: 'Role'), roleInstance.id])
                redirect roleInstance
            }
            '*' { respond roleInstance, [status: CREATED] }
        }
    }

    def edit(Role roleInstance) {
        respond roleInstance
    }

    @Transactional
    def update(Role roleInstance) {
        if (!roleInstance) {
            notFound()
            return
        }

        if (roleInstance.hasErrors()) {
            respond roleInstance.errors, view: 'edit'
            return
        }

        roleInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Role.label', default: 'Role'), roleInstance.id])
                redirect roleInstance
            }
            '*' { respond roleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Role roleInstance) {

        if (!roleInstance) {
            notFound()
            return
        }

        def members = User.withCriteria {
            roles {
                eq 'id', roleInstance.id
            }
        }
        members.each{ it.removeFromRoles( roleInstance ) }

        roleInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Role.label', default: 'Role'), roleInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
