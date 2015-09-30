package mt.omid.rira.ntfy

import grails.transaction.Transactional
import grails.util.Holders
import groovy.util.logging.Slf4j
import static mt.omid.rira.Konfig.KONFIGS
import mt.omid.rira.User

@Slf4j
@Transactional
class RiraMailService {


    def assetResourceLocator
    def asynchronousMailService
    def grailsApplication

    static byte [] logoBA

    void initialize() {
        log.info("Initialize rira mail service")
        logoBA = assetResourceLocator.findAssetForURI(Holders.grailsApplication.mergedConfig.grails.plugin.rira.logoSmall).getByteArray()
    }

    def sendAlertMail( User user, String msg, int severity=0 ) {
        asynchronousMailService.sendAsynchronousMail {
            from "${KONFIGS.mailFromAddress}"
            to user.email
            multipart true
            subject "Change of ${KONFIGS.appName} Password"
            inline "logo", "image/png", logoBA
            text view: "/mail/alert-html", model: [message: msg]
            html view: "/mail/alert-html", model: [message: msg]
        }
    }

    def sendWelcomeMail( User user, String password ) {
        if(!KONFIGS.sendPasswordInMail)
            password = "********"

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
