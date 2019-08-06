<%-- 
    Document   : showtour
    Created on : Mar 4, 2019, 8:20:58 PM
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
        <title>Booking</title>
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
                    <input type="submit" name="action" value="My Cart" class="btn btn-warning" style="width: 100px; margin-left: 800px"/>
                </form>

            </div>
        </nav>
        <div class="container">
            <h1>Booking Tour</h1>
            <br/>
            <c:if test="${requestScope.DATA != null}">
                <c:if test="${not empty requestScope.DATA}" var="checkData">
                    <table class="table table-hover">
                        <c:forEach items="${requestScope.DATA}" var="dto">
                            <tr>
                                <td>
                                    <img src="img/test.jpg" width="400px" height="250px">
                                </td>
                                <td style="width: 500px; padding-top: 50px">
                                    <div>
                                        Tour ID: ${dto.id} <br/>
                                        Tour Name: ${dto.name} <br/>
                                        Start: ${dto.dateStart} <br/>
                                        End: ${dto.dateEnd} <br/>
                                        Description: ${dto.des} <br/>
                                        Seat: ${dto.maxSeat} <br/>
                                        Price: ${dto.price} <br/>
                                    </div>
                                </td>
                                <td style="width: 200px ;vertical-align: middle">
                                    <form action="MainController" method="POST">
                                        <input type="hidden" name="id" value="${dto.id}"/>
                                        <input type="hidden" name="name" value="${dto.name}"/>
                                        <input type="hidden" name="price" value="${dto.price}"/>
                                        <input type="hidden" name="start" value="${dto.dateStart}"/>
                                        <input type="hidden" name="end" value="${dto.dateEnd}"/>
                                        <input type="hidden" name="action" value="Add Cart"/>
                                        <input type="submit" value="Add to Cart" class="btn btn-success" style="width: 100px; height: 50px; font-size: 15px;"/>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
                <c:if test="${!checkData}">
                    No record found
                </c:if>
            </c:if>
        </div>
    </body>
</html>
