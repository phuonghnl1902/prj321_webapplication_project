<%-- 
    Document   : user
    Created on : Jan 29, 2019, 10:07:02 PM
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
        <title>User Page</title>
    </head>
    <style>
        body {
            background-color: azure;
        }
        .container {
            width: 60%;
            background-color: white;
            border-radius: 50px;
            margin-top: 150px;
            padding: 80px;
            border:1px solid black;
        }
    </style>
    <body>
        <div class="container">
            <h2>Welcome, <font color='chocolate'>${sessionScope.USER}</font></h2>
            <br/>
            <table class="table table-hover" style="text-align: center">
                <tr>
                    <td>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="username" value="${sessionScope.USER}"/>
                            <input type="hidden" name="action" value="Edit User"/>
                            <input type="submit" value="Edit My Account" class="btn btn-primary" style="width: 200px;"/>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="action" value="Show Tour"/>
                            <input type="submit" value="Booking Tour" class="btn btn-primary" style="width: 200px;"/>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form action="MainController" method="POST">
                            <input type="submit" name="action" value="My Order" class="btn btn-primary" style="width: 200px;"/>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form action="MainController" method="POST">
                            <input type="submit" name="action" value="Logout" class="btn btn-primary" style="width: 200px;"/>
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
