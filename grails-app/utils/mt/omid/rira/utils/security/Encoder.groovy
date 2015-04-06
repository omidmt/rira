package mt.omid.rira.utils.security

import groovy.util.logging.Log
import groovy.util.logging.Log4j

import javax.crypto.Cipher
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec
import java.security.MessageDigest

/**
 * Created by eomimeh on 8/4/2014.
 */
@Log4j
class Encoder
{
    def static slt = "OMTv1CAMP"
    def static k   = "OMTv1CAMPk1"

    def static encrypt( msg )
    {
        Cipher c = Cipher.getInstance( 'AES/CBC/PKCS5Padding' )
        byte[] keyBytes = MessageDigest.getInstance( 'SHA-256' ).digest( "${slt}${k}".getBytes() )[ 0..<16 ]
        c.init( Cipher.ENCRYPT_MODE, new SecretKeySpec( keyBytes, 'AES' ), new IvParameterSpec( new byte[16] ) )
        def res = c.doFinal( msg.getBytes( "UTF-8" ) ).encodeBase64()
    }

    def static decrypt( hash )
    {
        Cipher c = Cipher.getInstance( 'AES/CBC/PKCS5Padding' )
        byte[] keyBytes = MessageDigest.getInstance( 'SHA-256' ).digest( "${slt}${k}".getBytes() )[0..<16]
        c.init( Cipher.DECRYPT_MODE, new SecretKeySpec( keyBytes, 'AES' ), new IvParameterSpec( new byte[16] ) )
        new String( c.doFinal( hash.decodeBase64() ), "UTF-8" )
    }
}
