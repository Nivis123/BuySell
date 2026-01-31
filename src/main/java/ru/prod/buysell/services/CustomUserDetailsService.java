package ru.prod.buysell.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.prod.buysell.exceptions.BusinessException;
import ru.prod.buysell.models.User;
import ru.prod.buysell.repositories.UserRepository;

@Service
@RequiredArgsConstructor
@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(email);
        if (user == null) {
            log.warn("User not found with email: {}", email);
            throw new UsernameNotFoundException("Пользователь с email " + email + " не найден");
        }

        if (!user.isEnabled()) {
            log.warn("User account is disabled: {}", email);
            throw new BusinessException("Аккаунт пользователя заблокирован");
        }

        log.debug("User loaded successfully: {}", email);
        return user;
    }
}