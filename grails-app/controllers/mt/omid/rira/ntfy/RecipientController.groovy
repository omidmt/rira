package mt.omid.rira.ntfy


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import mt.omid.rira.SecureController

@Transactional(readOnly = true)
class RecipientController extends SecureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static layout = "notif_admin"

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Recipient.list(params), model: [recipientInstanceCount: Recipient.count()]
    }

    def show(Recipient recipientInstance) {
        respond recipientInstance
    }

    def create() {
        respond new Recipient(params)
    }

    def clone(Recipient recipientInstance) {
        render view: 'create', model: [recipientInstance: new Recipient(recipientInstance.properties)]
    }

    def createEmbeded() {
        render(template: "embededForm", model: [recipientInstance: new Recipient(params)])
    }

    @Transactional
    def save() {
        Recipient recipientInstance = new Recipient(name: params.name,
                email: params.email,
                instantMessaging: params.instantMessaging,
                phone: params.phone
        )
        recipientInstance.validate()
        if (recipientInstance == null) {
            notFound()
            return
        }

        if (recipientInstance.hasErrors()) {
            respond recipientInstance.errors, view: 'create'
            return
        }

        recipientInstance.save()

        updateGroups(recipientInstance, params.notifGroup)
        recipientInstance.validate()
        recipientInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'recipient.label', default: 'Recipient'), recipientInstance])
                redirect recipientInstance
            }
            '*' { respond recipientInstance, [status: CREATED] }
        }
    }

    def edit(Recipient recipientInstance) {
        respond recipientInstance
    }

    def editEmbeded(Recipient recipientInstance) {
        render(template: "embededForm", model: [recipientInstance: recipientInstance])
    }

    @Transactional
    def update() {
        Recipient recipientInstance = Recipient.get(params.id)
        if (recipientInstance == null) {
            notFound()
            return
        }

        recipientInstance.name = params.name
        recipientInstance.email = params.email
        recipientInstance.phone = params.phone
        recipientInstance.instantMessaging = params.instantMessaging

        updateGroups(recipientInstance, params.notifGroup)

        recipientInstance.validate()
        if (recipientInstance.hasErrors()) {
            respond recipientInstance.errors, view: 'edit'
            return
        }

        recipientInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Recipient.label', default: 'Recipient'), recipientInstance])
                redirect recipientInstance
            }
            '*' { respond recipientInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Recipient recipientInstance) {

        if (recipientInstance == null) {
            notFound()
            return
        }

        recipientInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Recipient.label', default: 'Recipient'), recipientInstance])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'recipient.label', default: 'Recipient'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    private void updateGroups(Recipient recipientInstance, notifGrpParam) {
        if(notifGrpParam) {
            // http://stackoverflow.com/questions/17420675/grails-controller-access-to-parameter-that-has-a-list-of-elements
            long [] notifGroups = notifGrpParam*.toLong()

            recipientInstance.groups.each { NotificationGroupMember ngm ->
                if(!(ngm.notificationGroupId in notifGroups)) {
                    ngm.delete()
                }
            }
            recipientInstance.groups?.clear()

            notifGroups.each {
                def group = NotificationGroupMember.findOrSaveByNotificationGroupAndRecipient(NotificationGroup.get(it), recipientInstance)
                recipientInstance.addToGroups(group)
            }
        }
        else {
            recipientInstance.groups.each { NotificationGroupMember ngm ->
                ngm.delete()
            }
            recipientInstance.groups?.clear()
        }
    }
}
