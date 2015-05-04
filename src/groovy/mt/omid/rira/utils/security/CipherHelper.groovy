package mt.omid.rira.utils.security

import groovy.util.logging.Slf4j
import org.bouncycastle.jce.provider.BouncyCastleProvider
import org.bouncycastle.openssl.PEMReader

import java.security.KeyPair
import java.security.Security

/**
 * Created by Omid on 5/3/2015.
 */

@Slf4j
class CipherHelper {

    def prk, phr, digest, key

    def reload()
    {
        log.info 'Reloading RSA'

        try
        {
            Security.addProvider( new BouncyCastleProvider() )
            prk = new PEMReader()


        }
        catch ( Exception e )
        {

        }

//        RSAHelper.prk = File.read( Rails.root.to_s + '/config/pr.key' )
//        RSAHelper.phr = Base64.decode64 'b21pZHJpcmE='
//        RSAHelper.digest = OpenSSL::Digest::SHA256.new
//        RSAHelper.key = OpenSSL::PKey::RSA.new RSAHelper.prk, RSAHelper.phr
//        rescue => err
//        Applog.error "Error on initializing security.rb keys"
//        Applog.error err.message
//        Applog.error err.backtrace.join("\n")
    }
}
