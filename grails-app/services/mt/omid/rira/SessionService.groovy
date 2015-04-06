package mt.omid.rira

import grails.transaction.Transactional
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.web.util.WebUtils

@Transactional
class SessionService
{
//    private static final log = LogFactory.getLog( this )

//    public final static int NO_SESSION_DATA = 1
//    public final static int d = 2

    def authenticate( session )
    {
        // RequestContextHolder.currentRequestAttributes().getSession()
//        log.debug "Test token existence ${session.token}"
        if ( !( session.token && session.token[ 0 ] ) )
        {
            return false
        }

        def token = session?.token
        def uid = token[ 0 ]
        def salt = token[ 1 ]
        def ip = token[ 2 ]
        def expiry = token[ 3 ]

        // Applog.info "Expiry and remote IP : COOKIE=[#{expiry} #{ip}] SYS=[#{DateTime.current} #{request.remote_ip}]"
        // Applog.info "Expiry Checking=#{expiry > DateTime.current} IP Checking=#{ip == request.remote_ip}"

        if( expiry
                && ( expiry > new Date() || Konfig.KONFIGS[ 'sessionInactivityTimeout' ] <= 0 )
                && ip ==  WebUtils.retrieveGrailsWebRequest().getRequest().getRemoteAddr() )
        {
            def user = User.authenticateWithSalt( uid, salt )

            log.debug "Authenticated with existing cookie = ${user}"

            // renew expiry of session because of new activity
            if( user )
            {
                use( groovy.time.TimeCategory )
                        {
                            session.token[3] = Konfig.KONFIGS.sessionInactivityTimeout > 0 ? Konfig.KONFIGS.sessionInactivityTimeout.seconds.from.now : null
                        }
            }
            return user
        }
        else
        {
            // Applog.info "Expiry or remote IP is invalid, invalidating COOKIE=[#{expiry} #{ip}] SYS=[#{DateTime.current} #{request.remote_ip}]"
            return null
        }
    }

    def authorize( controller, action )
    {
        def user = getCurrentUser()

        String ctrlAct = "${controller}/${action}"

//        log.debug "User rights: ${user.rights*.toString()}"
        log.debug "Authorize ${ctrlAct} Result=${user.rights*.toString().contains( ctrlAct )}"

        if( user.rights*.toString().contains( ctrlAct ) )
            return true

        // Common action of every user
        if(        ( controller == 'home' && action == 'index' )
                || ( controller == 'user' && action == 'settings' )
                || ( controller == 'managedUser' && action == 'showMUser' )
                || ( controller == 'menuOptions' ) )
            return true

        return false
    }

    def signIn( user, session )
    {
        session.token = [ user.id, user.salt, WebUtils.retrieveGrailsWebRequest().getRequest().getRemoteAddr() ]
        use( groovy.time.TimeCategory )
                {
                    session.token[3] = Konfig.KONFIGS.sessionInactivityTimeout > 0 ? Konfig.KONFIGS.sessionInactivityTimeout.seconds.from.now : null
                }
        //request.remote_ip, Konfig::KONFIGS[ :sessionInactivityTimeout ].seconds.from_now ]

    }

    def signOut( session )
    {
//        def session = WebUtils.retrieveGrailsWebRequest().getSession()
        session?.token = null
//        session.token = [ null, null, null, null ]
        session?.remove( "token" )
        session?.invalidate()
    }

    public User getCurrentUser()
    {
        def webUtils = WebUtils.retrieveGrailsWebRequest()
        return User.findById( webUtils.getSession().token[ 0 ] )
    }
}
