package org.dclou.platform.authservice.config;

import com.github.mkopylec.recaptcha.RecaptchaProperties;
import com.github.mkopylec.recaptcha.security.login.InMemoryLoginFailuresManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Created by max on 27.06.17.
 */
@Component
@EnableConfigurationProperties(RecaptchaProperties.class)
public class CustomLoginFailuresManager extends InMemoryLoginFailuresManager {

    @Autowired
    public CustomLoginFailuresManager(RecaptchaProperties recaptcha) {
        super(recaptcha);
        setUsernameParameter("username");
    }
}
