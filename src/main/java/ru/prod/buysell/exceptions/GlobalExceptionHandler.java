package ru.prod.buysell.exceptions;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.persistence.EntityNotFoundException;
import jakarta.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(EntityNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ModelAndView handleEntityNotFoundException(EntityNotFoundException ex, HttpServletRequest request) {
        log.error("Entity not found: {} for request: {}", ex.getMessage(), request.getRequestURI());

        ModelAndView mav = new ModelAndView("error/404");
        mav.addObject("errorMessage", ex.getMessage());
        mav.addObject("path", request.getRequestURI());
        return mav;
    }

    @ExceptionHandler(AccessDeniedException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public ModelAndView handleAccessDeniedException(AccessDeniedException ex, HttpServletRequest request) {
        log.error("Access denied: {} for request: {}", ex.getMessage(), request.getRequestURI());

        ModelAndView mav = new ModelAndView("error/403");
        mav.addObject("errorMessage", "У вас нет прав для доступа к этой странице");
        mav.addObject("path", request.getRequestURI());
        return mav;
    }

    @ExceptionHandler(MaxUploadSizeExceededException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public String handleMaxUploadSizeExceededException(MaxUploadSizeExceededException ex,
                                                       RedirectAttributes redirectAttributes) {
        log.error("File upload size exceeded: {}", ex.getMessage());
        redirectAttributes.addFlashAttribute("errorMessage",
                "Размер файла превышает максимально допустимый размер (10MB)");
        return "redirect:/";
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ModelAndView handleValidationExceptions(MethodArgumentNotValidException ex) {
        Map<String, String> errors = new HashMap<>();
        ex.getBindingResult().getAllErrors().forEach((error) -> {
            String fieldName = ((FieldError) error).getField();
            String errorMessage = error.getDefaultMessage();
            errors.put(fieldName, errorMessage);
        });

        ModelAndView mav = new ModelAndView("error/400");
        mav.addObject("validationErrors", errors);
        return mav;
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ModelAndView handleGenericException(Exception ex, HttpServletRequest request) {
        log.error("Internal server error: {} for request: {}", ex.getMessage(), request.getRequestURI(), ex);

        ModelAndView mav = new ModelAndView("error/500");
        mav.addObject("errorMessage", "Произошла внутренняя ошибка сервера. Пожалуйста, попробуйте позже.");
        mav.addObject("path", request.getRequestURI());
        return mav;
    }
}