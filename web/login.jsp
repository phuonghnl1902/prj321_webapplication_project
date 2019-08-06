<%-- 
    Document   : login
    Created on : Jan 29, 2019, 9:43:19 PM
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
        <title>Login</title>
    </head>
    <style>
        body {
            background-color: azure;
        }
        .container {
            width: 40%;
            margin-top: 150px;
            background-color: white;
            border-radius: 50px;
            padding: 80px;
            border: 1px solid black;
        }
    </style>
    <body>
        <div class="container">
            <h2>Sign In</h2>
            <form action="MainController" method="POST">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" name="txtUsername" class="form-control" id="username" placeholder="Enter username" required/>
                    <font color="red">
                    ${requestScope.INVALID.usernameErr}
                    </font>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="txtPassword" class="form-control" id="password" placeholder="Enter password" required/>
                    <font color="red">
                    ${requestScope.INVALID.passwordErr}
                    </font>
                </div>
                <input type="submit" class="btn btn-primary" name="action" value="Login"/>
            </form>
            <br/>
            Don't have an account? <a href="register.jsp">Create new Account</a>
        </div>
    </body>
</html>
