<%-- 
    Document   : success
    Created on : Mar 16, 2019, 10:10:29 PM
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
        <title>Thank You</title>
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
            <h1 style="text-align: center">Thank You ${sessionScope.USER}</h1>
        </div>
    </body>
</html>
