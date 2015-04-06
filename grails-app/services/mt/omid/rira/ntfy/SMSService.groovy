package mt.omid.rira.ntfy;

import grails.transaction.Transactional
import org.jsmpp.*
import org.jsmpp.bean.*
import org.jsmpp.extra.*
import org.jsmpp.session.*
import org.jsmpp.util.AbsoluteTimeFormatter
import org.jsmpp.util.TimeFormatter

@Transactional
class SMSService {

    def grailsApplication

    private static TimeFormatter timeFormatter = new AbsoluteTimeFormatter()

    def sendSMS( recipient, text )
    {
        def gaConf = grailsApplication.mergedConfig.grails.plugin;
        SMPPSession session = new SMPPSession();
        try {
            session.connectAndBind( gaConf.smscIP, gaConf.smppPort, new BindParameter( BindType.BIND_TX, gaConf.sysId, gaConf.sysPass, gaConf.sysType, gaConf.typeOfNumber, gaConf.npIndicator, null));
        } catch (IOException e) {
            log.error( "Failed connect and bind to host", e )
//            System.err.println("Failed connect and bind to host");
//            e.printStackTrace();
        }

        try {
//            String messageId = session.submitShortMessage( "", TypeOfNumber.UNKNOWN, NumberingPlanIndicator.UNKNOWN, "6655", TypeOfNumber.UNKNOWN, NumberingPlanIndicator.UNKNOWN, "09352203233", new ESMClass(), (byte)0, (byte)1,  timeFormatter.format(new Date()), null, new RegisteredDelivery(SMSCDeliveryReceipt.DEFAULT), (byte)0, new GeneralDataCoding(Alphabet.ALPHA_DEFAULT, MessageClass.CLASS1, false), (byte)0, "jSMPP simplify SMPP on Java platform".getBytes());
            String messageId = session.dataShortMessage( "",
                    TypeOfNumber.UNKNOWN,
                    NumberingPlanIndicator.UNKNOWN, "6655",
                    TypeOfNumber.UNKNOWN,
                    NumberingPlanIndicator.UNKNOWN, recipient,
                    new ESMClass(),
                    new RegisteredDelivery( SMSCDeliveryReceipt.DEFAULT ),
                    new GeneralDataCoding( Alphabet.ALPHA_DEFAULT, MessageClass.CLASS1, false ),
                    new OptionalParameter.COctetString( (short)0x0424, text ) );
            System.out.println("Message submitted, message_id is " + messageId);
        } catch (PDUException e) {
            // Invalid PDU parameter
            System.err.println("Invalid PDU parameter");
            e.printStackTrace();
        } catch (ResponseTimeoutException e) {
            // Response timeout
            System.err.println("Response timeout");
            e.printStackTrace();
        } catch (InvalidResponseException e) {
            // Invalid response
            System.err.println("Receive invalid respose");
            e.printStackTrace();
        } catch (NegativeResponseException e) {
            // Receiving negative response (non-zero command_status)
            System.err.println("Receive negative response");
            e.printStackTrace();
        } catch (IOException e) {
            System.err.println("IO error occur");
            e.printStackTrace();
        }

        session.unbindAndClose();
    }
}
