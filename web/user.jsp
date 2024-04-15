<%@page import="object.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Page</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        table {
            border-collapse: collapse;
            width: 50%;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        td, th {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        td:first-child {
            width: 150px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            margin-right: 10px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
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