package mt.omid.rira

abstract class RiraController
{
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
}
