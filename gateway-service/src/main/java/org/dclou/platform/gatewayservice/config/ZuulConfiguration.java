package org.dclou.platform.gatewayservice.config;

import org.dclou.platform.gatewayservice.filters.SimpleLoggingPreFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by max on 30.06.17.
 */
@Configuration
public class ZuulConfiguration {

    @Bean
    public SimpleLoggingPreFilter simplePreFilter() {
        return new SimpleLoggingPreFilter();
    }
}
