<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BUYSELL - Вход в систему</title>
    <style>
        :root {
            --primary: #4a6fa5;
            --secondary: #ff7e5f;
            --accent: #3a86ff;
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
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            max-width: 500px;
            width: 100%;
            background: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            overflow: hidden;
        }

        .header {
            background: var(--gradient);
            padding: 30px;
            text-align: center;
            color: white;
        }

        .logo {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            text-decoration: none;
            margin-bottom: 15px;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 20px;
        }

        .logo-text {
            font-size: 32px;
            font-weight: 800;
        }

        .header h1 {
            font-size: 24px;
            font-weight: 600;
            margin: 0;
        }

        .content {
            padding: 40px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--primary);
            font-size: 14px;
        }

        .form-input {
            width: 100%;
            padding: 14px 18px;
            border: 2px solid var(--light-gray);
            border-radius: var(--radius-sm);
            font-size: 16px;
            transition: all 0.3s;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(74, 111, 165, 0.1);
        }

        .btn {
            width: 100%;
            padding: 16px;
            background: var(--gradient);
            color: white;
            border: none;
            border-radius: var(--radius-sm);
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-hover);
        }

        .btn-outline {
            background: transparent;
            border: 2px solid var(--primary);
            color: var(--primary);
            margin-top: 15px;
        }

        .btn-outline:hover {
            background: var(--primary);
            color: white;
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

        .links {
            text-align: center;
            margin-top: 30px;
            padding-top: 25px;
            border-top: 1px solid var(--light-gray);
        }

        .links a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }

        .links a:hover {
            color: var(--accent);
            text-decoration: underline;
        }

        .user-info {
            text-align: center;
            margin-bottom: 25px;
            padding: 15px;
            background: rgba(74, 111, 165, 0.1);
            border-radius: var(--radius-sm);
            color: var(--primary);
            font-weight: 600;
        }

        .user-actions {
            display: flex;
            gap: 10px;
            margin-bottom: 25px;
        }

        .logout-btn {
            background: var(--danger);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: var(--radius-sm);
            cursor: pointer;
            font-weight: 600;
            transition: background 0.3s;
        }

        .logout-btn:hover {
            background: #c1121f;
        }

        .home-btn {
            background: var(--gray);
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: var(--radius-sm);
            font-weight: 600;
            transition: background 0.3s;
        }

        .home-btn:hover {
            background: #495057;
        }

        .password-toggle {
            position: relative;
        }

        .toggle-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: var(--gray);
        }

        .form-note {
            font-size: 12px;
            color: var(--gray);
            margin-top: 5px;
        }

        @media (max-width: 768px) {
            .content {
                padding: 30px 20px;
            }

            .header {
                padding: 25px 20px;
            }

            .logo-text {
                font-size: 28px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <a href="/" class="logo">
            <div class="logo-icon">BS</div>
            <div class="logo-text">BUYSELL</div>
        </a>
        <h1>Вход в аккаунт</h1>
    </div>

    <div class="content">
        <#if isAuthenticated>
            <div class="user-info">
                👋 Привет, ${currentUsername!""}!
            </div>
            <div class="user-actions">
                <form action="/logout" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="logout-btn">🚪 Выйти</button>
                </form>
                <a href="/" class="home-btn">🏠 На главную</a>
            </div>
        <#else>
            <#if errorMessage??>
                <div class="alert alert-error">
                    ❌ ${errorMessage}
                </div>
            </#if>

            <form action="/login" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                <div class="form-group">
                    <label class="form-label">Электронная почта</label>
                    <input type="email" name="username" class="form-input"
                           placeholder="your@email.com" required>
                </div>

                <div class="form-group password-toggle">
                    <label class="form-label">Пароль</label>
                    <input type="password" name="password" id="password"
                           class="form-input" placeholder="Введите пароль" required>
                    <span class="toggle-icon" onclick="togglePassword()">👁️</span>
                </div>

                <button type="submit" class="btn">
                    🔑 Войти в аккаунт
                </button>
            </form>

            <div class="links">
                <p>Нет аккаунта? <a href="/registration">Зарегистрируйтесь</a></p>
                <a href="/" class="home-btn">🏠 Вернуться на главную</a>
            </div>
        </#if>
    </div>
</div>

<script>
    function togglePassword() {
        const passwordInput = document.getElementById('password');
        const toggleIcon = event.currentTarget;

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            toggleIcon.textContent = '🙈';
        } else {
            passwordInput.type = 'password';
            toggleIcon.textContent = '👁️';
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        const firstInput = document.querySelector('.form-input');
        if (firstInput) {
            firstInput.focus();
        }
    });
</script>
</body>
</html>