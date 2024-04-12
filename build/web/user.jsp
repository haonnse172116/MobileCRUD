<%-- 
    Document   : user
    Created on : Apr 9, 2024, 9:37:33 AM
    Author     : Admin
--%>

<%@page import="object.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || 0 != loginUser.getRole()) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>

        <table>
            <tr>
                <td>User ID:</td>
                <td><%= loginUser.getUserId()%></td>
            </tr>
            <tr>
                <td>Full Name:</td>
                <td><%= loginUser.getFullName()%></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><%= loginUser.getPassword()%></td>
            </tr>
        </table>
        <form action="MainController" method="POST">
            <input type="submit" name="btAction" value="Logout"/>
        </form>
        <a href="mobileShop.jsp">Shopping</a></br>
    </body>
</html>
