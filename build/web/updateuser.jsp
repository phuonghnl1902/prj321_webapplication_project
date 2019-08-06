<%-- 
    Document   : updateuser
    Created on : Mar 4, 2019, 8:32:52 PM
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
        <title>Edit Profile</title>
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
            width: 180px;
        }
        .col-sm-10 {
            width: 500px;
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
            <h1>Edit my Account</h1>
            <br/>
            <form action="MainController" method="POST" class="form-horizontal">
                <%-- Username --%>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="username">Username:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="username" name="txtUsername" value="${requestScope.DTO.username}" readonly="true"/>
                    </div>
                </div>

                <%-- Fullname  --%>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="fullname">Fullname:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="fullname" name="txtFullname" value="${requestScope.DTO.fullname}" required/>
                        <font color="red">
                        ${requestScope.INVALID.fullnameErr}
                        </font>
                    </div>
                </div>

                <%-- Address  --%>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="address">Address:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="address" name="txtAddress" value="${requestScope.DTO.address}" required/>
                        <font color="red">
                        ${requestScope.INVALID.addressErr}
                        </font>
                    </div>
                </div>

                <%-- Phone number  --%>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="phone">Phone number:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="phone" name="txtPhone" value="${requestScope.DTO.phone}" required/>
                        <font color="red">
                        ${requestScope.INVALID.phoneErr}
                        </font>
                    </div>
                </div>
                <br/>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10" style="margin-left: 300px">
                        <input type="hidden" name="action" value="Update User"/>
                        <input type="submit" value="Update" class="btn btn-primary"/>
                    </div>
                </div>
            </form>
        </div>    

    </div>
</body>
</html>
