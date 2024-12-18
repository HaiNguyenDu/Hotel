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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        * {
            box-sizing: border-box;
        }
        .bang {
            width: 850px;
            height: 650px;
            display: flex;
            margin: 0 auto;
            margin-top: 50px;
            align-items: center;
            padding-top: 100px;
            flex-direction: column;
            padding-bottom: 20px;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
        }
        .container {
            width: 100%;
            height: 100vh;
            background-image: url("https://peridotgrandhotel.com/wp-content/uploads/2022/09/1.-Lobby-Entrance-2-2000.jpg");
            background-size: cover;
            display: flex;
        }
        .header {
            width: 305px;
            height: 100vh;
            background-color: RGB(0, 85, 76, 0.8);
            display: flex;
            flex-direction: column;
            align-items: center;
            font-size: 18px;
            padding: 0;
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
        .header-buttons {
            width: 100%;
            display: flex;
            flex-direction: column;
            font-size: 50px;
            align-items: center;
            justify-content: center;
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
        .user-list tbody td > img {
            position: relative;
            max-width: 50px;
            float: left;
            margin-right: 15px;
        }
        .user-list tbody td .user-link {
            display: block;
            font-size: 1.25em;
            padding-top: 3px;
            margin-left: 60px;
        }
        .user-list tbody td .user-subhead {
            font-size: 0.875em;
            font-style: italic;
        }
        .table {
            border-collapse: separate;
        }
        .table-hover > tbody > tr:hover > td,
        .table-hover > tbody > tr:hover > th {
            background-color: #eee;
        }
        .table thead > tr > th {
            border-bottom: 1px solid #C2C2C2;
            padding-bottom: 0;
        }
        .table tbody > tr > td {
            font-size: 0.875em;
            background: #f5f5f5;
            border-top: 10px solid #fff;
            vertical-align: middle;
            padding: 12px 8px;
        }
        .table tbody > tr > td:first-child,
        .table thead > tr > th:first-child {
            padding-left: 20px;
        }
        .table thead > tr > th span {
            border-bottom: 2px solid #C2C2C2;
            display: inline-block;
            padding: 0 5px;
            padding-bottom: 5px;
            font-weight: normal;
        }
        .table thead > tr > th > a span {
            color: #344644;
        }
        .table thead > tr > th > a span:after {
            content: "\f0dc";
            font-family: FontAwesome;
            font-style: normal;
            font-weight: normal;
            text-decoration: inherit;
            margin-left: 5px;
            font-size: 0.75em;
        }
        .table thead > tr > th > a.asc span:after {
            content: "\f0dd";
        }
        .table thead > tr > th > a.desc span:after {
            content: "\f0de";
        }
        .table thead > tr > th > a:hover span {
            text-decoration: none;
            color: #2bb6a3;
            border-color: #2bb6a3;
        }
        .table.table-hover tbody > tr > td {
            -webkit-transition: background-color 0.15s ease-in-out 0s;
            transition: background-color 0.15s ease-in-out 0s;
        }
        .table tbody tr td .call-type {
            display: block;
            font-size: 0.75em;
            text-align: center;
        }
        .table tbody tr td .first-line {
            line-height: 1.5;
            font-weight: 400;
            font-size: 1.125em;
        }
        .table tbody tr td .first-line span {
            font-size: 0.875em;
            color: #969696;
            font-weight: 300;
        }
        .table tbody tr td .second-line {
            font-size: 0.875em;
            line-height: 1.2;
        }
        .table a.table-link {
            margin: 0 5px;
            font-size: 1.125em;
        }
        .table a.table-link:hover {
            text-decoration: none;
            color: #2aa493;
        }
        .table a.table-link.danger {
            color: #fe635f;
        }
        .table a.table-link.danger:hover {
            color: #dd504c;
        }
        .table-products tbody > tr > td {
            background: none;
            border: none;
            border-bottom: 1px solid #ebebeb;
            -webkit-transition: background-color 0.15s ease-in-out 0s;
            transition: background-color 0.15s ease-in-out 0s;
            position: relative;
        }
        .table-products tbody > tr:hover > td {
            text-decoration: none;
            background-color: #f6f6f6;
        }
        td {
            margin-right: 50px;
        }
        .table-products .name {
            display: block;
            font-weight: 600;
            padding-bottom: 7px;
        }
        .table-products .price {
            display: block;
            text-decoration: none;
            width: 50%;
            float: left;
            font-size: 0.875em;
        }
        .table-products .price > i {
            color: #8dc859;
        }
        .table-products .warranty {
            display: block;
            text-decoration: none;
            width: 50%;
            float: left;
            font-size: 0.875em;
        }
        .add-button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            margin-bottom: 20px;
        }
        .table-products .warranty > i {
            color: #f1c40f;
        }
        .table tbody > tr.table-line-fb > td {
            background-color: #9daccb;
            color: #262525;
        }
        .table tbody > tr.table-line-twitter > td {
            background-color: #9fccff;
            color: #262525;
        }
        .table tbody > tr.table-line-plus > td {
            background-color: #eea59c;
            color: #262525;
            border-radius: 5px;
        }
        .table-stats .status-social-icon {
            font-size: 1.9em;
            vertical-align: bottom;
        }
        .table-stats .table-line-fb .status-social-icon {
            color: #556484;
        }
        .table-stats .table-line-twitter .status-social-icon {
            color: #5885b8;
        }
        .table-stats .table-line-plus .status-social-icon {
            color: #a75d54;
        }
        .containerr {
            width: 100%;
            background-color: white;
            padding-left: 200px;
            display: flex;
            padding-right: 150px;
            flex-direction: column;
        }
        .tk {
            width: 100%;
            display: flex;
            flex-direction: column;
            margin-left: 240px;
        }
        .apply {
            width: 100px;
            font-size: 18px;
            color: white;
            background-color: #00554C;
            margin-top: 10px;
        }
        .date {
            width: 200px;
        }
        .containerr_header {
            font-size: 45px;
            margin-bottom: 50px;
            color: #c99246;
        }
        .result {
            margin-right: 200px;
        }
        tr td {
            border-style: solid;
            border: 0px;
        }
        .boxdate {
            font-size: 20px;
            margin-bottom: 10px;
        }
    </style>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
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

    <div class="containerr">
        <div class="bang">
            <h2 class="containerr_header">Doanh Thu</h2>
            <div class="tk">
                <label for="date-filter" class="boxdate">Thống Kê Theo Ngày</label>
                <input type="Date" id="date-filter" class="date">
                <button type="button" onclick="applyDateFilter()" class="apply">Xác Nhận</button>
            </div>
            <table class="table" style="overflow-y: scroll; display: block; height: 200px">
                <thead>
                <tr>
                    <th>Tên Khách Hàng</th>
                    <th>Ngày Check-in</th>
                    <th>Doanh Thu</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="totalRevenue" value="0" />
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td style="width: 200px">${booking.customerName}</td>
                        <td>${booking.checkinDate}</td>
                        <td>${booking.amount}</td>
                        <c:set var="totalRevenue" value="${totalRevenue + booking.amount}" />
                    </tr>
                </c:forEach>
                </tbody>
                
            </table>
            <DIV style="padding-right: 100px; color: #00554C; display: flex; margin-top: 30px">
                    <DIV colspan="4" style="width: 130px;" ><strong>Tổng doanh thu:</strong></DIV>
                    <DIV>${totalRevenue} VND</DIV>
              </DIV> 
        </div>
    </div>
</div>
<script>
    function applyDateFilter() {
        var date = document.getElementById("date-filter").value;
        window.location.href = "statistics?date=" + date;
    }
</script>
</body>
</html>
