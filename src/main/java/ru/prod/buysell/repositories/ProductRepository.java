package ru.prod.buysell.repositories;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import ru.prod.buysell.models.Product;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {

    @Query("SELECT p FROM Product p WHERE LOWER(p.title) LIKE LOWER(CONCAT('%', :title, '%'))")
    List<Product> searchByTitle(@Param("title") String title);

    List<Product> findByTitle(String title);

    @EntityGraph(attributePaths = {"user"})
    List<Product> findAll();

    @EntityGraph(attributePaths = {"user"})
    List<Product> findByTitleContainingIgnoreCase(String title);

    @Query("SELECT p FROM Product p LEFT JOIN FETCH p.images WHERE p.id = :id")
    Optional<Product> findByIdWithImages(@Param("id") Long id);

    @Modifying
    @Transactional
    @Query(value = "DELETE FROM products WHERE id = :id", nativeQuery = true)
    void hardDeleteById(@Param("id") Long id);
}