<%-- 
    Document   : mobileShop
    Created on : Apr 12, 2024, 9:40:11 PM
    Author     : Admin
--%>

<%@page import="object.UserDTO"%>
<%@page import="object.MobileDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
             <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="number"] {
            width: 100px;
            padding: 5px;
        }
        input[type="submit"] {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        select {
            padding: 5px;
        }
    </style>
    </head>

    <body>

        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}"/>
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />
        <c:set var="minPrice" value="${param.minPrice != null ? param.minPrice : (empty sessionScope.minPrice ? '' : sessionScope.minPrice)}" />
        <c:set var="maxPrice" value="${param.maxPrice != null ? param.maxPrice : (empty sessionScope.maxPrice ? '' : sessionScope.maxPrice)}" />

        <h1>Welcome to Meimei's Mobile Store</h1>
        <h3> User: ${loginUser.fullName}</h3>
        <form action="MainController" method="POST">
            Min Price:
            <input type="number" name="minPrice" value="${minPrice}"/>
            Max Price:
            <input type="number" name="maxPrice" value="${maxPrice}"/>
            <input type="submit" value="PriceSearch" name="btAction"/>
        </form>
        <c:set var="listMobile" value="${requestScope.LIST_MOBILE}" />

        <c:if test="${not empty listMobile and fn:length(listMobile) > 0}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Mobile ID</th>
                        <th>Mobile Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Year of production</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="mobile" items="${listMobile}" varStatus="count">
                        <c:if test="${not mobile.notSale}">
                            <tr>
                                <td>${count.index + 1}</td>
                                <td>${mobile.mobileId}</td>
                                <td>${mobile.mobileName}</td>
                                <td>${mobile.description}</td>
                                <td>${mobile.price}</td>
                                <td>${mobile.yearOfProduction}</td>
                                <td>${mobile.quantity}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
            <form action="MainController" method="POST">
                <select name="cmbMobileName">
                    <c:forEach var="mobile" items="${listMobile}">
                        <c:if test="${not mobile.notSale}">
                            <option value="${mobile.mobileId}-${mobile.mobileName}-${mobile.price}">${mobile.mobileName} - ${mobile.price} $</option>
                        </c:if>
                    </c:forEach>
                </select>
                <select name="cmbQuantity">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="50">50</option>
                </select>
                <input type="hidden" name="minPrice" value="${minPrice}">
                <input type="hidden" name="maxPrice" value="${maxPrice}">
                <input type="submit" name="btAction" value="Add"/>
            </form>
        </c:if>
        <form action="MainController" method="POST">
            <input type="hidden" name="minPrice" value="${minPrice}">
            <input type="hidden" name="maxPrice" value="${maxPrice}">
            <input type="submit" name="btAction" value="View Cart"/>
        </form>
        <c:set var="message" value="${empty requestScope.MESSAGE ? '' : requestScope.MESSAGE}"/>
        <c:set var="minPrice" value="${empty sessionScope.minPrice ? '' : sessionScope.minPrice}"/>
        <c:set var="maxPrice" value="${empty sessionScope.maxPrice ? '' : sessionScope.maxPrice}"/>
        ${message}  

    </body>
</html>
