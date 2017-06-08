package org.dclou.platform.authservice.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;

/**
 * Created by msnikitin on 24.04.2017.
 */
@Configuration
@EnableResourceServer
public class ResourceServerConfiguration extends ResourceServerConfigurerAdapter {

    @Override
    public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
        resources.resourceId("auth");
    }

    @Override
    public void configure(HttpSecurity http) throws Exception {
        // only secure channel, https, is allowed
        //http.requiresChannel().anyRequest().requiresSecure();

        http.antMatcher("/api/**").authorizeRequests().anyRequest().authenticated();
    }
}
