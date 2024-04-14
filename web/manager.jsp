<%-- 
    Document   : manager
    Created on : Apr 9, 2024, 9:54:28 AM
    Author     : Admin
--%>

<%@page import="object.MobileDTO"%>
<%@page import="java.util.List"%>
<%@page import="object.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Page</title>
    </head>
    <body>
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}"/>
        <c:set var="search" value="${empty param.search ? '' : param.search}"/>
        <c:choose>
            <c:when test="${empty loginUser or loginUser.role == 0}">
                <c:redirect url="login.jsp"/>
            </c:when>
            <c:otherwise>
                <h3>Welcome: <c:out value="${loginUser.fullName}"/></h3>
            </c:otherwise>
        </c:choose>

        <form action="MainController" method="POST">
            <input type="submit" name="btAction" value="Logout"/>
        </form>
        <form action="MainController">
            Search<input type="text" name="search" value="${search}"/>
            <input type="submit" name="btAction" value="Search"/>
        </form>
        <!--        <a href="create.jsp">Create new Mobile</a>-->
        <form action="create.jsp" method="POST">
            <button type="submit">Create new Mobile</button>
        </form>
        <c:set var="listMobile" value="${requestScope.LIST_MOBILE}" />
        <c:if test="${not empty listMobile and fn:length(listMobile) > 0}">
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
                    <c:forEach var="mobile" items="${requestScope.LIST_MOBILE}" varStatus="count">
                    <form action="MainController" method="POST">
                        <tr>
                            <td>${count.index + 1}</td>
                            <td><input type="text" name="mobileId" value="${mobile.mobileId}" readonly=""></td>
                            <td>${mobile.mobileName}</td>
                            <td><input type="text" name="description" value="${mobile.description}" required=""/></td>
                            <td><input type="number" name="price" value="${mobile.price}" required=""/></td>
                            <td>${mobile.yearOfProduction}</td>
                            <td><input type="number" name="quantity" value="${mobile.quantity}" required=""/></td>
                            <td>
                                <input type="checkbox" name="notSale" value="true" ${mobile.notSale ? "checked" : ""} />
                                <input type="hidden" name="notSale" value="false" ${!mobile.notSale ? "checked" : ""} />
                            </td>
                            <td>
                                <input type="submit" name="btAction" value="Delete"/>
                                <input type="hidden" name="search" value="${search}"/>
                                <input type="hidden" name="mobileId" value="${mobile.mobileId}"/>
                            </td>
                            <td>
                                <input type="submit" name="btAction" value="Update"/>
                                <input type="hidden" name="search" value="${search}"/>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:set var="error" value="${empty requestScope.ERROR ? '' : requestScope.ERROR}"/>
    <c:out value="${error}"/>

</body>
</html>