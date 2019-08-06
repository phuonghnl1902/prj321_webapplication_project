<%-- 
    Document   : register
    Created on : Jan 29, 2019, 10:30:03 PM
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
        <title>Register</title>
    </head>
    <style>
        body {
            background-color: azure;
        }
        .container {
            width: 50%;
            margin-top: 80px;
            background-color: white;
            border-radius: 50px;
            padding: 40px;
            border: 1px solid black;
        }
        .control-label {
            width: 200px;
        }
        .col-sm-10 {
            width: 500px;
        }
    </style>
    <body>
        <div class="container">
            <h1>Create new Account</h1>
            <br/>
            <form action="MainController" method="POST" class="form-horizontal">
                <%-- Username --%>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="username">Username:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="username" placeholder="Enter username" name="txtUsername" value="${param.txtUsername}" required/>
                        <font color="red">
                        ${requestScope.INVALID.usernameErr}
                        </font>
                    </div>
                </div>

                <%-- Password --%>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="password">Password:</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password" placeholder="Enter password" name="txtPassword" required/>
                        <font color="red">
                        ${requestScope.INVALID.passwordErr}
                        </font>
                    </div>
                </div>

                <%-- Confirm password --%>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="confirm">Confirm password:</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="confirm" placeholder="Enter confirm password" name="txtConfirm" required/>
                        <font color="red">
                        ${requestScope.INVALID.confirmErr}
                        </font>
                    </div>
                </div>

                <%-- Fullname  --%>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="fullname">Fullname:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="fullname" placeholder="Enter fullname" name="txtFullname" value="${param.txtFullname}" required/>
                        <font color="red">
                        ${requestScope.INVALID.fullnameErr}
                        </font>
                    </div>
                </div>

                <%-- Address  --%>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="address">Address:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="address" placeholder="Enter address" name="txtAddress" value="${param.txtAddress}" required/>
                        <font color="red">
                        ${requestScope.INVALID.addressErr}
                        </font>
                    </div>
                </div>

                <%-- Phone number  --%>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="phone">Phone number:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="phone" placeholder="Enter phone number" name="txtPhone" value="${param.txtPhone}" required/>
                        <font color="red">
                        ${requestScope.INVALID.phoneErr}
                        </font>
                    </div>
                </div>
                <br/>

                <%-- Button  --%>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10" style="margin-left: 300px">
                        <input type="submit" name="action" value="Register" class="btn btn-primary"/>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
