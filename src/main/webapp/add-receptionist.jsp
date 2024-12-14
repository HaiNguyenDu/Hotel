<%@ page import="java.util.Objects" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">

    <!-- Fonts -->
    <!-- Font awesome - icon font -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <!-- Roboto -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,700' rel='stylesheet' type='text/css'>
    <!-- Open Sans -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:800italic' rel='stylesheet' type='text/css'>

    <!-- Stylesheets -->

    <!-- Mobile menu -->
    <link href="css/gozha-nav.css" rel="stylesheet" />
    <!-- Select -->
    <link href="css/external/jquery.selectbox.css" rel="stylesheet" />

    <!-- REVOLUTION BANNER CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="rs-plugin/css/settings.css" media="screen" />

    <!-- Custom -->
    <link href="css/style.css?v=1" rel="stylesheet" />
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }


        .container {
            margin: 20px auto;
            margin-top: 0;
            height: 100%;
            background-color: white;
            width: 100%;
        }

        .logout-button {
            background-color: #c99246;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #BA68C8
        }

        .profile-button {
            background: rgb(99, 39, 120);
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        .profile-button:hover {
            background: #682773;
        }

        .back:hover {
            color: #682773;
            cursor: pointer;
        }

        .labels {
            font-size: 11px;
        }

        .add-experience:hover {
            background: #BA68C8;
            color: #fff;
            cursor: pointer;
            border: solid 1px #BA68C8;
        }

        .back-button {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }
        body {
            font-family: Arial, sans-serif;
            margin:0;
            padding: 0;
        }
        .container_header{
            width: 100%;
            height: 100vh;
            background-image: url("https://peridotgrandhotel.com/wp-content/uploads/2022/09/1.-Lobby-Entrance-2-2000.jpg");
            background-size: cover;
            display: flex;
            overflow: hidden;
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
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<div class="container_header">
    <div class="header">
        <div class="logo">
            <img src="https://static03-cdn.oneinventory.com/images/2022/07/dbe30a0bf14b4a67b38f09991e25aa23.png" alt="">
        </div>
        <h1 class="headeritem">Admin Dashboard</h1>
        <div class="line"></div>
        <div class="header-buttons">
            <button onclick="window.location.href='list-receptionist'" class="logout-button">Quản lý nhân viên</button>

            <button onclick="window.location.href='statistics'" class="logout-button">Thống kê</button>

            <form action="logout" method="post">
                <button type="submit" class="logout-button">Đăng Xuất</button>
            </form>
        </div>
    </div>
    <div class="container">
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                        <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                        <span class="font-weight-bold">Nhân viên lễ tân</span>
                        <span class="text-black-50"></span>
                        <span> </span>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Thêm Nhân Viên Lễ Tân</h4>
                        </div>
                        <form action="add-receptionist" method="post">
                            <div class="row mt-2">
                                <div class="col-md-6">
                                    <label class="labels">ID Nhân Viên</label>
                                    <input type="text" class="form-control" name="id" placeholder="Nhập ID nhân viên" value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>">
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Họ và Tên</label>
                                    <input type="text" class="form-control" name="name" placeholder="Nhập họ và tên" value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="labels">Lương</label>
                                    <input type="text" class="form-control" name="salary" placeholder="Nhập lương" value="<%= request.getParameter("salary") != null ? request.getParameter("salary") : "" %>">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Giới Tính</label>
                                    <select class="form-control" name="gender">
                                        <option value="Nam" <%= "Nam".equals(request.getParameter("gender")) ? "selected" : "" %>>Nam</option>
                                        <option value="Nữ" <%= "Nữ".equals(request.getParameter("gender")) ? "selected" : "" %>>Nữ</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="labels">Số Điện Thoại</label>
                                    <input type="text" class="form-control" name="phone" placeholder="Nhập số điện thoại" value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>">
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">CCCD</label>
                                    <input type="text" class="form-control" name="cccd" placeholder="Nhập CCCD" value="<%= request.getParameter("cccd") != null ? request.getParameter("cccd") : "" %>">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Địa Chỉ</label>
                                    <input type="text" class="form-control" name="address" placeholder="Nhập địa chỉ" value="<%= request.getParameter("address") != null ? request.getParameter("address") : "" %>">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Email</label>
                                    <input type="text" class="form-control" name="email" placeholder="Nhập email" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Mật Khẩu</label>
                                    <input type="password" class="form-control" name="password" placeholder="Nhập mật khẩu" value="<%= request.getParameter("password") != null ? request.getParameter("password") : "" %>">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <select class="form-control" name="role">
                                        <option value="Cấp Cao">Cấp Cao</option>
                                        <option value="Cấp Thấp">Cấp Thấp</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" type="submit">Thêm Nhân Viên</button>
                                <a href="list-receptionist" class="btn btn-secondary">Quay lại trang nhân viên</a>
                            </div>
                        </form>
                        <%-- Display error message if it exists --%>
                        <%
                            String errorMessage = (String) request.getAttribute("errorMessage");
                            if (errorMessage != null) {
                        %>
                        <div class="alert alert-danger mt-3"><%= errorMessage %></div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.3.0/respond.js"></script>
</body>
</html>