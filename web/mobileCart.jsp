<%-- 
    Document   : mobileCart
    Created on : Apr 9, 2024, 7:05:06 PM
    Author     : Admin
--%>

<%@page import="object.UserDTO"%>
<%@page import="object.MobileDTO"%>
<%@page import="object.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mobile Cart Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser != null) {
                String userId = loginUser.getUserId();
                session.setAttribute("userId", userId);
            }
        %>
        <% 
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if (cart != null) {
        %>
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
                <%
                    int count = 1;
                    double total = 0;
                    for (MobileDTO mobile : cart.getCart().values()) {
                        total += mobile.getPrice() * mobile.getQuantity();
                        session.setAttribute("total", total);
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td> 
                        <input type="text" name="mobileId" value="<%= mobile.getMobileId()%>" readonly=""/>
                    </td>
                    <td><%= mobile.getMobileName()%></td>
                    <td>
                        <input type="number" min="1" name="quantity" value="<%= mobile.getQuantity()%>" required=""/>
                    </td>
                    <td><%= mobile.getPrice()%>$</td>
                    <td><%= mobile.getPrice() * mobile.getQuantity()%>$</td>
                    <td>
                        <input type="submit" name="btAction" value="Change"/>
                    </td>
                    <td>
                        <input type="submit" name="btAction" value="Remove"/>
                    </td>
                </tr>
            </form>

            <%
                }
            %>

        </tbody>
    </table>

    <h1>Total:<%= total%> $  </h1>
    <form action="MainController" method="POST">
        <input type="submit" name="btAction" value="Save Cart"/>
    </form>
    <%
        }
    %>
       <%
      String message = (String) request.getAttribute("MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <%= message %>
    </br>
    <a href="mobileShop.jsp">Add more</a><br/>
 
</html>
