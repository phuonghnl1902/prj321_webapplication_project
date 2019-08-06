<%-- 
    Document   : viewcart
    Created on : Mar 14, 2019, 10:49:20 AM
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
        <title>My Cart</title>
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
            <h1>${sessionScope.USER}'s Cart</h1>
            <c:set var="Cart" value="${sessionScope.CART}"/>
            <form action="MainController" method="POST">
                <c:if test="${not empty Cart}">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>Tour ID</th>
                                <th>Tour Name</th>
                                <th>Start</th>
                                <th>End</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cart" items="${Cart.cart.values()}" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${cart.tour.id}</td>
                                    <td>${cart.tour.name}</td>                                
                                    <td>${cart.tour.dateStart}</td>
                                    <td>${cart.tour.dateEnd}</td>
                                    <td>
                                        <input type="number" name="txtQuan" min="1" max="60" value="${cart.quantity}"/>
                                        <input type="hidden" name="txtId" value="${cart.tour.id}"/>
                                    </td>
                                    <td>${cart.tour.price}</td>
                                    <td>
                                        <c:url var="Remove" value="MainController">
                                            <c:param name="action" value="Remove"/>
                                            <c:param name="id" value="${cart.tour.id}"/>
                                        </c:url>
                                        <a href="${Remove}">Remove</a>
                                    </td>
                                </tr>
                            </c:forEach>

                            <tr>
                                <td colspan="5">
                                    <a href="ShowTourController">Continue shopping</a>
                                </td>
                                <td>
                                    <input type="submit" name="action" value="Update Quantity"/>
                                </td>
                                <td colspan="2">Total:${Cart.getTotal()}</td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="submit" name="action" value="Check Out"/>
                    ${requestScope.INVALID}
                </c:if>
            </form>
        </div>
    </body>
</html>
