<%-- 
    Document   : login.jsp
    Created on : Apr 9, 2024, 9:17:12 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h2>Mobile Management</h2>
         <form action="MainController" method="POST">
    <table>
        <tr>
            <td>User ID:</td>
            <td><input type="text" name="userId" required=""/></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="password" name="password" required=""/></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Login" name="btAction" />
                <input type="reset" value="Reset"/>
            </td>
        </tr>
    </table>
</form>
        <% 
            String error= (String)request.getAttribute("ERROR");
            if(error== null) error= "";
        %>
         <h1><%= error %></h1>
    </body>
</html>
