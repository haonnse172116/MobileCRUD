<%-- 
    Document   : create
    Created on : Apr 12, 2024, 9:00:36 AM
    Author     : Admin
--%>

<%@page import="object.MobileErr"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new Mobile Page</title>
    </head>
    <body>
        <c:set var="mobileErr" value="${requestScope.MOBILE_ERROR}"/>
        <c:choose>
            <c:when test="${empty mobileErr}">
                <c:set var="mobileErr" value="<%= new MobileErr()%>"/>
            </c:when>
        </c:choose>
        <h1>Input new mobile's information</h1>
        <form action="MainController" method="POST">
            <table>
                <tr>
                    <td>Mobile ID</td>
                    <td><input type="text" name="mobileId" required=""></td>
                    <td><c:out value="${mobileErr.mobileId}"/></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="description" required=""></td>
                    <td><c:out value="${mobileErr.description}"/></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="number" name="price" required=""></td>
                    <td><td><c:out value="${mobileErr.price}"/></td>
                </tr>
                <tr>
                    <td>Mobile Name</td>
                    <td><input type="text" name="mobileName" required=""></td>
                    <td><c:out value="${mobileErr.mobileName}"/></td>
                </tr>
                <tr>
                    <td>Production Year</td>
                    <td><input type="number" name="yearOfProduction" required=""></td>
                    <td><c:out value="${mobileErr.yearOfProduction}"/></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="number" name="quantity" required=""></td>
                    <td><c:out value="${mobileErr.quantity}"/></td>
                </tr>
            </table>
            <input type="submit" name="btAction" value="Create">
            <input type="reset" value="Reset">
        </form>
    </body>
</html>
