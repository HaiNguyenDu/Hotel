<%@ page import="java.util.Objects" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("user") == null || !Objects.equals(session.getAttribute("role"), "admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/admin.css'/>">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin:0;
            padding: 0;
        }
        .container{
            width: 100%;
            height: 100vh;
            background-image: url("https://peridotgrandhotel.com/wp-content/uploads/2022/09/1.-Lobby-Entrance-2-2000.jpg");
            background-size: cover;
            display: flex;
        }
        .header
        {
            width: 250px;
            height: 100vh;
            background-color: RGB(0, 85, 76,0.8);
            display: flex;
            flex-direction: column;
            align-items: center;
            font-size: 18px;

        }
        .logout-button {
            width: 100%;
            background-color: transparent;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            font-size: 18px;
            margin-top: 30px;
            font-weight: 600;
        }
        .header-buttons{
            width: 100%;
            display: flex;
            flex-direction: column;
            font-size: 50px;
            align-items: center;
            justify-content: center;
        }
        .line{
            width: 100%;
            height: 1px;
            background-color: white;
        }
        .headeritem{
            font-size: 20px;
            color: #c99246;

        }
        .logo img{
            width: 150px;
        }
        .containerr{
            width: 100%;
            background-color: white;
            padding-left: 200px;
            padding-top: 100px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="logo">
            <img src="https://static03-cdn.oneinventory.com/images/2022/07/dbe30a0bf14b4a67b38f09991e25aa23.png" alt="">
        </div>
        <h1 class="headeritem">Admin Dashboard</h1>
        <div class="line"></div>
        <div class="header-buttons">
            <button onclick="window.location.href='list-receptionist'" class="logout-button">Quản lý nhân viên</button>
            <button onclick="window.location.href='room-admin'" class="logout-button">Quản lý phòng</button>
            <button onclick="window.location.href='statistics'" class="logout-button">Thống kê</button>
            <form action="logout" method="post">
                <button type="submit" class="logout-button">Đăng Xuất</button>
            </form>
        </div>
    </div>
    <div class="containerr"></div>
</div>
</body>
</html>
