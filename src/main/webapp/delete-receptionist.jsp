<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Receptionists</title>
    <style>
        /* Add your CSS styling here */
    </style>
</head>
<body>
<h1>List of Receptionists</h1>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Salary</th>
        <th>Gender</th>
        <th>Phone</th>
        <th>CCCD</th>
        <th>Address</th>
        <th>Role</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.salary}</td>
            <td>${user.gender}</td>
            <td>${user.phone}</td>
            <td>${user.cccd}</td>
            <td>${user.address}</td>
            <td>${user.role}</td>
            <td>${user.email}</td>
            <td>
                <a href="edit-receptionist?id=${user.id}" class="table-link">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                            </span>
                </a>
                <a href="delete-receptionist?id=${user.id}" class="table-link danger">
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
</body>
</html>
