package mt.omid.rira

abstract class UnSecureController extends RiraController
{
    def beforeInterceptor = {
        auditActivity()
    }
}
