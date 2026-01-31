<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BUYSELL - Защищенная страница</title>
</head>
<body>
<h1>BUYSELL |
    <#if isAuthenticated?? && isAuthenticated>
        <span>Привет, ${currentUsername!""}!</span> |
        <form action="/logout" method="post" style="display:inline;">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="submit" value="Выйти"/>
        </form>
    <#else>
        <a href="/login">Войти</a> | <a href="/registration">Регистрация</a>
    </#if>
</h1>
<hr>

<h2>Добро пожаловать на защищенную страницу!</h2>
<p>Эта страница доступна только авторизованным пользователям.</p>

<#if currentUsername??>
    <p>Вы вошли как: <strong>${currentUsername}</strong></p>
</#if>

<p><a href="/">Вернуться на главную</a></p>
<p>Текущее время: ${.now?string('yyyy-MM-dd HH:mm:ss')}</p>
</body>
</html>