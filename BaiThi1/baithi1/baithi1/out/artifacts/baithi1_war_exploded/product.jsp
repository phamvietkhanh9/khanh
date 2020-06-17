<%--
  Created by IntelliJ IDEA.
  User: Pham Viet Khanh
  Date: 10/06/2020
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <title>Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

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

<sql:setDataSource var="myDatasource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/fdata?serverTimezone=UTC" user="root" password=""/>
<sql:query var="result"  dataSource="${myDatasource}">
    SELECT * FROM tbproduct;
</sql:query>
<div class="row">
    <div class="container">
        <h3 class="text-center"> List Product </h3><hr>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Price</th>
                <th>Amount</th>
                <th>Details</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.id}"/></td>
                    <td><c:out value="${row.name}"/></td>
                    <td><c:out value="${row.price}"/></td>
                    <td><c:out value="${row.amount}"/></td>
                    <td><c:out value="${row.details}"/></td>
                </tr>
                </c:forEach>
            </tbody>
            <form action="logout" method="post">
                <input type="submit" value="Logout">
            </form>
        </table>
    </div>
</div>

</body>
</html>
