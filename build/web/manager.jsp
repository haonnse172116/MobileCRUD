<%-- 
    Document   : manager
    Created on : Apr 9, 2024, 9:54:28 AM
    Author     : Admin
--%>

<%@page import="object.MobileDTO"%>
<%@page import="java.util.List"%>
<%@page import="object.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || 0 == loginUser.getRole()) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %> 
        Welcome: <h3><%= loginUser.getFullName()%></h3>   

        <form action="MainController" method="POST">
            <input type="submit" name="btAction" value="Logout"/>
        </form>
        <form action="MainController">
            Search<input type="text" name="search" value="<%= search%>"/>
            <input type="submit" name="btAction" value="Search"/>
        </form>
        <a href="create.jsp">Create new Mobile</a></br>
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
                    <th>notSale</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (MobileDTO mobile : listMobile) {
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td><input type="text" name="mobileId" value="<%= mobile.getMobileId()%>" readonly=""></td>
                    <td><%= mobile.getMobileName()%></td>
                    <td><input type="text" name="description" value="<%= mobile.getDescription()%>" required=""/></td>
                    <td><input type="number" name="price" value="<%= mobile.getPrice()%>" required=""/></td>
                    <td><%= mobile.getYearOfProduction()%></td>
                    <td><input type="number" name="quantity" value="<%= mobile.getQuantity()%>" required=""/></td>
                    <td>
                        <input type="checkbox" name="notSale" value="true" <%= mobile.isNotSale() ? "checked" : ""%> />
                        <input type="hidden" name="notSale" value="false" <%= !mobile.isNotSale() ? "checked" : ""%> />
                    </td>
                    <td><a href="MainController?mobileId=<%= mobile.getMobileId()%>&btAction=Delete&search=<%= search%>">Delete</a></td>
                    <td>
                        <input type="submit" name="btAction" value="Update"/>
                        <input type="hidden" name="search" value="<%= search%>"/>
                    </td>
                </tr>
            </form>
            <% } %>
        </tbody>
    </table>

    <%
        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    %>
    <%= error%>

    <%
            }
        }
    %>

</body>
</html>
