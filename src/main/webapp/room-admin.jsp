<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Admin</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }
        .container {
            display: flex;
            height: 100%;
            overflow: hidden;
            background-image: url("https://peridotgrandhotel.com/wp-content/uploads/2022/09/1.-Lobby-Entrance-2-2000.jpg");
            background-size: cover;
            display: flex;
        }
        .header {
            width: 250px;
            background-color: rgba(0, 85, 76, 0.8);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px 0;
        }
        .header .logo img {
            width: 150px;
        }
        .header .headeritem {
            font-size: 20px;
            color: #c99246;
            margin: 20px 0;
        }
        .header .line {
            width: 80%;
            height: 1px;
            background-color: white;
            margin: 20px 0;
        }
        .header .header-buttons {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .header .header-button {
            background-color: transparent;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            font-size: 18px;
            margin: 10px 0;
            font-weight: 600;
            text-align: center;
        }
        .content {
            flex: 1;
            padding: 20px;
            background-color: white;
            display: flex;
            flex-direction: column;
            box-shadow:5px 5px 10px darkslategrey ;
        }
        .content .add-button {
            align-self: flex-start;
            background-color: rgba(0, 85, 76, 0.8);
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            margin-bottom: 20px;
            font-size: 16px;
        }
        .table-container {
            flex: 1;
            overflow-y: auto;
        }
        .table-responsive {
            width: 100%;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        .table th, .table td {
            text-align: left;
            padding: 12px;
        }
        .table th {
            background-color: #f2f2f2;
        }
        .table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .table tbody tr:hover {
            background-color: #eee;
        }
        .table .user-link {
            color: #344644;
            text-decoration: none;
        }
        .table .user-link:hover {
            text-decoration: underline;
        }
        .table .table-link {
            margin: 0 5px;
            font-size: 1.125em;
        }
        .table .table-link:hover {
            text-decoration: none;
            color: #2aa493;
        }
        .table .table-link.danger {
            color: #fe635f;
        }
        .table .table-link.danger:hover {
            color: #dd504c;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="logo">
            <img src="https://static03-cdn.oneinventory.com/images/2022/07/dbe30a0bf14b4a67b38f09991e25aa23.png" alt="Logo">
        </div>
        <h1 class="headeritem">Admin Dashboard</h1>
        <div class="line"></div>
        <div class="header-buttons">
            <button onclick="window.location.href='list-receptionist'" class="header-button">Quản lý nhân viên</button>
            <button onclick="window.location.href='room-admin'" class="header-button">Quản lý phòng</button>
            <button onclick="window.location.href='statistics'" class="header-button">Thống kê</button>
            <form action="logout" method="post">
                <button type="submit" class="header-button">Đăng Xuất</button>
            </form>
        </div>
    </div>
    <div class="content">
        <button class="add-button" onclick="location.href='add-room.jsp'">Thêm phòng</button>
        <div class="table-container">
            <div class="table-responsive">
                <table class="table user-list">
                    <thead>
                    <tr>
                        <th><span>Room Name</span></th>
                        <th><span>Status</span></th>
                        <th><span>Floor</span></th>
                        <th><span>Acreage</span></th>
                        <th><span>Description</span></th>
                        <th><span>Room Type</span></th>
                        <th><span>Base Price</span></th>
                        <th><span>Actions</span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="room" items="${rooms}">
                        <tr>
                            <td>${room.roomName}</td>
                            <td>${room.status}</td>
                            <td>${room.floor}</td>
                            <td>${room.acreage}</td>
                            <td>${room.description}</td>
                            <td>${room.roomTypeName}</td>
                            <td>${room.base_price}</td>
                            <td>
                                <a href="edit-room?id=${room.roomId}" class="table-link">
                                    <span class="fa-stack">
                                        <i class="fa fa-square fa-stack-2x"></i>
                                        <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                                <a href="delete-room?id=${room.roomId}" class="table-link danger" onclick="return confirm('Are you sure you want to delete this room?');">
                                    <span class="fa-stack">
                                        <i class="fa fa-square fa-stack-2x"></i>
                                        <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger mt-3">${errorMessage}</div>
        </c:if>
    </div>
</div>
</body>
</html>
