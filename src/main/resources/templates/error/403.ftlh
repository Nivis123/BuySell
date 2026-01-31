<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>403 - Доступ запрещен</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        h1 { font-size: 50px; color: #e63946; }
        p { font-size: 20px; }
        .container { max-width: 600px; margin: 0 auto; }
        .btn { display: inline-block; padding: 10px 20px; background: #4a6fa5; color: white; text-decoration: none; border-radius: 5px; margin-top: 20px; }
    </style>
</head>
<body>
<div class="container">
    <h1>403</h1>
    <h2>Доступ запрещен</h2>
    <p>${errorMessage!"У вас нет прав для доступа к этой странице."}</p>
    <a href="/" class="btn">На главную</a>
</div>
</body>
</html>