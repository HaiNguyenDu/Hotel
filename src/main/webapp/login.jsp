<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
        .error-message {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">
                <img src="https://static03-cdn.oneinventory.com/images/2022/07/dbe30a0bf14b4a67b38f09991e25aa23.png" alt="">
            </div>
            <div class="home">Trang Chủ</div>
        </div>
        <div class="mainlogin">
            <!-- Form Đăng Nhập -->
            <form action="login" method="post">
                <div class="login">
                    <div class="text">PBL3 HOTEL <br><span style="color: #c99246;">GRAND</span></div>
                    <div class="name">
                        <input type="text" name="username" placeholder="UserName" required>
                    </div>
                    <div class="password">
                        <input type="password" name="password" placeholder="Password" required>
                    </div>
                    <div class="button">
                        <input type="submit" class="submit" value="Đăng Nhập">
                    </div>
                    <div class="error-message">
                        <c:if test="${not empty loginError}">
                            ${loginError}
                        </c:if>
                    </div>
                </div>
                <div class="link">
                    <button type="button" id="showRegisterForm">Chưa có tài khoản? Đăng ký ngay</button>
                </div>
            </form>

            <form action="register" method="post">
                <div class="register">
                    <div class="text">PBL3 HOTEL <br><span style="color: #c99246;">GRAND</span></div>
                    <div class="name">
                        <input type="text" name="username" placeholder="UserName" required>
                    </div>
                    <div class="password">
                        <input type="password" name="password" placeholder="Password" required>
                    </div>
                    <div class="button">
                        <input type="submit" class="submit" value="Đăng Ký">
                    </div>
                    <div class="link">
                        <button type="button" id="showLoginForm">Đã có tài khoản? Đăng nhập</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script>
        document.getElementById('showRegisterForm').onclick = function() {
            document.querySelector('.login').style.display = 'none';
            document.querySelector('.register').style.display = 'block';
        };
        document.getElementById('showLoginForm').onclick = function() {
            document.querySelector('.register').style.display = 'none';
            document.querySelector('.login').style.display = 'block';
        };
    </script>
</body>
</html>
