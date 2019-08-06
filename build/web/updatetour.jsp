<%-- 
    Document   : updatetour
    Created on : Mar 2, 2019, 9:40:03 PM
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
        <title>Edit Tour</title>
    <a href="updatetour.jsp"></a>
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
        width: 130px;
    }
    .col-sm-10 {
        width: 500px;
    }
    .form-control {
        line-height: auto;
    }
</style>
<body>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="admin.jsp">HOME</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="usermng.jsp">User Management</a></li>
                <li class="active"><a href="tourmng.jsp">Tour Management</a></li>
                <li><a href="newtour.jsp">Create Tour</a></li>
                <li><a href="orders.jsp">Order List</a></li>
            </ul>
            <form action="MainController" method="POST">
                <input type="submit" name="action" value="Logout" class="btn btn-danger navbar-btn"/> 
            </form>
        </div>
    </nav>
    <div class="container">
        <h1>Update Tour</h1>
        <br/>
        <form action="MainController" method="POST" class="form-horizontal">
            <%-- Id --%>
            <div class="form-group">
                <label class="control-label col-sm-2" for="tourid">Tour ID:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="tourid" name="txtId" value="${requestScope.DTO.id}" readonly="true"/>
                </div>
            </div>

            <%-- Name --%>
            <div class="form-group">
                <label class="control-label col-sm-2" for="tourname">Tour Name:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="tourname" name="txtName" value="${requestScope.DTO.name}" required/>
                    <font color="red">
                    ${requestScope.INVALID.nameErr}
                    </font>
                </div>
            </div>

            <%-- Start date --%>
            <div class="form-group">
                <label class="control-label col-sm-2" for="start">Start:</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control" id="start" name="txtStart" value="${requestScope.DTO.dateStart}" required/>
                    <font color="red">
                    ${requestScope.INVALID.dateStartErr}
                    </font>
                </div>
            </div>

            <%-- End date  --%>
            <div class="form-group">
                <label class="control-label col-sm-2" for="end">End:</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control" id="end" name="txtEnd" value="${requestScope.DTO.dateEnd}" required/>
                    <font color="red">
                    ${requestScope.INVALID.dateEndErr}
                    </font>
                </div>
            </div>

            <%-- Des  --%>
            <div class="form-group">
                <label class="control-label col-sm-2" for="des">Description:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="des" name="txtDes" value="${requestScope.DTO.des}" required/>
                    <font color="red">
                    ${requestScope.INVALID.desErr}
                    </font>
                </div>
            </div>

            <%-- Max Seat  --%>
            <div class="form-group">
                <label class="control-label col-sm-2" for="seat">Max seat:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="seat" name="txtSeat" value="${requestScope.DTO.maxSeat}" max="100" min="0" required/>
                    <font color="red">
                    ${requestScope.INVALID.maxSeatErr}
                    </font>
                </div>
            </div>

            <%-- Price --%>
            <div class="form-group">
                <label class="control-label col-sm-2" for="price">Price:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="price" name="txtPrice" value="${requestScope.DTO.price}" min="1" max="10000" required/>
                    <font color="red">
                    ${requestScope.INVALID.priceErr}
                    </font>
                </div>
            </div>

            <%-- Button  --%>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10" style="margin-left: 300px">
                    <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                    <input type="hidden" name="action" value="Update Tour"/>
                    <input type="submit" value="Update" class="btn btn-primary"/>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
