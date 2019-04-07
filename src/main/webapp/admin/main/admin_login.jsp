<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/Login_style.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/Login_javascript.js"></script>

</head>
<body>
<h2 align="center">南阳理工社团 后台管理</h2>
<div class="login_frame"></div>
<div class="LoginWindow">
    <div>
        <form action="${pageContext.request.contextPath}/admin/login" onsubmit="return user_input()" class="login"
              method="post">
            <p>
                <label>帐号:</label>
                <input type="text" name="username" id="id" value="">
            </p>

            <p>
                <label for="password">密码:</label>
                <input type="password" name="password" id="password" value="">
            </p>

            <p class="login-submit">
                <button type="submit" class="login-button">登录</button>
            </p>

        </form>

    </div>
</div>

<div id="timeArea">
    <script> LoadBlogParts();</script>
</div>
</body>
</html>