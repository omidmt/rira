package mt.omid.rira.ntfy

import asset.pipeline.grails.AssetResourceLocator
import grails.transaction.Transactional
import grails.util.Holders
import groovy.util.logging.Slf4j
import org.apache.commons.io.IOUtils
import org.springframework.core.io.Resource

import static mt.omid.rira.Konfig.KONFIGS
import mt.omid.rira.User

@Slf4j
@Transactional
class RiraMailService {

    def asynchronousMailService
    def grailsApplication

    static byte [] logoBA

    static void initialize() {
        log.info("Initialize rira mail service")
        try {
            Resource res = ((AssetResourceLocator) Holders.grailsApplication.mainContext.getBean("assetResourceLocator"))?.findAssetForURI(Holders.grailsApplication.mergedConfig.grails.plugin.rira.logoSmall)
            logoBA = IOUtils.toByteArray(res.getInputStream())
        }
        catch( e ) {
            log.error "RiraMailService initialization failed " + e.message
            logoBA = [0, 0, 0, 0]
        }
    }

    def sendAlertMail( User user, String msg, int severity=0 ) {
        asynchronousMailService.sendAsynchronousMail {
            from "${KONFIGS.mailFromAddress}"
            to user.email
            multipart true
            subject "Change of ${KONFIGS.appName} Password"
            inline "logo", "image/png", logoBA
            text view: "/mail/alert-txt", model: [message: msg]
            html view: "/mail/alert-html", model: [message: msg]
        }
    }

    def sendWelcomeMail( User user, String password ) {
        if(!KONFIGS.sendPasswordInMail)
            password = "********"

        try {
            asynchronousMailService.sendAsynchronousMail {
                from "${KONFIGS.appName} Admin<${KONFIGS.mailFromAddress}>"
                to user.email
                multipart true
                subject "Welcome to ${KONFIGS.appName}"
                inline "logo", "image/jpeg", logoBA
                text view: "/mail/welcome-txt", model: [user: user, password: password]
                html view: "/mail/welcome-html", model: [user: user, password: password]
            }
        }
        catch(e) {
            log.error("Sending welcome mail failed, ignoring it. error: $e.message", e)
        }
    }

    def sendInvitation(String name, String email, String uid) {
        asynchronousMailService.sendAsynchronousMail {
            from "${KONFIGS.appName} Admin<${KONFIGS.mailFromAddress}>"
            to email
            multipart true
            subject "Invitation to ${KONFIGS.appName}"
            inline "logo", "image/jpeg", logoBA
            text view: "/mail/invite-txt", model: [uid: uid, name: name]
            html view: "/mail/invite-html", model: [uid: uid, name: name]
        }
    }

    def sendMail( String toAddr, String subj, String body ) {
        try {
            asynchronousMailService.sendAsynchronousMail {
                from "${KONFIGS.mailFromAddress}"
                to "${toAddr}";
                subject "${subj}";
                html "${body}";
                immediate true;   // Run the send job after the message was created
            }
        }
        catch ( e )
        {
            log.error( "Sending mail failed [" + e.message + "]" )
        }
    }

    def sendMail( Closure cls ) {
        try {
            asynchronousMailService.sendAsynchronousMail cls
        }
        catch ( e )
        {
            log.error( "Sending mail failed [" + e.message + "]" )
        }
    }
}
