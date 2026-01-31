package ru.prod.buysell.controllers;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.prod.buysell.dto.ProductRequest;
import ru.prod.buysell.dto.ProductResponse;
import ru.prod.buysell.services.ProductService;

import java.io.IOException;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ProductController {

    private final ProductService productService;

    @GetMapping("/")
    public String products(@RequestParam(name = "title", required = false) String title, Model model) {
        model.addAttribute("products", productService.getProducts(title));
        model.addAttribute("searchTitle", title != null ? title : "");
        model.addAttribute("productRequest", new ProductRequest());
        return "products";
    }

    @PostMapping("/product/create")
    @PreAuthorize("isAuthenticated()")
    public String createProduct(@Valid @ModelAttribute ProductRequest productRequest,
                                BindingResult bindingResult,
                                RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            bindingResult.getAllErrors().forEach(error ->
                    log.warn("Validation error: {}", error.getDefaultMessage()));
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.productRequest",
                    bindingResult);
            redirectAttributes.addFlashAttribute("productRequest", productRequest);
            return "redirect:/";
        }

        try {
            productService.saveProduct(productRequest);
            redirectAttributes.addFlashAttribute("successMessage", "Товар успешно добавлен!");
        } catch (Exception e) {
            log.error("Error creating product", e);
            redirectAttributes.addFlashAttribute("errorMessage", "Ошибка при создании товара: "
                    + e.getMessage());
        }

        return "redirect:/";
    }

    @PostMapping("/product/delete/{id}")
    @PreAuthorize("isAuthenticated()")
    public String deleteProduct(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            productService.deleteProduct(id);
            redirectAttributes.addFlashAttribute("successMessage", "Товар успешно удален!");
        } catch (Exception e) {
            log.error("Error deleting product with id: {}", id, e);
            redirectAttributes.addFlashAttribute("errorMessage", "Ошибка при удалении товара: "
                    + e.getMessage());
        }

        return "redirect:/";
    }

    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable Long id, Model model) {
        try {
            ProductResponse product = productService.getProductById(id);
            model.addAttribute("product", product);
            model.addAttribute("images", product.getImages());
            model.addAttribute("isOwner", product.isOwner());
        } catch (Exception e) {
            log.error("Error getting product with id: {}", id, e);
            model.addAttribute("errorMessage", "Товар не найден");
        }

        return "product-info";
    }
}