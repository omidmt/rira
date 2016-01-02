package mt.omid.rira

import org.springframework.http.HttpStatus

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InvitationController extends SecureController {

    def invitationService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Invitation.list(params), model: [invitationInstanceCount: Invitation.count()]
    }

    def show(Invitation invitationInstance) {
        respond invitationInstance
    }

    def create() {
        respond new Invitation(params)
    }

    def clone(Invitation invitationInstance) {
        render view: 'create', model: [invitationInstance: new Invitation(invitationInstance.properties)]
    }

    def createEmbeded() {
        render(template: "embededForm", model: [invitationInstance: new Invitation(params)])
    }

    @Transactional
    def save(Invitation invitationInstance) {
        if (invitationInstance == null) {
            notFound()
            return
        }

        if(User.findByEmail(invitationInstance.email)) {
                request.withFormat {
                    form multipartForm {
                        flash.error = "This user is already created."
                        redirect action: "index", method: "GET"
                    }
                    '*' { render status: HttpStatus.NOT_ACCEPTABLE }
                }
                return
        }

        Invitation invite = Invitation.findOrCreateByEmail(invitationInstance.email)
        invite.name = invitationInstance.name
        invite.role = invitationInstance.role

        invite.uid = invitationService.generateUID()
        invite.expiry = (new Date()).plus(Konfig.KONFIGS.invitationExpiryDays)
        invite.invitee = sessionService.currentUser.email
        invite.validate()

        if (invite.hasErrors()) {
            respond invite.errors, view: 'create'
            return
        }

        invite.save flush: true
        invitationService.invite(invite)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'invitation.label', default: 'Invitation'), invite])
                redirect invite
            }
            '*' { respond invite, [status: CREATED] }
        }
    }

    def edit(Invitation invitationInstance) {
        respond invitationInstance
    }

    def editEmbeded(Invitation invitationInstance) {
        render(template: "embededForm", model: [invitationInstance: invitationInstance])
    }

    @Transactional
    def update(Invitation invitationInstance) {
        if (invitationInstance == null) {
            notFound()
            return
        }

        if (invitationInstance.hasErrors()) {
            respond invitationInstance.errors, view: 'edit'
            return
        }

        invitationInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Invitation.label', default: 'Invitation'), invitationInstance])
                redirect invitationInstance
            }
            '*' { respond invitationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Invitation invitationInstance) {

        if (invitationInstance == null) {
            notFound()
            return
        }

        invitationInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Invitation.label', default: 'Invitation'), invitationInstance])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'invitation.label', default: 'Invitation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
