BUYSELL – Маркетплейс на Java-стеке

BUYSELL – это полноценное веб-приложение, имитирующее реальный маркетплейс с полным циклом работы.
Проект построен по MVC-архитектуре с четким разделением слоев, обеспечивая регистрацию пользователей,
публикацию товаров с изображениями, поиск по каталогу, управление контентом и безопасное взаимодействие между пользователями.
Основные возможности

     Безопасная аутентификация и авторизация через Spring Security

     Публикация товаров с поддержкой загрузки изображений

     Поиск и фильтрация по каталогу товаров

     Управление пользователями и их объявлениями

     CSRF-защита и валидация данных

     Адаптивный интерфейс для мобильных устройств

Архитектура

Проект построен по Layered Architecture с четким разделением ответственности:

    Controller – обработка HTTP-запросов и возврат представлений

    Service – бизнес-логика приложения

    Repository – доступ к данным через Spring Data JPA

    Model – сущности предметной области

Технологический стек
Backend

    Язык: Java

    Фреймворк: Spring Boot 3+

    Безопасность: Spring Security (аутентификация, авторизация, CSRF-защита)

    Данные: Spring Data JPA, Hibernate

    База данных: PostgreSQL (используется bytea для хранения изображений)

    Валидация: Jakarta Bean Validation (Hibernate Validator)

    Маппинг: MapStruct (для преобразования DTO <-> Entity)

    Логирование: SLF4J с Lombok @Slf4j

    Сборка: Gradle

Frontend (Server-Side Rendering)

    Шаблонизатор: Thymeleaf

    Стили: Чистый CSS3 (CSS Grid, Flexbox, CSS Variables, анимации)

    Интерактивность: Нативный JavaScript (ES6+)

    Дизайн: Кастомная, адаптивная верстка (mobile-friendly)

Архитектура и инструменты

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
