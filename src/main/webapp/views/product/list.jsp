<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 9/4/2020
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Use Management Application</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        header{
            border-bottom: solid 1px #c0c0c0;
        }
        #product1{
            text-align: center;
        }
        #product2{
            text-align: right;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <header class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">ADMIN</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
<%--                    <li class="nav-item active">--%>
                        <a class="navbar-brand" href="http://localhost:8080/users">Khách hàng <span class="sr-only">(current)</span></a>
                        <a class="navbar-brand" href="http://localhost:8080/bill">Hóa đơn<span class="sr-only">(current)</span></a>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="#">Link</a>--%>
<%--                    </li>--%>
                    <li class="nav-item dropdown ">
                        <a class="nav-link dropdown-toggle navbar-brand" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Sản phẩm
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/products">Toàn bộ sản phẩm</a>
                            <a class="dropdown-item" href="/products?type=tivi">Tivi</a>
                            <a class="dropdown-item" href="/products?type=tu-lanh">Tủ lạnh</a>
                            <a class="dropdown-item" href="/products?type=dieu-hoa-nhiet-do">Điều hòa</a>
                            <a class="dropdown-item" href="/products?type=may-giat">Máy giặt</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Khác</a>
                        </div>
                    </li>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>--%>
<%--                    </li>--%>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Tìm kiếm" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm sản phẩm</button>
                </form>
            </div>
        </nav>

    </header>
</div>
<center>
    <h1 id="product1">Danh sách sản phẩm</h1>
    <h5 id="product2">
        <a href="/products?action=create"><input type="button" value="Thêm sản phẩm" class="btn btn-outline-success my-2 my-sm-0" ></a>
    </h5>
</center>
<div align="center">
    <table id="product3" border="1" cellpadding="5" class="table col-xs-9">
        <tr class="thead-dark">
            <th>ID</th>
            <th>Type</th>
            <th>Name</th>
            <th>Brand</th>
            <th>Price</th>
            <th>Image</th>
            <th>Amount</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${listProduct}" var="product">
            <tr>
                <td><a href="/products?action=view&id=${product.getId()}"><c:out value="${product.getId()}"></c:out></a></td>
                <td><c:out value="${product.getType()}"></c:out></td>
                <td><c:out value="${product.getName()}"></c:out></td>
                <td><c:out value="${product.getBrand()}"></c:out></td>
                <td><c:out value="${product.getPrice()}"></c:out></td>
                <td><img src="${product.getImage()}"/></td>
                <td><c:out value="${product.getAmount()}"></c:out></td>
                <td>
                    <a href="/products?action=edit&id=${product.getId()}">Edit</a>
                    <a href="/products?action=delete&id=${product.getId()}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
