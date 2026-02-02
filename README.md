BUYSELL – это полноценное веб-приложение на Java-стеке, построенное по MVC-архитектуре с четким разделением слоев (Controller, Service, Repository, Model). Проект имитирует реальный маркетплейс с полным циклом работы: регистрация пользователей, публикация товаров с изображениями, поиск по каталогу, управление контентом и безопасное взаимодействие между пользователями.

Полный стек технологий, использованных в проекте:
Backend:
    Язык: Java 
    Фреймворк: Spring Boot 3+
    Безопасность: Spring Security (аутентификация, авторизация, CSRF-защита)
    Данные: Spring Data JPA, Hibernate
    База данных: PostgreSQL (используется byte для хранения изображений)
    Валидация: Jakarta Bean Validation (Hibernate Validator)
    Маппинг: MapStruct (для преобразования DTO <-> Entity)
    Логирование: SLF4J с Lombok @Slf4j
    Сборка: Gradle
Frontend (Server-Side Rendering):
    Шаблонизатор: Thymeleaf
    Стили: Чистый CSS3 (CSS Grid, Flexbox, CSS Variables, анимации)
    Интерактивность: Нативный JavaScript (ES6+)
    Дизайн: Кастомная, адаптивная верстка (mobile-friendly)
Архитектура и инструменты:
    Архитектура: Layered Architecture (Controller-Service-Repository), MVC
    Паттерны: DTO (Data Transfer Object), Mapper, Dependency Injection
    Логирование: Структурированное логирование с указанием user context
    Обработка ошибок: Единый GlobalExceptionHandler
    Работа с файлами: Spring MultipartFile, валидация размера
![Image](images/main.png)
![Image](images/add.png)
![Image](images/admin.png)
![Image](images/product.png)
![Image](images/reg.png)
