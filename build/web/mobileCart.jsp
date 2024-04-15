<%-- 
    Document   : mobileCart
    Created on : Apr 9, 2024, 7:05:06 PM
    Author     : Admin
--%>

<%@page import="object.UserDTO"%>
<%@page import="object.MobileDTO"%>
<%@page import="object.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mobile Cart Page</title>
         <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        input[type="text"],
        input[type="number"] {
            padding: 8px;
            margin: 5px 0;
            width: calc(100% - 16px);
            box-sizing: border-box; 
        }

        input[type="submit"],
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            margin-right: 10px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover,
        button:hover {
            background-color: #45a049;
        }

        h1 {
            color: #333;
            margin-top: 20px;
        }

        .total {
            margin-top: 20px;
        }

    </style>
    </head>
    <body>
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}"/>
        <c:if test="${!empty loginUser}">
            <c:set var="userId" value="${loginUser.userId}"/>
            <c:set var="USER_ID" value="${userId}" scope="session" />
        </c:if>
        <c:set var="cart" value="${sessionScope.CART}"/>
        <c:if test="${!empty cart}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Mobile ID</th>
                        <th>Mobile Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Change</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="total" value="0"/>
                    <c:forEach var="mobile" items="${cart.cart}" varStatus="count">
                        <c:set var="total" value="${total + (mobile.value.price * mobile.value.quantity)}"/>
                    <form action="MainController" method="POST">
                        <tr>
                            <td>${count.index + 1}</td>
                            <td><input type="text" name="mobileId" value="${mobile.value.mobileId}" readonly=""/></td>
                            <td>${mobile.value.mobileName}</td>
                            <td><input type="number" min="1" name="quantity" value="${mobile.value.quantity}" required=""/></td>
                            <td>${mobile.value.price}</td>
                            <td>${Math.round(mobile.value.price * mobile.value.quantity)}$</td>
                            <td><input type="submit" name="btAction" value="Change"/></td>
                            <td><input type="submit" name="btAction" value="Remove"/></td>
                        </tr>
                    </form>
                </c:forEach>
            </tbody>
        </table>             
        <c:set var="roundedTotal" value="${Math.round(total)}"/>
        <fmt:formatNumber var="formattedTotal" value="${roundedTotal}" pattern="#,##0"/>
        
        <h1>Total: ${formattedTotal}$</h1>
        <c:set var="TOTAL" value="${total}" scope="session"/>
        <form action="MainController" method="POST">
            <input type="submit" name="btAction" value="Save Cart"/>
        </form><br/>      
    </c:if>
    <c:set var="message" value="${empty requestScope.MESSAGE ? '' : requestScope.MESSAGE}"/>
    <c:set var="minPrice" value="${empty sessionScope.minPrice ? '' : sessionScope.minPrice}"/>
    <c:set var="maxPrice" value="${empty sessionScope.maxPrice ? '' : sessionScope.maxPrice}"/>
    ${message}  
    <form action="MainController" method="POST">
        <input type="hidden" name="minPrice" value="${minPrice}">
        <input type="hidden" name="maxPrice" value="${maxPrice}">
        <input type="hidden" name="btAction" value="PriceSearch">
        <button type="submit">Add more</button>
    </form>
</html>
