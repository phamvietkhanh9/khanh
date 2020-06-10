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
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <c:if test="${user !=null}">
                <form action="update" method="post"></form>
            </c:if>
            <c:if test="${user == null}">
                <form action="insert" method="post">
            </c:if>
            <caption>
                <h2>
                    <c:if test="${user != null}">Edit User</c:if>
                    <c:if test="${user == null}">Add New User</c:if>
                </h2>
            </caption>
            <c:if test="${user != null}">
                <input type="hidden" name="id" value="<c:out value='${user.id}'/>"/>
            </c:if>
            <fieldset class="form-group">
                <label>User Name</label>
                <input type="text" value="<c:out value='${user.name}'/>" class="form-control" name="name" required="required">
            </fieldset>
            <fieldset class="form-group">
                <label>User Email</label>
                <input type="text" value="<c:out value='${user.email}'/>" class="form-control" name="email" >
            </fieldset>
            <fieldset class="form-group">
                <label>User Country</label>
                <input type="text" value="<c:out value='${user.country}'/>" class="form-control" name="country" >
            </fieldset>

            <button type="submit" class="btn btn-success">save</button>
                </form>
        </div>
    </div>
</div>

</body>
</html>
