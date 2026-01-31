package ru.prod.buysell.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.prod.buysell.dto.UserRegistrationRequest;
import ru.prod.buysell.exceptions.BusinessException;
import ru.prod.buysell.mappers.UserMapper;
import ru.prod.buysell.enums.Role;
import ru.prod.buysell.models.User;
import ru.prod.buysell.repositories.UserRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final UserMapper userMapper;

    @Transactional
    public void createUser(UserRegistrationRequest request) {
        if (userRepository.findByEmail(request.getEmail()) != null) {
            throw new BusinessException("Пользователь с email " + request.getEmail() + " уже существует");
        }

        User user = userMapper.toEntity(request);
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.getRoles().add(Role.ROLE_USER);

        userRepository.save(user);
        log.info("User created successfully. Email: {}", request.getEmail());
    }

    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new BusinessException("Пользователь с ID " + id + " не найден"));
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Transactional
    public void deleteUser(Long id) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentUsername = authentication.getName();
        User currentUser = userRepository.findByEmail(currentUsername);

        User userToDelete = userRepository.findById(id)
                .orElseThrow(() -> new BusinessException("Пользователь с ID " + id + " не найден"));

        if (userToDelete.getRoles().contains(Role.ROLE_ADMIN) &&
                !userToDelete.getEmail().equals(currentUsername)) {
            throw new AccessDeniedException("Нельзя удалить администратора");
        }

        if (!currentUser.getRoles().contains(Role.ROLE_ADMIN) &&
                !userToDelete.getEmail().equals(currentUsername)) {
            throw new AccessDeniedException("У вас нет прав на удаление этого пользователя");
        }

        userRepository.deleteById(id);
        log.info("User deleted. ID: {}; Deleted by: {}", id, currentUsername);
    }

    @Transactional
    public void updateUser(Long id, UserRegistrationRequest request) {
        User user = getUserById(id);

        if (!user.getEmail().equals(request.getEmail()) &&
                userRepository.findByEmail(request.getEmail()) != null) {
            throw new BusinessException("Пользователь с email " + request.getEmail() + " уже существует");
        }

        user.setEmail(request.getEmail());
        user.setName(request.getName());
        user.setPhoneNumber(request.getPhoneNumber());

        if (request.getPassword() != null && !request.getPassword().isEmpty()) {
            user.setPassword(passwordEncoder.encode(request.getPassword()));
        }

        userRepository.save(user);
        log.info("User updated. ID: {}", id);
    }

    public List<User> searchUsers(String searchTerm) {
        return userRepository.findAll().stream()
                .filter(user -> user.getEmail().contains(searchTerm) ||
                        (user.getName() != null && user.getName().contains(searchTerm)))
                .collect(Collectors.toList());
    }
}