<%-- 
    Document   : myorder
    Created on : Mar 16, 2019, 10:36:43 PM
    Author     : User
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>My Order</title>
    </head>
    <style>
        body {
            background-color: azure;
        }
        .container {
            width: 80%;
            margin-top: 100px;
            background-color: white;
            border-radius: 50px;
            padding: 40px;
            border: 1px solid black;
        }
        li {
            margin-right: 10px;
            margin-top: 7px;
        }
    </style>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="user.jsp">HOME</a>
                </div>
                <ul class="nav navbar-nav">
                    <li>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="username" value="${sessionScope.USER}"/>
                            <input type="hidden" name="action" value="Edit User"/>
                            <input type="submit" value="Edit Account" class="btn btn-primary" style="width: 100px;"/>
                        </form>
                    </li>
                    <li>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="action" value="Show Tour"/>
                            <input type="submit" value="Book Tour" class="btn btn-primary" style="width: 100px;"/>
                        </form>
                    </li>
                    <li>
                        <form action="MainController" method="POST">
                            <input type="submit" name="action" value="My Order" class="btn btn-primary" style="width: 100px;"/>
                        </form>
                    </li>
                </ul>

                <form action="MainController" method="POST">
                    <input type="submit" name="action" value="Logout" class="btn btn-danger navbar-btn" style="width: 100px; margin-right: 10px"/> 
                </form>
            </div>
        </nav>
        <div class="container">
            <h1>${sessionScope.USER}'s Order</h1>
            <c:if test="${requestScope.ORDER != null}">
                <c:if test="${not empty requestScope.ORDER}" var="checkData">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>Order ID</th>
                                <th>Tour ID</th>
                                <th>Tour Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Buy Date</th>
                                <th>Status</th>
                                <th>Cancel</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.ORDER}" var="dto" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${dto.id}</td>
                                    <td>${dto.tourid}</td>      
                                    <td>${dto.name}</td>
                                    <td>${dto.quan}</td>
                                    <td>${dto.price}</td>
                                    <td>${dto.date}</td>
                                    <td>${dto.status}</td>
                                    <td>
                                        <c:if test="${dto.status eq 'Proceed'}">
                                            <c:url value="MainController" var="Cancel">
                                                <c:param name="id" value="${dto.id}"/>
                                                <c:param name="tourid" value="${dto.tourid}"/>
                                                <c:param name="quan" value="${dto.quan}"/>
                                                <c:param name="action" value="Cancel"/>
                                            </c:url>
                                            <a href="${Cancel}">Cancel</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${!checkData}">
                    No record found
                </c:if>
            </c:if>
        </div>
    </body>
</html>
