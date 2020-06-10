<%--
  Created by IntelliJ IDEA.
  User: Pham Viet Khanh
  Date: 10/06/2020
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Management Application</title>
    <link href="bootstrap.min.css" rel="stylesheet" type="text/css">

    <style type="text/css">
        table, th, td{
            border:1px solid black;
        }
        td{
            padding:20px 40px;
        }
    </style>
</head>
<body>
<header>
<nav class="navbar navbar-expand-md navbar-dark" style="width: auto">
    <div>
        <a href="" class="navbar-brand"> User Management App</a>
    </div>
    <ul class="navbar-nav">
        <li><a href="<%=request.getContextPath()%>/list" class="nav-link">User</a></li>
    </ul>
</nav>
</header>
<br>
<div class="row">
    <div class="container">
        <h3 class="text-center"> List of Users </h3><hr>
        <div class="container text-left">
            <a href="<%=request.getContextPath()%>/new" class="btn btn-success">add new User </a>
        </div><br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td>
                        <c:out value="${user.id}"/>
                    </td>
                    <td>
                        <c:out value="${user.name}"/>
                    </td>
                    <td>
                        <c:out value="${user.email}"/>
                    </td><td>
                    <c:out value="${user.country}"/>
                </td>
                    <td><a href="edi?id=<c:out value='${user.id}'/>">Edit</a>
                        <a href="delete?id=<c:out value='${user.id}'/>">Deletw</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
