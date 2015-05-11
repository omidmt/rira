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
    final static String KONFIG_CLASS_PATTERN = ".*KonfigConverter"
    final static String KONFIG_CONVERTOR_METHOD_NAME = "convert"

    def static findKonfigConvertorClass() {

        def beans = []

        ClassPathScanningCandidateComponentProvider scanner = new ClassPathScanningCandidateComponentProvider( false )

        scanner.addIncludeFilter( new RegexPatternTypeFilter( Pattern.compile( KONFIG_CLASS_PATTERN ) ) )

        for (BeanDefinition bd : scanner.findCandidateComponents( "" ) )
        {
            beans << bd.getBeanClassName()
        }

        return beans
    }
}