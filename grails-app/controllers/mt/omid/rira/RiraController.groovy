package mt.omid.rira

import org.codehaus.groovy.grails.web.util.WebUtils

abstract class RiraController
{
    def sessionService
    static layout = "rira"

    protected storeLocation()
    {
        session.returnTo = request.forwardURI - request.contextPath
    }

    protected redirectBackOr( defaultURI, notice = null )
    {
        log.debug( "Redirect back $defaultURI or $session.returnTo" )
        flash.message = notice
        if( session.returnTo )
        {
            def retUrl = session.returnTo
            clearReturnTo()
            redirect( url: retUrl )
        }
        else
        {
            redirect(url: defaultURI)
        }
    }

    protected clearReturnTo()
    {
        session.returnTo = null
    }


    protected auditActivity() {
        def safeParams = params.clone()
        safeParams.keySet().asList().each { String par -> if (par.toLowerCase().indexOf('pass') != -1 || par.toLowerCase().indexOf('cyph') != -1 || par.toLowerCase().indexOf('pswd') != -1) safeParams.remove(par) }
        if( actionName.startsWith('save') || actionName.startsWith('update') ) {
            Audit a = new Audit(dateTime: new Date(), user: sessionService.currentUser?.toString(), origin: WebUtils.retrieveGrailsWebRequest().request.remoteAddr, message: "$controllerName/$actionName [$safeParams]")
            if (!a.save())
                log.error("Audit Failed: ${sessionService.currentUser} IP: ${WebUtils.retrieveGrailsWebRequest().request.remoteAddr} $controllerName/$actionName [$safeParams]")
        }
    }

    protected auditActivity( String msg ) {
        Audit a = new Audit( dateTime: new Date(), user: sessionService.currentUser?.toString(), origin: WebUtils.retrieveGrailsWebRequest().request.remoteAddr, message: msg )
        if( !a.save() )
            log.error( "Audit Failed: ${sessionService.currentUser} IP: ${WebUtils.retrieveGrailsWebRequest().request.remoteAddr} $controllerName/$actionName [$params]" )
    }
}
