package mt.omid.rira

import groovy.time.TimeCategory
import groovy.util.logging.Slf4j

import org.codehaus.groovy.grails.web.util.WebUtils

@Slf4j
class SessionService
{

    static transactional = false

//    public static final int NO_SESSION_DATA = 1
//    public static final int d = 2

    def authenticate( session )
    {
        // RequestContextHolder.currentRequestAttributes().session
//        log.debug "Test token existence $session.token"
        if ( !( session.token && session.token[ 0 ] ) )
        {
            return false
        }

        def token = session?.token
        def uid = token[ 0 ]
        def salt = token[ 1 ]
        def ip = token[ 2 ]
        Date expiry = token[ 3 ]

        // Applog.info "Expiry and remote IP : COOKIE=[#{expiry} #{ip}] SYS=[#{DateTime.current} #{request.remote_ip}]"
        // Applog.info "Expiry Checking=#{expiry > DateTime.current} IP Checking=#{ip == request.remote_ip}"

        if( expiry
                && ( expiry.after(new Date()) || Konfig.KONFIGS[ 'sessionInactivityTimeout' ] <= 0 )
                && ip ==  WebUtils.retrieveGrailsWebRequest().request.remoteAddr )
        {
            def user = User.authenticateWithSalt( uid, salt )

            log.debug "Authenticated with existing cookie = $user"

            // renew expiry of session because of new activity
            if( user )
            {
                use( TimeCategory )
                {
                    session.token[3] = Konfig.KONFIGS.sessionInactivityTimeout > 0 ? Konfig.KONFIGS.sessionInactivityTimeout.seconds.from.now : null
                }
            }
            return user
        }

        // Applog.info "Expiry or remote IP is invalid, invalidating COOKIE=[#{expiry} #{ip}] SYS=[#{DateTime.current} #{request.remote_ip}]"
        return null
    }

    boolean authorize( controller, action )
    {
        def user = getCurrentUser()

        String ctrlAct = "$controller/$action"

//        log.debug "User rights: ${user.rights*.toString()}"
        log.debug "Authorize ${ctrlAct} Result=${user.rights*.toString().contains( ctrlAct )}"

        if( user.rights*.toString().contains( ctrlAct ) )
            return true

        // Common action of every user
        return ( controller == 'home' && action == 'index' ) ||
               ( controller == 'user' && action == 'settings' ) ||
               ( controller == 'managedUser' && action == 'showMUser' ) ||
               ( controller == 'menuOptions' )
    }

    void signIn( user, session )
    {
        session.token = [ user.id, user.salt, WebUtils.retrieveGrailsWebRequest().request.remoteAddr ]
        use( TimeCategory )
        {
            session.token[3] = Konfig.KONFIGS.sessionInactivityTimeout > 0 ? Konfig.KONFIGS.sessionInactivityTimeout.seconds.from.now : null
        }
        //request.remote_ip, Konfig::KONFIGS[ :sessionInactivityTimeout ].seconds.from_now ]
    }

    void signOut( session )
    {
//        def session = WebUtils.retrieveGrailsWebRequest().session
        session?.removeAttribute('token')
        session?.invalidate()
    }

    User getCurrentUser()
    {
        return User.get( WebUtils.retrieveGrailsWebRequest()?.session?.token?.getAt( 0 ) )
    }
}
