<%-- 
    Document   : user
    Created on : Apr 9, 2024, 9:37:33 AM
    Author     : Admin
--%>

<%@page import="object.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
         <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />
        <c:if test="${empty loginUser or loginUser.role != 0}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <table>
            <tr>
                <td>User ID:</td>
                <td>${loginUser.userId}</td>
            </tr>
            <tr>
                <td>Full Name:</td>
                <td>${loginUser.fullName}</td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>${loginUser.password}</td>
            </tr>
        </table>
        <form action="MainController" method="POST">
            <input type="submit" name="btAction" value="Logout"/>
        </form><br/>
        <form action="mobileShop.jsp" >
            <input type="submit" value="Shopping">
    </form>
    </body>
</html>
