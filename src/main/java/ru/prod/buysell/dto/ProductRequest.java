package ru.prod.buysell.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class ProductRequest {

    @NotBlank(message = "Название товара обязательно")
    @Size(min = 3, max = 100, message = "Название должно быть от 3 до 100 символов")
    private String title;

    @Size(max = 1000, message = "Описание не должно превышать 1000 символов")
    private String description;

    @Min(value = 0, message = "Цена не может быть отрицательной")
    private int price;

    @Size(max = 50, message = "Название города не должно превышать 50 символов")
    private String city;

    @Size(max = 100, message = "Имя автора не должно превышать 100 символов")
    private String author;

    private MultipartFile file1;
    private MultipartFile file2;
    private MultipartFile file3;
}