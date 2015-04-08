package mt.omid.rira.ntfy

import org.jsmpp.InvalidResponseException
import org.jsmpp.PDUException
import org.jsmpp.bean.Alphabet
import org.jsmpp.bean.BindType
import org.jsmpp.bean.ESMClass
import org.jsmpp.bean.GeneralDataCoding
import org.jsmpp.bean.MessageClass
import org.jsmpp.bean.NumberingPlanIndicator
import org.jsmpp.bean.OptionalParameter
import org.jsmpp.bean.RegisteredDelivery
import org.jsmpp.bean.SMSCDeliveryReceipt
import org.jsmpp.bean.TypeOfNumber
import org.jsmpp.extra.NegativeResponseException
import org.jsmpp.extra.ResponseTimeoutException
import org.jsmpp.session.BindParameter
import org.jsmpp.session.SMPPSession
import org.jsmpp.util.AbsoluteTimeFormatter
import org.jsmpp.util.TimeFormatter

class SMSService {

    static transactional = false

    def grailsApplication

    private static TimeFormatter timeFormatter = new AbsoluteTimeFormatter()

    def sendSMS( recipient, text )
    {
        def gaConf = grailsApplication.mergedConfig.grails.plugin
        SMPPSession session = new SMPPSession()
        try {
            session.connectAndBind( gaConf.smscIP, gaConf.smppPort,
                  new BindParameter( BindType.BIND_TX, gaConf.sysId, gaConf.sysPass, gaConf.sysType, gaConf.typeOfNumber, gaConf.npIndicator, null))
        } catch (IOException e) {
            log.error( "Failed connect and bind to host", e )
        }

        try {
            String messageId = session.dataShortMessage( "",
                    TypeOfNumber.UNKNOWN,
                    NumberingPlanIndicator.UNKNOWN, "6655",
                    TypeOfNumber.UNKNOWN,
                    NumberingPlanIndicator.UNKNOWN, recipient,
                    new ESMClass(),
                    new RegisteredDelivery( SMSCDeliveryReceipt.DEFAULT ),
                    new GeneralDataCoding( Alphabet.ALPHA_DEFAULT, MessageClass.CLASS1, false ),
                    new OptionalParameter.COctetString( (short)0x0424, text ) )
            log.debug "Message submitted, message_id is $messageId"
        } catch (PDUException e) {
            // Invalid PDU parameter
            log.error("Invalid PDU parameter", e)
        } catch (ResponseTimeoutException e) {
            // Response timeout
            log.error("Response timeout", e)
        } catch (InvalidResponseException e) {
            // Invalid response
            log.error("Receive invalid respose", e)
        } catch (NegativeResponseException e) {
            // Receiving negative response (non-zero command_status)
            log.error("Receive negative response", e)
        } catch (IOException e) {
            log.error("IO error occur", e)
        }

        session.unbindAndClose()
    }
}
