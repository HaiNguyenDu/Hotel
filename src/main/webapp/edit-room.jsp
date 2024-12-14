<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Room</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            margin: 20px auto;
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
            border-color: #BA68C8;
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
        .container_header {
            width: 100%;
            height: 100vh;
            background-image: url("https://peridotgrandhotel.com/wp-content/uploads/2022/09/1.-Lobby-Entrance-2-2000.jpg");
            background-size: cover;
            display: flex;
            overflow: hidden;
        }
        .header {
            width: 250px;
            height: 100vh;
            background-color: rgba(0, 85, 76, 0.8);
            display: flex;
            flex-direction: column;
            align-items: center;
            font-size: 18px;
        }
        .header-buttons {
            width: 100%;
            display: flex;
            flex-direction: column;
            font-size: 50px;
            align-items: center;
            justify-content: center;
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
        .line {
            width: 100%;
            height: 1px;
            background-color: white;
        }
        .headeritem {
            font-size: 20px;
            color: #c99246;
        }
        .logo img {
            width: 150px;
        }
        .containerr {
            width: 100%;
            background-color: white;
            padding-left: 200px;
            padding-top: 100px;
        }
    </style>
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
            <button onclick="window.location.href='room-admin'" class="logout-button">Quản lý phòng</button>
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

                        <span class="font-weight-bold">Phòng</span>
                        <span class="text-black-50"></span>
                        <span> </span>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Chỉnh Sửa Phòng</h4>
                        </div>
                        <form action="edit-room" method="post">
                            <input type="hidden" name="id" value="${room.roomId}">
                            <div class="row mt-2">
                                <div class="col-md-6">
                                    <label class="labels">ID Loại Phòng</label>
                                    <select class="form-control" name="room_type_id">
                                        <option value="3000000001" ${room.room_type_id == '3000000001' ? 'selected' : ''}>3000000001</option>
                                        <option value="3000000002" ${room.room_type_id == '3000000002' ? 'selected' : ''}>3000000002</option>
                                        <option value="3000000003" ${room.room_type_id == '3000000003' ? 'selected' : ''}>3000000003</option>
                                        <option value="3000000004" ${room.room_type_id == '3000000004' ? 'selected' : ''}>3000000004</option>
                                        <option value="3000000005" ${room.room_type_id == '3000000005' ? 'selected' : ''}>3000000005</option>
                                        <option value="3000000006" ${room.room_type_id == '3000000006' ? 'selected' : ''}>3000000006</option>
                                        <option value="3000000007" ${room.room_type_id == '3000000007' ? 'selected' : ''}>3000000007</option>
                                        <option value="3000000008" ${room.room_type_id == '3000000008' ? 'selected' : ''}>3000000008</option>
                                        <option value="3000000009" ${room.room_type_id == '3000000009' ? 'selected' : ''}>3000000009</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Tên Phòng</label>
                                    <input type="text" class="form-control" name="room_name" placeholder="Nhập tên phòng" value="${room.roomName}">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="labels">Tầng</label>
                                    <input type="text" class="form-control" name="floor" placeholder="Nhập tầng" value="${room.floor}">
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Diện Tích</label>
                                    <input type="text" class="form-control" name="acreage" placeholder="Nhập diện tích" value="${room.acreage}">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Mô Tả</label>
                                    <input type="text" class="form-control" name="description" placeholder="Nhập mô tả" value="${room.description}">
                                </div>
                            </div>
                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" type="submit">Xác nhận thay đổi</button>
                                <a href="room-admin" class="btn btn-secondary">Quay lại trang quản lý phòng</a>
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
