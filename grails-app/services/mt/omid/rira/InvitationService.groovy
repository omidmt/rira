package mt.omid.rira

import grails.transaction.Transactional

@Transactional
class InvitationService {

    def riraMailService

    def invite(Invitation inv) {
        riraMailService.sendInvitation(inv.name, inv.email, inv.uid)
    }

    def expire() {

    }

    String generateUID() {
        UUID.randomUUID().toString()
    }

}
