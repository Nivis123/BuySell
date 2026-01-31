<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BUYSELL - Регистрация</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            max-width: 600px;
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

        .header p {
            opacity: 0.9;
            margin-top: 10px;
            font-size: 14px;
        }

        .content {
            padding: 40px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 25px;
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--primary);
            font-size: 14px;
        }

        .form-label .required {
            color: var(--danger);
            margin-left: 4px;
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

        .form-input.error {
            border-color: var(--danger);
            background: rgba(230, 57, 70, 0.05);
        }

        .form-note {
            font-size: 12px;
            color: var(--gray);
            margin-top: 5px;
            display: flex;
            align-items: center;
            gap: 5px;
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
            user-select: none;
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

        .btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
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

        .alert-success {
            background: rgba(56, 176, 0, 0.1);
            border-left-color: var(--success);
            color: #2e7d32;
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

        .strength-meter {
            height: 4px;
            background: var(--light-gray);
            border-radius: 2px;
            margin-top: 10px;
            overflow: hidden;
        }

        .strength-fill {
            height: 100%;
            width: 0%;
            border-radius: 2px;
            transition: all 0.3s;
        }

        .strength-text {
            font-size: 12px;
            color: var(--gray);
            margin-top: 5px;
            text-align: right;
        }

        .strength-weak { background: var(--danger); }
        .strength-medium { background: #ff9800; }
        .strength-strong { background: var(--success); }

        .user-info {
            text-align: center;
            margin-bottom: 25px;
            padding: 15px;
            background: rgba(56, 176, 0, 0.1);
            border-radius: var(--radius-sm);
            color: var(--success);
            font-weight: 600;
        }

        .home-btn {
            background: var(--gray);
            color: white;
            text-decoration: none;
            padding: 12px 24px;
            border-radius: var(--radius-sm);
            font-weight: 600;
            transition: background 0.3s;
            display: inline-block;
            margin-top: 20px;
        }

        .home-btn:hover {
            background: #495057;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 25px;
            padding: 15px;
            background: var(--light);
            border-radius: var(--radius-sm);
        }

        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
        }

        .checkbox-group label {
            font-size: 14px;
            color: var(--dark);
        }

        .checkbox-group a {
            color: var(--primary);
            text-decoration: none;
        }

        .checkbox-group a:hover {
            text-decoration: underline;
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
        <h1>Регистрация нового аккаунта</h1>
        <p>Присоединяйтесь к сообществу BUYSELL!</p>
    </div>

    <div class="content">
        <#if isAuthenticated>
            <div class="user-info">
                ✅ Вы уже вошли как ${currentUsername!""}
            </div>
            <div style="text-align: center;">
                <p>Для регистрации нового аккаунта необходимо выйти из текущего.</p>
                <div style="display: flex; gap: 10px; justify-content: center; margin-top: 20px;">
                    <a href="/" class="btn btn-primary" style="width: auto;">🏠 На главную</a>
                    <form action="/logout" method="post" style="display: inline;">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-danger" style="width: auto;">🚪 Выйти</button>
                    </form>
                </div>
            </div>
        <#else>
            <#if errorMessage??>
                <div class="alert alert-error">
                    ❌ ${errorMessage}
                </div>
            </#if>

            <form action="/registration" method="post" id="registrationForm">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                <div class="form-grid">
                    <div class="form-group">
                        <label class="form-label">
                            Имя пользователя <span class="required">*</span>
                        </label>
                        <input type="text" name="name" class="form-input"
                               placeholder="Ваше имя" required
                               minlength="2" maxlength="50">
                        <div class="form-note">📝 Как вас будут видеть другие пользователи</div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">
                            Номер телефона
                        </label>
                        <input type="tel" name="phoneNumber" class="form-input"
                               placeholder="+79235678421 или 89235678421">
                        <div class="form-note">📱 Любой формат: +7(XXX)XXX-XX-XX, 8XXXXXXXXXX</div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">
                        Электронная почта <span class="required">*</span>
                    </label>
                    <input type="email" name="email" class="form-input"
                           placeholder="your@email.com" required
                           pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$">
                    <div class="form-note">✉️ На этот email будут приходить уведомления</div>
                </div>

                <div class="form-group password-toggle">
                    <label class="form-label">
                        Пароль <span class="required">*</span>
                    </label>
                    <input type="password" name="password" id="password"
                           class="form-input"
                           placeholder="Создайте надежный пароль" required
                           minlength="6"
                           oninput="checkPasswordStrength(this.value)">
                    <span class="toggle-icon" onclick="togglePassword('password')">👁️</span>

                    <div class="strength-meter">
                        <div class="strength-fill" id="passwordStrength"></div>
                    </div>
                    <div class="strength-text" id="passwordStrengthText">Введите пароль</div>
                    <div class="form-note">🔒 Минимум 6 символов. Рекомендуется использовать цифры, буквы и специальные символы</div>
                </div>

                <div class="form-group password-toggle">
                    <label class="form-label">
                        Подтверждение пароля <span class="required">*</span>
                    </label>
                    <input type="password" id="confirmPassword" class="form-input"
                           placeholder="Повторите пароль" required
                           oninput="checkPasswordsMatch()">
                    <span class="toggle-icon" onclick="togglePassword('confirmPassword')">👁️</span>
                    <div class="form-note" id="passwordMatchText"></div>
                </div>

                <div class="checkbox-group">
                    <input type="checkbox" id="terms" name="terms" required>
                    <label for="terms">
                        Я согласен с <a href="#">правилами использования</a> и
                        <a href="#">политикой конфиденциальности</a>
                    </label>
                </div>

                <button type="submit" class="btn" id="submitBtn">
                    🚀 Создать аккаунт
                </button>
            </form>

            <div class="links">
                <p>Уже есть аккаунт? <a href="/login">Войдите</a></p>
                <a href="/" class="home-btn">🏠 Вернуться на главную</a>
            </div>
        </#if>
    </div>
</div>

<script>
    function togglePassword(fieldId) {
        const input = document.getElementById(fieldId);
        const toggleIcon = event.currentTarget;

        if (input.type === 'password') {
            input.type = 'text';
            toggleIcon.textContent = '🙈';
        } else {
            input.type = 'password';
            toggleIcon.textContent = '👁️';
        }
    }

    function checkPasswordStrength(password) {
        const strengthBar = document.getElementById('passwordStrength');
        const strengthText = document.getElementById('passwordStrengthText');

        let strength = 0;
        let text = 'Введите пароль';
        let color = '';

        if (password.length >= 6) strength += 25;
        if (password.length >= 10) strength += 25;
        if (/[A-Z]/.test(password) && /[a-z]/.test(password)) strength += 25;
        if (/[0-9]/.test(password)) strength += 15;
        if (/[^A-Za-z0-9]/.test(password)) strength += 10;

        strength = Math.min(strength, 100);
        strengthBar.style.width = strength + '%';

        if (strength < 30) {
            color = 'strength-weak';
            text = 'Слабый пароль';
        } else if (strength < 70) {
            color = 'strength-medium';
            text = 'Средний пароль';
        } else {
            color = 'strength-strong';
            text = 'Надежный пароль';
        }

        strengthBar.className = 'strength-fill ' + color;
        strengthText.textContent = text;
        strengthText.style.color = getComputedStyle(document.documentElement)
            .getPropertyValue('--' + color.split('-')[1]);
    }

    function checkPasswordsMatch() {
        const password = document.getElementById('password').value;
        const confirm = document.getElementById('confirmPassword').value;
        const matchText = document.getElementById('passwordMatchText');

        if (confirm.length === 0) {
            matchText.textContent = '';
            matchText.style.color = '';
            return;
        }

        if (password === confirm) {
            matchText.innerHTML = '✅ Пароли совпадают';
            matchText.style.color = getComputedStyle(document.documentElement)
                .getPropertyValue('--success');
        } else {
            matchText.innerHTML = '❌ Пароли не совпадают';
            matchText.style.color = getComputedStyle(document.documentElement)
                .getPropertyValue('--danger');
        }
    }

    // Валидация формы перед отправкой
    document.getElementById('registrationForm').addEventListener('submit', function(e) {
        const password = document.getElementById('password').value;
        const confirm = document.getElementById('confirmPassword').value;
        const submitBtn = document.getElementById('submitBtn');

        if (password !== confirm) {
            e.preventDefault();
            alert('Пароли не совпадают. Пожалуйста, проверьте введенные данные.');
            return;
        }

        if (password.length < 6) {
            e.preventDefault();
            alert('Пароль должен содержать минимум 6 символов.');
            return;
        }


        submitBtn.disabled = true;
        submitBtn.innerHTML = '⏳ Создаем аккаунт...';
    });


    document.addEventListener('DOMContentLoaded', function() {
        const firstInput = document.querySelector('input[name="name"]');
        if (firstInput) {
            firstInput.focus();
        }
    });
</script>
</body>
</html>