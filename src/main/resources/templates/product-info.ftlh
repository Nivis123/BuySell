<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BUYSELL - ${(product.title)!'Товар'}</title>
    <style>
        :root {
            --primary: #4a6fa5;
            --secondary: #ff7e5f;
            --accent: #3a86ff;
            --danger: #e63946;
            --success: #38b000;
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
            background: #c1121f;
        }

        .btn-back {
            background: var(--gray);
            color: white;
        }

        .btn-back:hover {
            background: #495057;
        }

        .content {
            margin: 30px 0;
        }

        .alert {
            padding: 16px 20px;
            border-radius: var(--radius-sm);
            margin-bottom: 25px;
            border-left: 4px solid;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .alert-error {
            background: rgba(230, 57, 70, 0.1);
            border-left-color: var(--danger);
            color: #c62828;
        }

        .product-card {
            background: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            margin-bottom: 30px;
        }

        .product-header {
            background: var(--gradient);
            padding: 30px;
            color: white;
            position: relative;
        }

        .product-title {
            font-size: 32px;
            font-weight: 800;
            margin-bottom: 10px;
        }

        .product-price {
            font-size: 40px;
            font-weight: 900;
            color: var(--secondary);
            margin: 20px 0;
        }

        .product-badge {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(255, 255, 255, 0.2);
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
            backdrop-filter: blur(10px);
        }

        .product-body {
            padding: 40px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
        }

        @media (max-width: 768px) {
            .product-body {
                grid-template-columns: 1fr;
            }
        }

        .product-images {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .main-image {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: var(--radius-sm);
            background: linear-gradient(45deg, #f0f0f0, #e0e0e0);
        }

        .image-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
        }

        .image-thumb {
            width: 100%;
            height: 100px;
            object-fit: cover;
            border-radius: var(--radius-sm);
            cursor: pointer;
            transition: transform 0.3s;
        }

        .image-thumb:hover {
            transform: scale(1.05);
        }

        .product-info {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .info-group {
            background: var(--light);
            padding: 20px;
            border-radius: var(--radius-sm);
            border-left: 4px solid var(--primary);
        }

        .info-label {
            font-size: 12px;
            text-transform: uppercase;
            color: var(--gray);
            font-weight: 600;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
        }

        .info-value {
            font-size: 18px;
            font-weight: 600;
            color: var(--dark);
        }

        .user-link {
            display: flex;
            align-items: center;
            gap: 10px;
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
            padding: 15px;
            background: rgba(74, 111, 165, 0.1);
            border-radius: var(--radius-sm);
            transition: all 0.3s;
        }

        .user-link:hover {
            background: var(--primary);
            color: white;
            transform: translateX(5px);
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            background: var(--gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 18px;
        }

        .danger-zone {
            background: rgba(230, 57, 70, 0.1);
            padding: 30px;
            border-radius: var(--radius);
            border: 2px dashed var(--danger);
            text-align: center;
            margin-top: 30px;
        }

        .danger-title {
            color: var(--danger);
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .actions {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin-top: 30px;
        }

        .no-product {
            text-align: center;
            padding: 80px 40px;
            background: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
        }

        .no-product-icon {
            font-size: 80px;
            margin-bottom: 20px;
            color: var(--gray);
        }

        .current-time {
            text-align: center;
            margin-top: 30px;
            color: var(--gray);
            font-size: 14px;
            padding: 10px;
            background: white;
            border-radius: var(--radius-sm);
            box-shadow: var(--shadow);
            display: inline-block;
        }

        .description-box {
            background: white;
            padding: 30px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            margin-top: 30px;
            border-left: 4px solid var(--accent);
        }

        .description-title {
            color: var(--accent);
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .description-text {
            line-height: 1.8;
            color: var(--dark);
            font-size: 16px;
        }

        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 15px;
            }

            .user-menu {
                flex-direction: column;
                width: 100%;
            }

            .product-title {
                font-size: 24px;
            }

            .product-price {
                font-size: 32px;
            }

            .main-image {
                height: 300px;
            }

            .actions {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
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
                    <form action="/logout" method="post" style="display:inline;">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-danger">🚪 Выйти</button>
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
    <#if errorMessage??>
        <div class="alert alert-error">
            ❌ ${errorMessage}
        </div>
    </#if>

    <#if product??>
        <div class="product-card">
            <div class="product-header">
                <div class="product-title">${product.title}</div>
                <div class="product-price">${product.price!"0"} ₽</div>
                <div class="product-badge">📦 Товар #${product.id}</div>
            </div>

            <div class="product-body">
                <div class="product-images">
                    <#if product.images?? && product.images?size gt 0>
                        <img src="/images/${product.images[0].id}"
                             class="main-image"
                             alt="${product.title}"
                             id="mainImage">

                        <#if product.images?size gt 1>
                            <div class="image-grid">
                                <#list product.images as image>
                                    <img src="/images/${image.id}"
                                         class="image-thumb"
                                         alt="Изображение ${image_index + 1}"
                                         onclick="changeMainImage(this.src)"
                                         <#if image.previewImage>style="border: 3px solid var(--secondary);"</#if>>
                                </#list>
                            </div>
                        </#if>
                    <#else>
                        <div class="main-image"
                             style="display: flex; align-items: center; justify-content: center; color: var(--gray);">
                            📷 Нет изображений
                        </div>
                    </#if>
                </div>

                <div class="product-info">
                    <div class="info-group">
                        <div class="info-label">📍 Город</div>
                        <div class="info-value">${product.city!"Не указан"}</div>
                    </div>

                    <div class="info-group">
                        <div class="info-label">✏️ Автор</div>
                        <div class="info-value">${product.author!"Неизвестен"}</div>
                    </div>

                    <div class="info-group">
                        <div class="info-label">👤 Продавец</div>
                        <#if product.userId??>
                            <a href="/user/${product.userId}" class="user-link">
                                <div class="user-avatar">
                                    ${(product.userName!product.userEmail)?substring(0,1)?upper_case}
                                </div>
                                <div>${product.userName!product.userEmail}</div>
                            </a>
                        <#else>
                            <div class="info-value">Неизвестен</div>
                        </#if>
                    </div>

                    <div class="info-group">
                        <div class="info-label">📅 Дата создания</div>
                        <div class="info-value">
                            <#if product.dateOfCreated??>
                                <#if product.dateOfCreated?is_date>
                                    ${product.dateOfCreated?string("dd.MM.yyyy HH:mm")}
                                <#else>
                                    ${product.dateOfCreated}
                                </#if>
                            <#else>
                                Не указана
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <#if product.description?? && product.description != "">
            <div class="description-box">
                <div class="description-title">📝 Описание товара</div>
                <div class="description-text">${product.description}</div>
            </div>
        </#if>

        <#if isOwner?? && isOwner>
            <div class="danger-zone">
                <div class="danger-title">⚠️ Удаление товара</div>
                <p>Вы уверены, что хотите удалить этот товар? Это действие нельзя отменить.</p>
                <form action="/product/delete/${product.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-danger"
                            onclick="return confirm('Вы уверены, что хотите удалить товар?');">
                        🗑️ Удалить товар
                    </button>
                </form>
            </div>
        </#if>

        <div class="actions">
            <a href="/" class="btn btn-back">← Вернуться к списку товаров</a>
            <#if product.user??>
                <a href="/user/${product.user.id}" class="btn btn-outline">
                    👤 Все товары продавца
                </a>
            </#if>
        </div>

    <#else>
        <div class="no-product">
            <div class="no-product-icon">😕</div>
            <h2 style="color: var(--gray); margin-bottom: 20px;">Товар не найден</h2>
            <p style="color: var(--gray); margin-bottom: 30px;">Запрошенный товар не существует или был удален.</p>
            <a href="/" class="btn btn-primary">Вернуться на главную</a>
        </div>
    </#if>

    <div style="text-align: center; margin-top: 30px;">
        <div class="current-time">
            🕐 Текущее время: ${.now?string('dd.MM.yyyy HH:mm:ss')}
        </div>
    </div>
</main>

<script>
    function changeMainImage(src) {
        document.getElementById('mainImage').src = src;
    }

    document.addEventListener('DOMContentLoaded', function() {
        const elements = document.querySelectorAll('.product-card, .description-box, .danger-zone');
        elements.forEach(function(el, index) {
            el.style.animationDelay = (index * 0.2) + 's';
            el.classList.add('fade-in');
        });
    });

    const style = document.createElement('style');
    style.textContent = '@keyframes fadeIn {from { opacity: 0; transform: translateY(20px); }to { opacity: 1; transform: translateY(0); }}.fade-in {animation: fadeIn 0.5s ease-out forwards;}';
    document.head.appendChild(style);
</script>
</body>
</html>