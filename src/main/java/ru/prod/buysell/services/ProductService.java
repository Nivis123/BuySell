package ru.prod.buysell.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import ru.prod.buysell.dto.ProductRequest;
import ru.prod.buysell.dto.ProductResponse;
import ru.prod.buysell.exceptions.BusinessException;
import ru.prod.buysell.mappers.ProductMapper;
import ru.prod.buysell.models.Image;
import ru.prod.buysell.models.Product;
import ru.prod.buysell.models.User;
import ru.prod.buysell.repositories.ProductRepository;
import ru.prod.buysell.repositories.UserRepository;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {

    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final ProductMapper productMapper;
    private static final long MAX_FILE_SIZE = 10 * 1024 * 1024;

    public List<ProductResponse> getProducts(String title) {
        List<Product> products;
        if (title != null && !title.trim().isEmpty()) {
            log.info("Searching products by title: {}", title);
            products = productRepository.findByTitleContainingIgnoreCase(title.trim());
        } else {
            log.info("Loading all products");
            products = productRepository.findAll();
        }

        log.info("Found {} products", products.size());

        for (Product product : products) {
            log.debug("Product ID: {}, Title: {}, User: {}",
                    product.getId(),
                    product.getTitle(),
                    product.getUser() != null ? product.getUser().getEmail() : "null");
        }

        return productMapper.toResponseList(products);
    }

    @Transactional
    public ProductResponse saveProduct(ProductRequest productRequest) throws IOException {
        log.info("Saving product. Title: {}, Price: {}",
                productRequest.getTitle(),
                productRequest.getPrice());

        validateFiles(productRequest);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentUsername = authentication.getName();
        User currentUser = userRepository.findByEmail(currentUsername);

        if (currentUser == null) {
            log.error("Current user not found: {}", currentUsername);
            throw new BusinessException("Пользователь не найден");
        }

        log.info("Found user: {} (ID: {})", currentUser.getEmail(), currentUser.getId());

        Product product = productMapper.toEntity(productRequest);
        product.setUser(currentUser);

        addImagesToProduct(product, productRequest);

        log.info("Saving product with user: {}", currentUser.getId());

        Product savedProduct = productRepository.save(product);
        log.info("Product saved with ID: {}", savedProduct.getId());

        setPreviewImage(savedProduct);
        log.info("Product saved with ID: {}, User ID: {}", savedProduct.getId(), currentUser.getId());

        return productMapper.toResponse(savedProduct);
    }

    private void validateFiles(ProductRequest request) {
        validateFileSize(request.getFile1());
        validateFileSize(request.getFile2());
        validateFileSize(request.getFile3());
    }

    private void validateFileSize(MultipartFile file) {
        if (file != null && !file.isEmpty() && file.getSize() > MAX_FILE_SIZE) {
            throw new BusinessException(
                    String.format("Файл %s превышает максимальный размер %dMB",
                            file.getOriginalFilename(), MAX_FILE_SIZE / (1024 * 1024))
            );
        }
    }

    private void addImagesToProduct(Product product, ProductRequest request) throws IOException {
        if (request.getFile1() != null && !request.getFile1().isEmpty()) {
            Image image = toImageEntity(request.getFile1());
            image.setPreviewImage(true);
            product.addImageToProduct(image);
        }

        if (request.getFile2() != null && !request.getFile2().isEmpty()) {
            Image image = toImageEntity(request.getFile2());
            product.addImageToProduct(image);
        }

        if (request.getFile3() != null && !request.getFile3().isEmpty()) {
            Image image = toImageEntity(request.getFile3());
            product.addImageToProduct(image);
        }
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) {
            throw new BusinessException("Файл не может быть пустым");
        }

        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    private void setPreviewImage(Product product) {
        if (product.getImages() != null && !product.getImages().isEmpty()) {
            Image previewImage = product.getImages().stream()
                    .filter(Image::isPreviewImage)
                    .findFirst()
                    .orElse(product.getImages().get(0));

            product.setPreviewImageId(previewImage.getId());
            productRepository.save(product);
        }
    }

    @Transactional
    public boolean deleteProduct(Long id) {
        User currentUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        Product product = productRepository.findById(id).orElse(null);
        if (product != null && product.getUser() != null &&
                product.getUser().getId().equals(currentUser.getId())) {

            productRepository.deleteById(id);
            log.info("Product with id {} deleted by user {}", id, currentUser.getEmail());
            return true;
        }

        log.warn("User {} attempted to delete product {} without permission",
                currentUser.getEmail(), id);
        return false;
    }

    public ProductResponse getProductById(Long id) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new BusinessException("Товар с ID " + id + " не найден"));

        ProductResponse response = productMapper.toResponse(product);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            response.setOwner(product.getUser().getEmail().equals(authentication.getName()));
        }

        return response;
    }

    public List<ProductResponse> getProductsByUser(Long userId) {
        List<Product> products = productRepository.findAll()
                .stream()
                .filter(p -> p.getUser() != null && p.getUser().getId().equals(userId))
                .collect(Collectors.toList());
        return productMapper.toResponseList(products);
    }
}