package mt.omid.rira.ntfy

import groovy.sql.Sql
import mt.omid.rira.SecureController

class NotifyController extends SecureController {

//    final SEND_SMS = "/opt/ECSCC/scripts/common/send_sms.pl"

    def dataSource
    def SMSService

    def index() {
//        def notifGroup = NotificationGroup.all
//        respond ( [ model : [ notifGroups : NotificationGroup.all, templates : Template.all ] ] )
//        respond notifGroups : NotificationGroup.all, model : [ notifGroups : NotificationGroup.all, templates : Template.all ]
        if( params.containsKey( 'user' ) ) {
            Sql sql = new Sql(dataSource)
            def rows = sql.rows("Select UserId From ECSCC_System.Users u where id = ${params.user}")
            session["user"] = rows[0][0]
        }
        else if( !session[ "user" ] )
            redirect( url: "http://${request.serverName}/" )

        [ notifGroups : NotificationGroup.all, templates : Template.all, history: NotificationHistory.findAllBySendDateGreaterThan( new Date().minus( 7 ), [ sort: 'sendDate', order: 'desc', readOnly: true ] ) ]
    }

    def send()
    {
        def notifGrpId = params.notifGroups
        def msg = params.message

        if( notifGrpId == null )
        {
            flash.error = "1 Group must be selected at least."
            redirect( action: "index" )
            return
        }

        if( msg == null )
        {
            flash.error = "Message must not be empty."
            redirect( action: "index" )
            return
        }

        if( msg.size() > 700 )
        {
            flash.error = "Message can't be more than 700 character [English]."
            redirect( action: "index" )
            return
        }

        def phones = NotificationGroup.getAll( notifGrpId ).recipients.phone

        def nh = new NotificationHistory()

        try
        {
//            File file = new File( "test.log" )
//            file << """${SEND_SMS} '${msg}'\r\n"""
//            file << "${SEND_SMS} '${msg}'\r\n"
//            phones.flatten().unique().each { def p = """${SEND_SMS} ${it} '${msg}'""".execute(); println "${p.text}" }
//            phones.flatten().unique().each { print ${it} }
            phones.flatten().unique().each { SMSService.sendSMS( it, msg ) }

            nh.user = session.user
            nh.message = msg

            def recp = ""
            phones.flatten().unique().each { recp += "${it} " }
            nh.recipients = recp
            nh.sendDate = new Date()
            nh.save( flush: true )
            flash.message = "Notification is sent."
        }
        catch ( Exception e )
        {
            flash.error = "Error in sending notification [${e.getMessage()}]"
            log.error( e.getMessage() )
        }

        redirect action: "index"
    }

    def admin()
    {

    }
}
