package test.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;





@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/loginCompany", "/checkSession").permitAll() // Allow login page & session check
                .anyRequest().authenticated() // Require login for all other pages
            )
            .formLogin(form -> form
                .loginPage("/loginCompany") // Custom login page
                .defaultSuccessUrl("/dashboard", true) // Redirect to dashboard after login
                .permitAll()
            )
            .logout(logout -> logout
    .logoutRequestMatcher(new AntPathRequestMatcher("/logout", "POST"))
    .logoutSuccessUrl("/loginCompany")
    .invalidateHttpSession(true)
    .deleteCookies("JSESSIONID")
)

            .csrf(csrf -> csrf
                .ignoringRequestMatchers("/checkSession", "/logout") // Ignore CSRF for session check/logout
            );

        return http.build();
    }
}
