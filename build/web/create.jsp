<%-- 
    Document   : create
    Created on : Apr 12, 2024, 9:00:36 AM
    Author     : Admin
--%>

<%@page import="object.MobileErr"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new Mobile Page</title>
    </head>
    <body>
        <%
            MobileErr mobileErr= (MobileErr)request.getAttribute("MOBILE_ERROR");
            if(mobileErr== null){
                mobileErr= new MobileErr();
            }
        %>
        <h1>Input new mobile's information</h1>
        <form action="MainController" method="POST">
    <table>
        <tr>
            <td>Mobile ID</td>
            <td><input type="text" name="mobileId" required=""></td>
            <td><%= mobileErr.getMobileId()%></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><input type="text" name="description" required=""></td>
            <td><%= mobileErr.getDescription()%></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><input type="number" name="price" required=""></td>
            <td><td><%= mobileErr.getPrice() %></td>
        </tr>
        <tr>
            <td>Mobile Name</td>
            <td><input type="text" name="mobileName" required=""></td>
            <td><%= mobileErr.getMobileName()%></td>
        </tr>
        <tr>
            <td>Production Year</td>
            <td><input type="number" name="yearOfProduction" required=""></td>
            <td><%= mobileErr.getYearOfProduction()%></td>
        </tr>
        <tr>
            <td>Quantity</td>
            <td><input type="number" name="quantity" required=""></td>
            <td><%= mobileErr.getQuantity()%></td>
        </tr>
    </table>
    <input type="submit" name="btAction" value="Create">
    <input type="reset" value="Reset">
</form>
    </body>
</html>
