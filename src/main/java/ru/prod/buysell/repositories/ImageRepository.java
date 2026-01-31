package ru.prod.buysell.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.prod.buysell.models.Image;

public interface ImageRepository extends JpaRepository<Image, Long> {
}
