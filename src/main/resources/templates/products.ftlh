<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BUYSELL - Главная | Купить и продать товары по всей России</title>
    <style>
        :root {
            --primary: #4a6fa5;
            --secondary: #ff7e5f;
            --accent: #3a86ff;
            --success: #38b000;
            --danger: #e63946;
            --light: #f8f9fa;
            --dark: #212529;
            --gray: #6c757d;
            --light-gray: #e9ecef;
            --gradient: linear-gradient(135deg, var(--primary), var(--accent));
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            --shadow-hover: 0 8px 20px rgba(0, 0, 0, 0.15);
            --radius: 12px;
            --radius-sm: 8px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            color: var(--dark);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Шапка */
        .header {
            background: white;
            box-shadow: var(--shadow);
            padding: 15px 0;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
            color: var(--dark);
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            background: var(--gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 20px;
        }

        .logo-text {
            font-size: 28px;
            font-weight: 800;
            background: var(--gradient);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            letter-spacing: -0.5px;
        }

        .user-menu {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .user-greeting {
            color: var(--primary);
            font-weight: 600;
            padding: 8px 16px;
            background: rgba(74, 111, 165, 0.1);
            border-radius: var(--radius-sm);
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: var(--radius-sm);
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            font-size: 14px;
        }

        .btn-primary {
            background: var(--gradient);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-hover);
        }

        .btn-outline {
            background: transparent;
            border: 2px solid var(--primary);
            color: var(--primary);
        }

        .btn-outline:hover {
            background: var(--primary);
            color: white;
        }

        .btn-danger {
            background: var(--danger);
            color: white;
        }

        .btn-danger:hover {
            background: #d32f2f;
        }

        .btn-admin {
            background: linear-gradient(135deg, #6c757d, #495057);
            color: white;
            border: none;
        }

        .btn-admin:hover {
            background: linear-gradient(135deg, #5a6268, #343a40);
            transform: translateY(-2px);
            box-shadow: var(--shadow-hover);
        }

        /* Поиск */
        .search-section {
            background: white;
            padding: 30px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            margin: 30px 0;
        }

        .section-title {
            color: var(--primary);
            margin-bottom: 20px;
            font-size: 24px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section-title::before {
            content: "🔍";
            font-size: 20px;
        }

        .search-form {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .search-input {
            flex: 1;
            min-width: 300px;
            padding: 14px 20px;
            border: 2px solid var(--light-gray);
            border-radius: var(--radius-sm);
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .search-input:focus {
            outline: none;
            border-color: var(--primary);
        }

        /* Сообщения */
        .alert {
            padding: 16px 20px;
            border-radius: var(--radius-sm);
            margin: 20px 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .alert-success {
            background: rgba(56, 176, 0, 0.1);
            border-left: 4px solid var(--success);
            color: #2e7d32;
        }

        .alert-error {
            background: rgba(230, 57, 70, 0.1);
            border-left: 4px solid var(--danger);
            color: #c62828;
        }

        /* Товары */
        .products-section {
            margin: 30px 0;
        }

        .products-section .section-title::before {
            content: "📦";
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
            margin-top: 20px;
        }

        .product-card {
            background: white;
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-hover);
        }

        .product-badge {
            position: absolute;
            top: 15px;
            left: 15px;
            background: var(--secondary);
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            z-index: 1;
        }

        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            background: linear-gradient(45deg, #f0f0f0, #e0e0e0);
        }

        .product-content {
            padding: 20px;
        }

        .product-title {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 10px;
            color: var(--dark);
            line-height: 1.4;
        }

        .product-price {
            color: var(--secondary);
            font-size: 22px;
            font-weight: 800;
            margin: 10px 0;
        }

        .product-details {
            color: var(--gray);
            font-size: 14px;
            margin: 8px 0;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .product-details::before {
            content: "📍";
        }

        .product-seller {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 15px;
            padding-top: 15px;
            border-top: 1px solid var(--light-gray);
        }

        .seller-avatar {
            width: 32px;
            height: 32px;
            background: var(--gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }

        .seller-name {
            font-weight: 600;
            color: var(--primary);
        }

        .product-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            padding: 10px;
            background: var(--light-gray);
            color: var(--primary);
            text-decoration: none;
            border-radius: var(--radius-sm);
            font-weight: 600;
            transition: background 0.3s;
        }

        .product-link:hover {
            background: var(--primary);
            color: white;
        }

        /* Форма создания товара */
        .create-section {
            background: white;
            padding: 30px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            margin: 30px 0;
        }

        .create-section .section-title::before {
            content: "✨";
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--primary);
        }

        .form-input,
        .form-textarea,
        .form-file {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid var(--light-gray);
            border-radius: var(--radius-sm);
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-input:focus,
        .form-textarea:focus {
            outline: none;
            border-color: var(--primary);
        }

        .form-textarea {
            min-height: 100px;
            resize: vertical;
        }

        .file-group {
            border: 2px dashed var(--light-gray);
            padding: 20px;
            border-radius: var(--radius-sm);
            text-align: center;
            transition: border-color 0.3s;
        }

        .file-group:hover {
            border-color: var(--primary);
        }

        .file-label {
            display: block;
            color: var(--gray);
            margin-bottom: 10px;
            cursor: pointer;
        }

        .form-submit {
            grid-column: 1 / -1;
            background: var(--gradient);
            color: white;
            padding: 15px 40px;
            border: none;
            border-radius: var(--radius-sm);
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
            display: block;
            margin: 0 auto;
        }

        .form-submit:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-hover);
        }

        /* Футер */
        .footer {
            background: var(--dark);
            color: white;
            padding: 40px 0;
            margin-top: 50px;
            text-align: center;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .footer-logo {
            font-size: 24px;
            font-weight: 800;
            background: var(--gradient);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .footer-text {
            color: #adb5bd;
        }

        .current-time {
            background: white;
            padding: 10px 20px;
            border-radius: var(--radius-sm);
            color: var(--primary);
            font-weight: 600;
            box-shadow: var(--shadow);
            display: inline-block;
            margin-top: 20px;
        }

        /* Адаптивность */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 15px;
            }

            .user-menu {
                flex-direction: column;
                width: 100%;
            }

            .search-form {
                flex-direction: column;
            }

            .search-input {
                min-width: 100%;
            }

            .products-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            }

            .footer-content {
                flex-direction: column;
                text-align: center;
            }
        }

        /* Анимации */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .fade-in {
            animation: fadeIn 0.5s ease-out;
        }

        /* Улучшения для скроллбара */
        ::-webkit-scrollbar {
            width: 10px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        ::-webkit-scrollbar-thumb {
            background: var(--primary);
            border-radius: 5px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #3a5a8a;
        }
    </style>
</head>
<body>
<!-- Шапка -->
<header class="header">
    <div class="container">
        <div class="header-content">
            <a href="/" class="logo">
                <div class="logo-icon">BS</div>
                <div class="logo-text">BUYSELL</div>
            </a>

            <div class="user-menu">
                <#if isAuthenticated>
                    <div class="user-greeting">👋 Привет, ${currentUsername!""}!</div>
                    <#if isAdmin>
                        <a href="/admin" class="btn btn-admin">Админ-панель</a>
                    </#if>
                    <form action="/logout" method="post" style="display:inline;">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-danger">Выйти</button>
                    </form>
                <#else>
                    <a href="/login" class="btn btn-outline">Войти</a>
                    <a href="/registration" class="btn btn-primary">Регистрация</a>
                </#if>
            </div>
        </div>
    </div>
</header>

<main class="container">
    <!-- Панель поиска -->
    <section class="search-section fade-in">
        <h2 class="section-title">Поиск товаров</h2>
        <form action="/" method="get" class="search-form">
            <input type="text"
                   name="title"
                   placeholder="🔍 Введите название товара, например: iPhone, диван, велосипед..."
                   value="${searchTitle!''}"
                   class="search-input">
            <button type="submit" class="btn btn-primary">Найти</button>
            <#if searchTitle?? && searchTitle != "">
                <a href="/" class="btn btn-outline">Сбросить поиск</a>
            </#if>
        </form>
    </section>
    <!-- Секция товаров -->
    <section class="products-section fade-in">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
            <h2 class="section-title">Товары со всей России</h2>
            <div style="color: var(--gray); font-size: 14px;">
                Найдено товаров: ${products?size}
            </div>
        </div>

        <#if products?size == 0>
            <div style="text-align: center; padding: 40px; background: white; border-radius: var(--radius);">
                <div style="font-size: 80px; margin-bottom: 20px;">😕</div>
                <h3 style="color: var(--gray); margin-bottom: 10px;">Товары не найдены</h3>
                <p style="color: var(--gray);">Попробуйте изменить поисковый запрос или создать новый товар</p>
            </div>
        <#else>
            <div class="products-grid">
                <#list products as product>
                    <div class="product-card">
                        <#if product.previewImageId??>
                            <img src="/images/${product.previewImageId}"
                                 class="product-image"
                                 alt="${product.title!'Без названия'}">
                        <#else>
                            <div class="product-image"></div>
                        </#if>

                        <div class="product-content">
                            <h3 class="product-title">${product.title!'Без названия'}</h3>

                            <div class="product-price">${product.price} ₽</div>

                            <div class="product-details">
                                ${product.city!'Не указан'}
                            </div>

                            <div class="product-details" style="color: var(--gray);">
                                📝 ${(product.author)!"Не указан"}
                            </div>

                            <div class="product-seller">
                                <div class="seller-avatar">
                                    <#if product.userId??>
                                        ${(product.userName!product.userEmail)?substring(0,1)?upper_case}
                                    <#else>
                                        ?
                                    </#if>
                                </div>
                                <div class="seller-name">
                                    <#if product.userId??>
                                        <#if product.userName?? && product.userName != ''>
                                            ${product.userName}
                                        <#elseif product.userEmail??>
                                            ${product.userEmail}
                                        <#else>
                                            Неизвестный продавец
                                        </#if>
                                    <#else>
                                        Неизвестный продавец
                                    </#if>
                                </div>
                            </div>

                            <a href="/product/${product.id}" class="product-link">
                                Подробнее →
                            </a>
                        </div>
                    </div>
                </#list>
            </div>
        </#if>
    </section>

    <!-- Форма создания товара -->
    <#if isAuthenticated>
        <section class="create-section fade-in">
            <h2 class="section-title">Создать новый товар</h2>
            <p style="color: var(--gray); margin-bottom: 20px;">Заполните форму ниже, чтобы добавить ваш товар на BUYSELL</p>

            <form action="/product/create" method="post" enctype="multipart/form-data">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                <div class="form-grid">
                    <div class="form-group">
                        <label class="form-label">Название товара *</label>
                        <input type="text" name="title" required class="form-input" placeholder="Например: iPhone 15 Pro">
                    </div>

                    <div class="form-group">
                        <label class="form-label">Цена *</label>
                        <input type="number" name="price" required min="0" class="form-input" placeholder="В рублях">
                    </div>

                    <div class="form-group">
                        <label class="form-label">Город</label>
                        <input type="text" name="city" class="form-input" placeholder="Город продажи">
                    </div>

                    <div class="form-group">
                        <label class="form-label">Автор (ваше имя)</label>
                        <input type="text" name="author" class="form-input" placeholder="Ваше имя">
                    </div>

                    <div class="form-group" style="grid-column: span 2;">
                        <label class="form-label">Описание товара</label>
                        <textarea name="description" rows="4" class="form-textarea" placeholder="Опишите ваш товар подробно..."></textarea>
                    </div>

                    <div class="form-group">
                        <div class="file-group">
                            <label class="form-label">📸 Главное изображение *</label>
                            <input type="file" name="file1" accept="image/*" class="form-file">
                            <div style="font-size: 12px; color: var(--gray); margin-top: 10px;">Первое изображение будет главным</div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="file-group">
                            <label class="form-label">📷 Дополнительное изображение</label>
                            <input type="file" name="file2" accept="image/*" class="form-file">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="file-group">
                            <label class="form-label">📷 Еще одно изображение</label>
                            <input type="file" name="file3" accept="image/*" class="form-file">
                        </div>
                    </div>

                    <button type="submit" class="form-submit">
                        🚀 Добавить товар на BUYSELL
                    </button>
                </div>
            </form>
        </section>
    <#else>
        <section class="create-section fade-in" style="text-align: center; padding: 50px 30px;">
            <div style="font-size: 80px; margin-bottom: 20px;">🔒</div>
            <h2 style="color: var(--primary); margin-bottom: 15px;">Хотите продавать на BUYSELL?</h2>
            <p style="color: var(--gray); margin-bottom: 30px; max-width: 600px; margin-left: auto; margin-right: auto;">
                Присоединяйтесь к нашему сообществу! Зарегистрируйтесь или войдите, чтобы начать продавать свои товары.
            </p>
            <div style="display: flex; gap: 15px; justify-content: center; flex-wrap: wrap;">
                <a href="/login" class="btn btn-primary" style="padding: 12px 30px;">Войти в аккаунт</a>
                <a href="/registration" class="btn btn-outline" style="padding: 12px 30px;">Создать аккаунт</a>
            </div>
        </section>
    </#if>
</main>

<!-- Футер -->
<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div>
                <div class="footer-logo">BUYSELL</div>
                <p class="footer-text">Лучшая площадка для покупок и продаж в России</p>
            </div>
            <div>
                <p class="footer-text">© 2024 BUYSELL. Все права защищены.</p>
                <p class="footer-text">С нами выгодно покупать и продавать!</p>
            </div>
        </div>

        <div class="current-time fade-in">
            🕐 Текущее время: ${.now?string('dd.MM.yyyy HH:mm:ss')}
        </div>
    </div>
</footer>

<script>
    // Простые анимации при загрузке
    document.addEventListener('DOMContentLoaded', function() {
        // Анимация карточек товаров
        const cards = document.querySelectorAll('.product-card');
        cards.forEach((card, index) => {
            card.style.animationDelay = (index * 0.1) + 's';
        });

        // Подсветка формы при фокусе
        const inputs = document.querySelectorAll('.form-input, .form-textarea');
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'translateY(-2px)';
            });

            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'translateY(0)';
            });
        });
    });
</script>
</body>
</html>