<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BUYSELL - ${user.name}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h1 {
            color: #333;
            border-bottom: 2px solid #4a6fa5;
            padding-bottom: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .user-header {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 30px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
        }

        .avatar-placeholder {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #4a6fa5, #3a86ff);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 40px;
            font-weight: bold;
        }

        .user-info {
            flex: 1;
        }

        .user-name {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .user-detail {
            margin: 8px 0;
            color: #555;
        }

        .detail-label {
            font-weight: bold;
            color: #333;
            margin-right: 10px;
        }

        .products-section {
            margin-top: 30px;
        }

        .section-title {
            color: #4a6fa5;
            font-size: 20px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .product-card {
            background: white;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            background-color: #f0f0f0;
        }

        .product-content {
            padding: 15px;
        }

        .product-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        .product-price {
            color: #e63946;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .product-details {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .product-link {
            display: inline-block;
            background-color: #4a6fa5;
            color: white;
            padding: 8px 15px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
            margin-top: 10px;
        }

        .product-link:hover {
            background-color: #3a5a8a;
        }

        .no-products {
            text-align: center;
            padding: 40px;
            color: #666;
        }

        .actions {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            display: flex;
            gap: 15px;
        }

        .action-btn {
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .back-btn {
            background-color: #4a6fa5;
            color: white;
        }

        .admin-btn {
            background-color: #6c757d;
            color: white;
        }

        .login-info {
            background-color: #e9f7fe;
            padding: 15px;
            border-radius: 6px;
            margin-top: 20px;
            border-left: 4px solid #4a6fa5;
        }

        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            border-left: 4px solid #f5c6cb;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>
        BUYSELL
        <span style="font-size: 16px; font-weight: normal;">
                <#if isAuthenticated>
                    Привет, ${currentUsername!""}!
                <#else>
                    <a href="/login">Войти</a> | <a href="/registration">Регистрация</a>
                </#if>
            </span>
    </h1>

    <#if errorMessage??>
        <div class="alert-error">
            ${errorMessage}
        </div>
    </#if>

    <#if user??>
        <div class="user-header">
            <div class="avatar-placeholder">
                ${user.name?substring(0,1)?upper_case}
            </div>
            <div class="user-info">
                <div class="user-name">${user.name!user.email}</div>
                <div class="user-detail">
                    <span class="detail-label">Email:</span> ${user.email}
                </div>
                <div class="user-detail">
                    <span class="detail-label">Номер телефона:</span>
                    ${user.phoneNumber!"Не указан"}
                </div>
                <div class="user-detail">
                    <span class="detail-label">Дата регистрации:</span>
                    <#if user.dateofCreated??>
                        <#if user.dateofCreated?is_date>
                            ${user.dateofCreated?string("dd.MM.yyyy HH:mm")}
                        <#elseif user.dateofCreated?is_string>
                            ${user.dateofCreated}
                        <#else>
                            Неизвестный формат даты
                        </#if>
                    <#else>
                        Не указана
                    </#if>
                </div>
                <div class="user-detail">
                    <span class="detail-label">Статус:</span>
                    <#if user.active>
                        <span style="color: green;">Активен</span>
                    <#else>
                        <span style="color: red;">Неактивен</span>
                    </#if>
                </div>
            </div>
        </div>

        <div class="products-section">
            <h2 class="section-title">Товары пользователя (${user.products?size})</h2>

            <#if user.products?size == 0>
                <div class="no-products">
                    <h3>Товаров нет</h3>
                    <p>Пользователь еще не разместил ни одного товара.</p>
                </div>
            <#else>
                <div class="products-grid">
                    <#list user.products as product>
                        <div class="product-card">
                            <#if product.previewImageId??>
                                <img src="/images/${product.previewImageId}"
                                     class="product-image"
                                     alt="${product.title}">
                            <#else>
                                <div class="product-image"
                                     style="display: flex; align-items: center; justify-content: center; color: #999;">
                                    Нет изображения
                                </div>
                            </#if>
                            <div class="product-content">
                                <div class="product-title">${product.title}</div>
                                <div class="product-price">${product.price} руб.</div>
                                <div class="product-details">
                                    <strong>Город:</strong> ${product.city!"Не указан"}<br>
                                    <strong>Автор:</strong> ${product.author!"Неизвестен"}<br>
                                    <strong>Дата создания:</strong>
                                    <#if product.dateOfCreated??>
                                        <#if product.dateOfCreated?is_date>
                                            ${product.dateOfCreated?string("dd.MM.yyyy")}
                                        <#elseif product.dateOfCreated?is_string>
                                            ${product.dateOfCreated}
                                        <#else>
                                            Неизвестный формат даты
                                        </#if>
                                    <#else>
                                        Не указана
                                    </#if>
                                </div>
                                <a href="/product/${product.id}" class="product-link">
                                    Подробнее о товаре
                                </a>
                            </div>
                        </div>
                    </#list>
                </div>
            </#if>
        </div>

        <div class="actions">
            <a href="/" class="action-btn back-btn">На главную</a>
            <#if isAdmin>
                <a href="/admin" class="action-btn admin-btn">В админ-панель</a>
            </#if>
        </div>
    <#else>
        <div class="no-products">
            <h3>Пользователь не найден</h3>
            <p>Запрошенный пользователь не существует.</p>
            <a href="/" class="product-link" style="margin-top: 20px;">Вернуться на главную</a>
        </div>
    </#if>
</div>
</body>
</html>