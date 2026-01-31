package ru.prod.buysell.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.prod.buysell.models.Image;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductResponse {
    private Long id;
    private String title;
    private String description;
    private int price;
    private String city;
    private String author;
    private Long previewImageId;
    private Long userId;
    private String userEmail;
    private String userName;
    private LocalDateTime dateOfCreated;
    private List<Image> images;
    private boolean isOwner;
}