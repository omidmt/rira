package mt.omid.rira.ntfy

import groovy.util.logging.Slf4j
import org.jsmpp.InvalidResponseException
import org.jsmpp.PDUException
import org.jsmpp.bean.*
import org.jsmpp.extra.*
import org.jsmpp.session.*
import org.jsmpp.util.*

import static mt.omid.rira.Konfig.KONFIGS

@Slf4j
class SMSService {

    static transactional = false

    def grailsApplication

    private static TimeFormatter timeFormatter = new AbsoluteTimeFormatter()

    def sendSMS(String recipient, String text) {
        def gaConf = grailsApplication.mergedConfig.grails.plugin
        SMPPSession session = new SMPPSession()
        try {
            session.connectAndBind( KONFIGS.smppIP, KONFIGS.smppPort,
                    new BindParameter( BindType.BIND_TX, KONFIGS.smppSysId, KONFIGS.smppSysPass, KONFIGS.smppSysType, TypeOfNumber.NATIONAL, NumberingPlanIndicator.UNKNOWN, null))
        } catch (IOException e) {
            log.error( "Failed connect and bind to host", e )
        }

        try {
            String messageId = session.dataShortMessage( "",
                    TypeOfNumber.UNKNOWN,
                    NumberingPlanIndicator.UNKNOWN, KONFIGS.smppSourceAddress,
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

    def sendSMS(ArrayList<String> recipients, String text) {
        def gaConf = grailsApplication.mergedConfig.grails.plugin
        SMPPSession session = new SMPPSession()
        try {
            session.connectAndBind( KONFIGS.smppIP, KONFIGS.smppPort,
                    new BindParameter(BindType.BIND_TX, KONFIGS.smppSysId, KONFIGS.smppSysPass, KONFIGS.smppSysType,
                            TypeOfNumber.NATIONAL, NumberingPlanIndicator.UNKNOWN, null))
        } catch (IOException e) {
            log.error("Failed to connect and bind to host", e)
            throw new Exception("Failed to connect and bind to host")
        }

        recipients.each { recipient ->

            try {
                String messageId = session.dataShortMessage("",
                        TypeOfNumber.UNKNOWN,
                        NumberingPlanIndicator.UNKNOWN, KONFIGS.smppFromAddress,
                        TypeOfNumber.UNKNOWN,
                        NumberingPlanIndicator.UNKNOWN, recipient,
                        new ESMClass(),
                        new RegisteredDelivery(SMSCDeliveryReceipt.DEFAULT),
                        new GeneralDataCoding(Alphabet.ALPHA_DEFAULT, MessageClass.CLASS1, false),
                        new OptionalParameter.COctetString((short) 0x0424, text))
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
        }

        session.unbindAndClose()
    }
}
