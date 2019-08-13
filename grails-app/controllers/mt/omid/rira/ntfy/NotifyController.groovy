package mt.omid.rira.ntfy

import groovy.sql.Sql
import groovy.util.logging.Slf4j
import mt.omid.rira.SecureController

@Slf4j
class NotifyController extends SecureController {

//    final SEND_SMS = "/opt/ECSCC/scripts/common/send_sms.pl"

    def dataSource
    def SMSService
    def sessionService

    def index() {
        [ notifGroups : NotificationGroup.all, templates : Template.all,
          history: NotificationHistory.findAllBySendDateGreaterThan( new Date() - 7, [ sort: 'sendDate', order: 'desc', readOnly: true ] ) ]
    }

    def send(String message)
    {
        def notifGrpId = params.notifGroups

        if( notifGrpId == null )
        {
            flash.error = "One group must be selected at least."
            redirect( action: "index" )
            return
        }

        if( message == null )
        {
            flash.error = "Message must not be empty."
            redirect( action: "index" )
            return
        }

        if( message.size() > 700 )
        {
            flash.error = "Message can't be more than 700 characters [English]."
            redirect( action: "index" )
            return
        }

        def phones = NotificationGroup.getAll( notifGrpId ).recipients.phone

        def nh = new NotificationHistory()

        try
        {
            SMSService.sendSMS(phones.flatten().unique(), message)

            nh.user = "${sessionService.currentUser?.name} [${sessionService.currentUser?.email}]"
            nh.message = message

            String recp = ""
            phones.flatten().unique().each { recp += "$it " }
            nh.recipients = recp
            nh.sendDate = new Date()
            nh.save( flush: true )
            flash.message = "Notification is sent."
        }
        catch ( e )
        {
            flash.error = "Error in sending notification [$e.message]"
            log.error(e.message, e)
        }

        redirect action: "index"
    }

    def admin()
    {
    }
}
