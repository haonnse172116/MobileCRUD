<%-- 
    Document   : mobileShop
    Created on : Apr 12, 2024, 9:40:11 PM
    Author     : Admin
--%>

<%@page import="object.UserDTO"%>
<%@page import="object.MobileDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
    </head>
    
    <body>
      
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String minPrice = request.getParameter("minPrice");
            String maxPrice = request.getParameter("maxPrice");
            if (minPrice == null) {
                minPrice = "";
            }
            if (maxPrice == null) {
                maxPrice = "";
            }
        %>
        <h1>Welcome to Meimei's Mobile Store</h1>
        <h3> User: <%=loginUser.getFullName()%></h3>
        <form action="MainController">
            Min Price:
            <input type="number" name="minPrice" value="<%= minPrice%>"/>
            Max Price:
            <input type="number" name="maxPrice" value="<%= maxPrice%>"/>
            <input type="submit" value="PriceSearch" name="btAction"/>
        </form>
        <%
            List<MobileDTO> listMobile = (List) request.getAttribute("LIST_MOBILE");

            if (listMobile != null) {
                if (listMobile.size() > 0) {
        %>

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
            <% int count = 1;
            for (MobileDTO mobile : listMobile) { %>
            <tr>
                <td><%= count++ %></td>
                <td><%= mobile.getMobileId() %></td>
                <td><%= mobile.getMobileName() %></td>
                <td><%= mobile.getDescription() %></td>
                <td><%= mobile.getPrice() %></td>
                <td><%= mobile.getYearOfProduction() %></td>
                <td><%= mobile.getQuantity() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
<form action="MainController" method="POST">
    <select name="cmbMobileName">
        <%
            for (MobileDTO mobile : listMobile) {
        %>
        <option value="<%= mobile.getMobileId() + "-" + mobile.getMobileName() + "-" + mobile.getPrice() %>"><%= mobile.getMobileName() %> - <%= mobile.getPrice() %> $</option>
        <%
            }
        %>
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
    <input type="submit" name="btAction" value="Add"/>
</form>

    <%
            }
        }
    %>
        <form action="MainController" method="POST">
            <input type="submit" name="btAction" value="View Cart"/>
    </form>
  <%
      String message = (String) request.getAttribute("MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <%= message %>
        
</body>
</html>
