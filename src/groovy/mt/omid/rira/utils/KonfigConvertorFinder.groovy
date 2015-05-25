package mt.omid.rira.utils

import groovy.util.logging.Slf4j
import org.springframework.beans.factory.config.BeanDefinition
import org.springframework.context.annotation.ClassPathScanningCandidateComponentProvider
import org.springframework.core.type.filter.RegexPatternTypeFilter

import java.util.regex.Pattern

/**
 * Created by Omid Mehdizadeh on 5/11/2015.
 */

@Slf4j
public class KonfigConvertorFinder
{
    final static String KONFIG_CLASS_PATTERN = ".*Konfig"
    final static String KONFIG_CONVERTER_METHOD_NAME = "convert"
    final static String KONFIG_REFRESH_CACHE_METHOD_NAME = "refreshCaches"
    final static String RIRA_KONFOG_CLASS_NAME = "mt.omid.rira.Konfig"

    def static findKonfigConvertorClass() {

        def beans = []

        ClassPathScanningCandidateComponentProvider scanner = new ClassPathScanningCandidateComponentProvider( false )

        scanner.addIncludeFilter( new RegexPatternTypeFilter( Pattern.compile( KONFIG_CLASS_PATTERN ) ) )

        for (BeanDefinition bd : scanner.findCandidateComponents( "" ) )
        {
            if( bd.beanClassName != RIRA_KONFOG_CLASS_NAME )
            {
                beans << bd.beanClassName
            }
        }

        return beans
    }
}