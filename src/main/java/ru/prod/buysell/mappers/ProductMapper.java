package ru.prod.buysell.mappers;

import org.mapstruct.*;
import ru.prod.buysell.dto.ProductRequest;
import ru.prod.buysell.dto.ProductResponse;
import ru.prod.buysell.models.Product;
import ru.prod.buysell.models.User;

import java.util.List;
import java.util.stream.Collectors;

@Mapper(componentModel = "spring")
public abstract class ProductMapper {

    @Mapping(target = "author", source = "request.author")
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "images", ignore = true)
    @Mapping(target = "previewImageId", ignore = true)
    @Mapping(target = "user", ignore = true)
    @Mapping(target = "dateOfCreated", ignore = true)
    public abstract Product toEntity(ProductRequest request);

    public ProductResponse toResponse(Product product) {
        if (product == null) {
            return null;
        }

        String userName = "Неизвестный продавец";
        String userEmail = null;
        Long userId = null;

        User user = product.getUser();
        if (user != null) {
            userId = user.getId();
            userEmail = user.getEmail();
            userName = (user.getName() != null && !user.getName().isEmpty())
                    ? user.getName()
                    : user.getEmail();
        }

        return ProductResponse.builder()
                .id(product.getId())
                .title(product.getTitle() != null ? product.getTitle() : "Без названия")
                .description(product.getDescription())
                .price(product.getPrice())
                .city(product.getCity() != null ? product.getCity() : "Не указан")
                .author(product.getAuthor() != null ? product.getAuthor() : "Не указан")
                .previewImageId(product.getPreviewImageId())
                .userId(userId)
                .userEmail(userEmail)
                .userName(userName)
                .dateOfCreated(product.getDateOfCreated())
                .images(product.getImages())
                .isOwner(false)
                .build();
    }

    public List<ProductResponse> toResponseList(List<Product> products) {
        if (products == null) {
            return null;
        }

        return products.stream()
                .map(this::toResponse)
                .collect(Collectors.toList());
    }
}