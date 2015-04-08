package mt.omid.rira.utils.security

import groovy.transform.CompileStatic
import groovy.util.logging.Slf4j

import java.security.MessageDigest

import javax.crypto.Cipher
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec

/**
 * @author eomimeh
 */
@CompileStatic
@Slf4j
class Encoder
{
    static final String slt = "OMTv1CAMP"
    static final String k   = "OMTv1CAMPk1"

    static String encrypt( String msg )
    {
        Cipher c = Cipher.getInstance( 'AES/CBC/PKCS5Padding' )
        byte[] keyBytes = MessageDigest.getInstance( 'SHA-256' ).digest( "${slt}${k}".bytes )[ 0..<16 ]
        c.init( Cipher.ENCRYPT_MODE, new SecretKeySpec( keyBytes, 'AES' ), new IvParameterSpec( new byte[16] ) )
        def res = c.doFinal( msg.getBytes( "UTF-8" ) ).encodeBase64()
    }

    static String decrypt( String hash )
    {
        Cipher c = Cipher.getInstance( 'AES/CBC/PKCS5Padding' )
        byte[] keyBytes = MessageDigest.getInstance( 'SHA-256' ).digest( "${slt}${k}".bytes )[0..<16]
        c.init( Cipher.DECRYPT_MODE, new SecretKeySpec( keyBytes, 'AES' ), new IvParameterSpec( new byte[16] ) )
        new String( c.doFinal( hash.decodeBase64() ), "UTF-8" )
    }
}
