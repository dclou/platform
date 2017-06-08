package org.dclou.platform.authservice;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;

/**
 * Created by msnikitin on 24.04.2017.
 */
@Service
public class OAuth2UserDetailsService implements UserDetailsService {

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add((GrantedAuthority) () -> "FOO_READ");

        switch (username) {
            case "user1":
                return createUserDetails("user1", "password", authorities);
            case "user2":
                authorities.add((GrantedAuthority) () -> "FOO_WRITE");
                return createUserDetails("user2", "password", authorities);
        }

        throw new UsernameNotFoundException("get out!");
    }

    private UserDetails createUserDetails(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        return new UserDetails() {
            @Override
            public Collection<? extends GrantedAuthority> getAuthorities() {
                return authorities;
            }

            @Override
            public String getPassword() {
                return password;
            }

            @Override
            public String getUsername() {
                return username;
            }

            @Override
            public boolean isAccountNonExpired() {
                return true;
            }

            @Override
            public boolean isAccountNonLocked() {
                return true;
            }

            @Override
            public boolean isCredentialsNonExpired() {
                return true;
            }

            @Override
            public boolean isEnabled() {
                return true;
            }
        };
    }
}
