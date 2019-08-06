<%-- 
    Document   : usermng
    Created on : Feb 1, 2019, 9:08:26 PM
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
        <title>User Management</title>
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
    </style>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="admin.jsp">HOME</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="usermng.jsp">User Management</a></li>
                    <li><a href="tourmng.jsp">Tour Management</a></li>
                    <li><a href="newtour.jsp">Create Tour</a></li>
                    <li><a href="orders.jsp">Order List</a></li>
                </ul>
                <form action="MainController" method="POST">
                    <input type="submit" name="action" value="Logout" class="btn btn-danger navbar-btn"/> 
                </form>
            </div>
        </nav>
        <div class="container">
            <h1>User Management</h1>
            <h3>Search</h3>
            <form action="MainController" method="POST" class="form-inline">
                <div class="form-group">
                    <label for="search">Fullname:</label>
                    <input type="text" class="form-control" id="search" name="txtSearch"/>
                    <input type="hidden" name="action" value="Search User"/>
                    <input type="submit" value="Search" class="btn btn-primary"/>
                </div>
            </form>
            <br/>
            <c:if test="${requestScope.INFO != null}">
                <c:if test="${not empty requestScope.INFO}" var="checkList">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>Username</th>
                                <th>Fullname</th>
                                <th>Address</th>
                                <th>Phone</th>
                                <th>Role</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.INFO}" var="dto" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${dto.username}</td>
                                    <td>${dto.fullname}</td>
                                    <td>${dto.address}</td>
                                    <td>${dto.phone}</td>
                                    <td>${dto.role}</td>
                                    <td>
                                        <c:url var="Delete" value="MainController">
                                            <c:param name="action" value="Delete User"/>
                                            <c:param name="id" value="${dto.username}"/>
                                            <c:param name="txtSearch" value="${param.txtSearch}"/>
                                        </c:url> 
                                        <a href="${Delete}">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${!checkList}">
                    No record found
                </c:if>
            </c:if>
        </div>

    </body>
</html>
