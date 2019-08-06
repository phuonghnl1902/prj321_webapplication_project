<%-- 
    Document   : admin
    Created on : Jan 29, 2019, 10:06:45 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Admin Page</title>
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
                    <td><a href="usermng.jsp">Users Management</a></td>
                </tr>
                <tr>
                    <td><a href="tourmng.jsp">Tours Management</a></td>
                </tr>
                <tr>
                    <td><a href="newtour.jsp">Create Tour</a></td>
                </tr>
                <tr>
                    <td><a href="orders.jsp">Order List</a></td>
                </tr>
                <tr>
                    <td>
                        <form action="MainController" method="POST">
                            <input type="submit" name="action" value="Logout" class="btn btn-primary" style="width: 150px"/> 
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
