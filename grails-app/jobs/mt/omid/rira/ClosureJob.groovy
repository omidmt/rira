package mt.omid.rira

import groovy.util.logging.Slf4j


@Slf4j
class ClosureJob {
    static triggers = {
      //simple repeatInterval: 5000l // execute job once in 5 seconds
    }

    def execute(context) {
        try {
            context.mergedJobDataMap.runnableClosure()
        }
        catch(e) {
            log.error("Closure job has failed to finish execution: ${e.message}")
        }
    }
}
