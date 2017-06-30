package org.dclou.platform.authservice.config;

import com.github.mkopylec.recaptcha.security.login.FormLoginConfigurerEnhancer;
import org.dclou.platform.authservice.OAuth2UserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

/**
 * Created by msnikitin on 24.04.2017.
 */
@Configuration
@EnableWebSecurity
@Order(SecurityProperties.ACCESS_OVERRIDE_ORDER)
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private OAuth2UserDetailsService userDetailsService;

    @Autowired
    private FormLoginConfigurerEnhancer enhancer;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        AuthenticationEntryPoint authenticationEntryPoint = new LoginUrlAuthenticationEntryPoint("/login.html");

        enhancer.addRecaptchaSupport(http.formLogin()).loginPage("/login.html")
                .usernameParameter("username").passwordParameter("password")

        // @formatter:off
        //http
        .and()
            .exceptionHandling()
            .accessDeniedPage("/login.html")
            .authenticationEntryPoint(authenticationEntryPoint)
        .and()
            .csrf().disable()
            .rememberMe().disable()
            //.formLogin().loginPage("/login.html").usernameParameter("username").passwordParameter("password")
        //.and()
            .logout().logoutSuccessUrl("/login.html").invalidateHttpSession(true).permitAll()
        .and()
            .antMatcher("/**")
                .authorizeRequests()
            .antMatchers("/", "/login**", "/logout**", "/oauth/token", "/oauth/check_token", "/manage/**")
                .permitAll()
            .anyRequest()
                .authenticated();
        // @formatter:on
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**");
    }
}
