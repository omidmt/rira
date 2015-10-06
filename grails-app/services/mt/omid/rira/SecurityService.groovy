package mt.omid.rira

import grails.transaction.Transactional
import groovy.util.logging.Slf4j
import org.bouncycastle.crypto.BufferedBlockCipher
import org.bouncycastle.crypto.CipherParameters
import org.bouncycastle.crypto.InvalidCipherTextException
import org.bouncycastle.crypto.engines.AESEngine
import org.bouncycastle.crypto.generators.OpenSSLPBEParametersGenerator
import org.bouncycastle.crypto.modes.CBCBlockCipher
import org.bouncycastle.crypto.paddings.BlockCipherPadding
import org.bouncycastle.crypto.paddings.PKCS7Padding
import org.bouncycastle.crypto.paddings.PaddedBufferedBlockCipher
import org.bouncycastle.openssl.PEMDecryptorProvider
import org.bouncycastle.openssl.PEMEncryptedKeyPair
import org.bouncycastle.openssl.PEMParser
import org.bouncycastle.openssl.jcajce.JcaPEMKeyConverter
import org.bouncycastle.openssl.jcajce.JcePEMDecryptorProviderBuilder


import javax.annotation.PostConstruct
import javax.crypto.Cipher
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec
import java.nio.charset.StandardCharsets
import java.security.KeyPair
import java.security.MessageDigest
import java.security.Security

/***
 * This class RSA transformation and base64 coding aligned to support pidcrypt javascript lib.
 */
@Slf4j
@Transactional
class SecurityService {

    static {
        Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider())
    }

