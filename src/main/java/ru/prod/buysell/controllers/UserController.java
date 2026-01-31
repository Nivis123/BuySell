package ru.prod.buysell.controllers;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.prod.buysell.dto.UserRegistrationRequest;
import ru.prod.buysell.services.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserService userService;

    @GetMapping("/login")
    public String login(HttpServletRequest request, Model model,
                        @RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "logout", required = false) String logout) {

        CsrfToken csrfToken = (CsrfToken) request.getAttribute(CsrfToken.class.getName());
        if (csrfToken != null) {
            model.addAttribute("_csrf", csrfToken);
        }

        if (error != null) {
            model.addAttribute("errorMessage", "Неверный email или пароль");
        }

        if (logout != null) {
            model.addAttribute("successMessage", "Вы успешно вышли из системы");
        }

        return "login";
    }

    @GetMapping("/registration")
    public String registration(HttpServletRequest request, Model model) {
        CsrfToken csrfToken = (CsrfToken) request.getAttribute(CsrfToken.class.getName());
        if (csrfToken != null) {
            model.addAttribute("_csrf", csrfToken);
        }

        model.addAttribute("userRequest", new UserRegistrationRequest());
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(@Valid @ModelAttribute UserRegistrationRequest userRequest,
                             BindingResult bindingResult,
                             Model model,
                             RedirectAttributes redirectAttributes) {

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        try {
            userService.createUser(userRequest);
            redirectAttributes.addFlashAttribute("successMessage",
                    "Регистрация прошла успешно! Теперь вы можете войти в систему.");
            return "redirect:/login";
        } catch (Exception e) {
            log.error("Registration error", e);
            model.addAttribute("errorMessage", e.getMessage());
            return "registration";
        }
    }

    @GetMapping("/user/{id}")
    public String userInfo(@PathVariable Long id, Model model) {
        try {
            model.addAttribute("user", userService.getUserById(id));
            model.addAttribute("products", userService.getUserById(id).getProducts());
        } catch (Exception e) {
            log.error("Error getting user with id: {}", id, e);
            model.addAttribute("errorMessage", "Пользователь не найден");
            return "redirect:/";
        }

        return "user-info";
    }

    @GetMapping("/admin")
    @PreAuthorize("hasRole('ADMIN')")
    public String adminPanel(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "admin-panel";
    }

    @PostMapping("/user/delete/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public String deleteUser(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            userService.deleteUser(id);
            redirectAttributes.addFlashAttribute("successMessage",
                    "Пользователь успешно удален");
        } catch (Exception e) {
            log.error("Error deleting user with id: {}", id, e);
            redirectAttributes.addFlashAttribute("errorMessage",
                    "Ошибка при удалении пользователя: " + e.getMessage());
        }

        return "redirect:/admin";
    }
}