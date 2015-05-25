package mt.omid.rira

import grails.transaction.Transactional
import groovy.util.logging.Slf4j

@Slf4j
@Transactional
class EventService {

    def raiseEvent( String header, String desc, String sender, Event.Severity severity )
    {
        raiseEvent( header, desc, sender, new Date(), null , null, severity )
    }

    def raiseEvent( String header, String desc, String sender, Date datetime, String impact, String solution,  Event.Severity severity )
    {
        log.info "A $severity Event on $datetime: $header {$desc} from: $sender impact: $impact solution: $solution"
    }

    def clearEvent()
    {

    }

}