//    Cipher encryptRSACipher, decryptRSACipher, encAESCipher, decAESCipher
    static final String SALT = "OMTv1CAMP"
    static final String KEY   = "OMTv1CAMPk1"
    static final int KEY_LEN_BIT = 256
    static final int AES_IV_BIT = 128
    static KeyPair rsaKP
    static byte[] aesKeyBytes

    public static void init() {
        log.info("Initializing Security Service")
        // RSA initialization
        rsaKP = getKeyPair(Konfig.KONFIGS['pemPrivateKey'], Konfig.KONFIGS['pemKeyPassword'].toCharArray())

        // AES initialization
        aesKeyBytes = MessageDigest.getInstance('SHA-256').digest( "${SALT}${KEY}".bytes )[ 0..<16 ]

    }

    /***
     * Decrypt encrypted text from sign-in page form
     *
     * @param crypted
     * @param sessionKey
     * @return
     */
    public String[] decryptLoginHash( String crypted, String sessionKey) {
        if( crypted == null || sessionKey == null )
            return [null, null]
        String tmp = decryptPGP(crypted, sessionKey, 3610)
        if(tmp) {
            String[] up = tmp.split('\\|', 2)
            [up[0], up[1]]
        }
        else
            [null, null]
    }

    /*********************** PGP methods ****************************/

    /***
     * Decrypted encrypted message in PGP format as AES 256 for message and RSA encrypted AES (session) key
     * The AES is openssl compatible format
     * @param data
     * @param sessionKey
     * @return decrypted message
     */
    public String decryptPGP(String data, String sessionKey) {
        // Decrypt session key by RSA private key
        String key = decryptRSA(sessionKey)

        // Decrypt data by deciphered session key
        decryptAESOpenSSL(data, key)
    }

    /***
     * Decrypt encrypted message in PGP format with prepended 13 chars of the UTC timestamp (e.g. UTC1444081234)
     * decrypted AES key contains key generation uC timestamp, and continue decryption of message if time difference
     * to now is less than expiryOffset parameter in second.
     * @param data
     * @param sessionKey RSA crypted
     * @param expiryOffset in second
     * @return
     */
    public String decryptPGP(String data, String sessionKey, int expiryOffset) {
        // Decrypt session key by RSA private key
        String key = decryptRSA(sessionKey)

        long keyTime = key[3..12] as long
        long now = System.currentTimeMillis()/1000
        if(now - keyTime > expiryOffset) {
            log.error("Expired session key observed")
            return null
        }
        // Decrypt data by deciphered session key
        decryptAESOpenSSL(data, key[13..-1])
    }

    /******************** RSA PUB/PRV methods ***********************/
    def encryptRSA(String msg) {
        Cipher encryptRSACipher = Cipher.getInstance("RSA/ECB/PKCS1Padding", "BC")
        encryptRSACipher.init(Cipher.ENCRYPT_MODE, rsaKP.public)
        encryptRSACipher.doFinal(msg.encodeAsBase64().getBytes(StandardCharsets.UTF_8)).encodeBase64()
    }

    String decryptRSA(String hash) {
        Cipher decryptRSACipher = Cipher.getInstance("RSA/ECB/PKCS1Padding", "BC")
        decryptRSACipher.init(Cipher.DECRYPT_MODE, rsaKP.private)
        new String(decryptRSACipher.doFinal(hash.decodeBase64()).decodeBase64(), StandardCharsets.UTF_8)
    }

    static String encryptRSA(String msg, String pem, String password) {
        KeyPair kp = getKeyPair(pem, password.toCharArray())

        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding")
        cipher.init(Cipher.ENCRYPT_MODE, kp.public)

        cipher.doFinal(msg.encodeAsBase64().getBytes(StandardCharsets.UTF_8)).encodeBase64()
    }

    String decryptRSA(String hash, String pem, String password) {
        KeyPair kp = getKeyPair(pem, password.toCharArray())

        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding")
        cipher.init(Cipher.DECRYPT_MODE, kp.private)

        new String(cipher.doFinal(hash.decodeBase64()).decodeBase64(), StandardCharsets.UTF_8)
    }

    static KeyPair getKeyPair(String pk, char [] password) {
        PEMParser pemParser = new PEMParser(new CharArrayReader(pk.toCharArray()))
        Object object = pemParser.readObject()

        PEMDecryptorProvider decProv = new JcePEMDecryptorProviderBuilder().build(password)
        JcaPEMKeyConverter converter = new JcaPEMKeyConverter().setProvider("BC")

        KeyPair kp
        if (object instanceof PEMEncryptedKeyPair) {
            kp = converter.getKeyPair(((PEMEncryptedKeyPair) object).decryptKeyPair(decProv))
        } else {
            kp = converter.getKeyPair((org.bouncycastle.openssl.PEMKeyPair) object)
        }
        kp
    }


    /********************* AES methods ***********************************/

    /***
     * Encrypt AES by default key
     * @param msg
     * @return base64 of encrypted byte[]
     */
    String encryptAES(String msg) {
        Cipher encAESCipher = Cipher.getInstance('AES/CBC/PKCS5Padding')
        encAESCipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(aesKeyBytes, 'AES'), new IvParameterSpec(new byte[16]))
        encAESCipher.doFinal(msg.getBytes(StandardCharsets.UTF_8)).encodeBase64()
    }

    String decryptAES(String hash) {
        Cipher decAESCipher = Cipher.getInstance('AES/CBC/PKCS5Padding')
        decAESCipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(aesKeyBytes, 'AES'), new IvParameterSpec(new byte[16]))
        new String(decAESCipher.doFinal(hash.decodeBase64()), StandardCharsets.UTF_8)
    }

    static String encryptAES(String msg, String key) {
        byte[] keyBytes = MessageDigest.getInstance( 'SHA-256' ).digest( key.bytes )[ 0..<16 ]
        Cipher cipher = Cipher.getInstance( 'AES/CBC/PKCS5Padding' )
        cipher.init( Cipher.ENCRYPT_MODE, new SecretKeySpec( keyBytes, 'AES' ), new IvParameterSpec( new byte[16] ) )
        cipher.doFinal(msg.getBytes(StandardCharsets.UTF_8))
    }

    static String decryptAES(byte [] data, String key) {
        byte[] keyBytes = MessageDigest.getInstance( 'SHA-256' ).digest( key.bytes )[ 0..<16 ]
        Cipher cipher = Cipher.getInstance( 'AES/CBC/PKCS5Padding' )
        cipher.init( Cipher.DECRYPT_MODE, new SecretKeySpec( keyBytes, 'AES' ), new IvParameterSpec( new byte[16] ) )
        new String(cipher.doFinal(data), StandardCharsets.UTF_8)
    }

    static String decryptAESOpenSSL(String msg, String password) {
        // openssl non-standard extension: salt embedded at start of encrypted file
        byte [] src = msg.decodeBase64()
        byte [] pwd = password.bytes
        byte[] salt = Arrays.copyOfRange(src, 8, 16) // 0..7 is "SALTED__" or timestamp, 8..15 is the salt

        try
        {
            // Encryption algorithm. Note that the "strength" (bitsize) is controlled by the key object that is used.
            // Note that PKCS5 padding and PKCS7 padding are identical.
            BlockCipherPadding padding = new PKCS7Padding()
            BufferedBlockCipher cipher = new PaddedBufferedBlockCipher(new CBCBlockCipher(new AESEngine()), padding)

            CipherParameters params = getCipherParameters(pwd, salt)
            cipher.reset()
            cipher.init(false, params)

            int buflen = cipher.getOutputSize(src.length - 16)
            byte[] workingBuffer = new byte[buflen]
            int len = cipher.processBytes(src, 16, src.length - 16, workingBuffer, 0)
            len += cipher.doFinal(workingBuffer, len)

            // Note that getOutputSize returns a number which includes space for "padding" bytes to be stored in.
            // However we don't want these padding bytes; the "len" variable contains the length of the *real* data
            // (which is always less than the return value of getOutputSize.
            byte[] bytesDec = new byte[len]
            System.arraycopy(workingBuffer, 0, bytesDec, 0, len)
            // Return by remove openssl A0 newline padding at the end of text
            return new String(bytesDec[0..(bytesDec.size()-2)] as byte[])
        }
        catch (InvalidCipherTextException e)
        {
            log.error("Error: Decryption failed", e)
            return null
        }
        catch (RuntimeException e)
        {
            log.error("Error: Decryption failed", e)
            return null
        }
    }

    private static CipherParameters getCipherParameters(byte[] pwd, byte[] salt)
    {
        // Use bouncycastle implementation of openssl non-standard (pwd,salt)->(key,iv) algorithm.
        // Note that if a "CBC" cipher is selected, then an IV is required as well as a key. When using a password,
        // Openssl
        // *derives* the IV from the (pwd,salt) pair at the same time as it derives the key.
        //
        // * PBE = Password Based Encryption
        // * CBC = Cipher Block Chaining (ie IV is needed)
        //
        // Note also that when the IV is derived from (pwd, salt) the salt **must** be different for each message; this is
        // the default for openssl - just make sure to NOT explicitly provide a salt, or encryption security is badly
        // affected.
        OpenSSLPBEParametersGenerator gen = new OpenSSLPBEParametersGenerator()
        gen.init(pwd, salt)
        CipherParameters cp = gen.generateDerivedParameters(KEY_LEN_BIT, AES_IV_BIT)
        return cp
    }
}
