<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BUYSELL - Админ-панель</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 1200px;
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
        }

        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .back-btn {
            background-color: #4a6fa5;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4a6fa5;
            color: white;
            font-weight: bold;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .user-link {
            color: #4a6fa5;
            text-decoration: none;
            font-weight: bold;
        }

        .user-link:hover {
            text-decoration: underline;
        }

        .role-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
        }

        .role-user {
            background-color: #e3f2fd;
            color: #1976d2;
        }

        .role-admin {
            background-color: #f3e5f5;
            color: #7b1fa2;
        }

        .delete-btn {
            background-color: #e63946;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .delete-btn:hover {
            background-color: #c1121f;
        }

        .no-users {
            text-align: center;
            padding: 40px;
            color: #666;
        }

        .stats {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 8px;
        }

        .stat-item {
            flex: 1;
            text-align: center;
            padding: 10px;
            background-color: white;
            border-radius: 6px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .stat-value {
            font-size: 24px;
            font-weight: bold;
            color: #4a6fa5;
        }

        .stat-label {
            font-size: 14px;
            color: #666;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="admin-header">
        <h1>Админ-панель BUYSELL</h1>
        <a href="/" class="back-btn">На главную</a>
    </div>

    <#if isAdmin>
        <div class="stats">
            <div class="stat-item">
                <div class="stat-value">${users?size}</div>
                <div class="stat-label">Всего пользователей</div>
            </div>
            <div class="stat-item">
                <div class="stat-value">
                    <#assign adminCount = 0>
                    <#list users as user>
                        <#if user.roles?seq_contains('ROLE_ADMIN')>
                            <#assign adminCount = adminCount + 1>
                        </#if>
                    </#list>
                    ${adminCount}
                </div>
                <div class="stat-label">Администраторов</div>
            </div>
            <div class="stat-item">
                <div class="stat-value">
                    <#assign userCount = 0>
                    <#list users as user>
                        <#assign totalProducts = user.products?size>
                        <#assign userCount = userCount + totalProducts>
                    </#list>
                    ${userCount}
                </div>
                <div class="stat-label">Всего товаров</div>
            </div>
        </div>

        <#if users?size == 0>
            <div class="no-users">
                <h3>Пользователи не найдены</h3>
                <p>В системе еще нет зарегистрированных пользователей.</p>
            </div>
        <#else>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Имя пользователя</th>
                    <th>Email</th>
                    <th>Телефон</th>
                    <th>Роль</th>
                    <th>Товаров</th>
                    <th>Действия</th>
                </tr>
                </thead>
                <tbody>
                <#list users as user>
                    <tr>
                        <td>${user.id}</td>
                        <td>
                            <a href="/user/${user.id}" class="user-link">
                                ${user.name!user.email}
                            </a>
                        </td>
                        <td>${user.email}</td>
                        <td>${user.phoneNumber!"Не указан"}</td>
                        <td>
                            <#if user.roles?seq_contains('ROLE_ADMIN')>
                                <span class="role-badge role-admin">Администратор</span>
                            <#else>
                                <span class="role-badge role-user">Пользователь</span>
                            </#if>
                        </td>
                        <td>${user.products?size}</td>
                        <td>
                            <#if !user.roles?seq_contains('ROLE_ADMIN') || currentUsername == user.email>
                                <form action="/user/delete/${user.id}" method="post" style="display: inline;">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <button type="submit" class="delete-btn"
                                            onclick="return confirm('Вы уверены, что хотите удалить пользователя ${user.name!user.email}? Это удалит все его товары!')">
                                        Удалить
                                    </button>
                                </form>
                            <#else>
                                <span style="color: #999; font-size: 12px;">Нельзя удалить администратора</span>
                            </#if>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </#if>
    <#else>
        <div style="text-align: center; padding: 50px 20px;">
            <h2 style="color: #e63946;">Доступ запрещен!</h2>
            <p>У вас недостаточно прав для доступа к этой странице.</p>
            <a href="/" style="display: inline-block; margin-top: 20px; padding: 10px 20px; background-color: #4a6fa5; color: white; text-decoration: none; border-radius: 5px;">
                Вернуться на главную
            </a>
        </div>
    </#if>
</div>
</body>
</html>