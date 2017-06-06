package org.dclou.platform.authservice.mvc;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

/**
 * Created by msnikitin on 24.04.2017.
 */
@RestController
@RequestMapping("/api/user")
public class UserController {

    @RequestMapping("principal.json")
    public Principal user(Principal user) {
        return user;
    }
}
