package mt.omid.rira

import grails.transaction.Transactional
import groovy.time.TimeCategory
import groovy.util.logging.Slf4j

@Slf4j
@Transactional
class UserService {

    def sessionService
    def securityService
    def riraMailService

    User updateUserPassword(String cd, String sk, User user) {
        def(curPass, newPass, confPass) = securityService.decryptChangePasswordHash(cd, sk)

        if(!user.locked && user?.hasPassword( curPass ))
        {
            user.password = newPass
            user.passwordConfirmation = confPass
            user.validate()
            if( !user.hasErrors() ) {
                log.debug "User new pass is OK, saving..."
                if(user.save(true)) {
                    user.forcePasswordChange = false
                    use(TimeCategory) {
                        user.passwordExpiry = new Date() + Konfig.KONFIGS['passwordExpiryExtension'].toInteger().days
                    }
                    user.save()
                    riraMailService.sendAlertMail(user, "Your password is changed and extended to ${user.passwordExpiry}," +
                            " please inform admin if you did not change or being informed about it.")
                }
            }
            user
        }
        else {
            user?.loginFailed()
            log.error "Wrong current password or user [${user}]"
            return null
        }

    }
}
