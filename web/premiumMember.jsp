<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Premium Member</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/addValidation.js"></script>
    <script src="js/userSearch.js"></script>
    <script src="js/searchJS.js"></script>
    <script src="js/makeReservation.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {
            height: 450px
        }

        /* Set gray background color and 100% height */
        .sidenav {
            padding-top: 20px;
            background-color: #f1f1f1;
            height: 135%;
        }

        /* Set black background color, white text and some padding */
        footer {
            background-color: #555;
            color: white;
            padding: 15px;
        }

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }

            .row.content {
                height: auto;
            }
        }

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>

</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">FoodHunt</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="userHome.jsp">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid text-center">
    <div class="row content">
        <div class="col-sm-2 sidenav">

        </div>
        <div class="col-sm-8 text-left">

            <h2>Please fill out the following details to become a premium member: </h2>

            <div class="row content">
                <div class="col-sm-8 text-left">
                    <form id="premiumform" action="AddMembershipController" method="post">
                        <div class="form-group">
                            <label class="control-label" for="cardType">Payment Card Type:</label>
                            <input type="text" class="form-control" id="cardType" name="cardType">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="card">Card Number:</label>
                            <input type="text" class="form-control" id="card" name="card">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="exDate">Expiry Date</label>
                            <input type="date" class="form-control" id="exDate" name="exDate">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="cvv">Security code:</label>
                            <input type="text" class="form-control" id="cvv" name="cvv">
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Submit</button>
                            <button type="button" class="btn btn-default">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-sm-2 sidenav">
            <div class="well">
                <a href="viewOffers.jsp"><span class="glyphicon glyphicon-plus"></span> &nbsp;View Deals and Offers</a>
            </div>
            <div class="well">
                <a href="myBookings.jsp"><span class="glyphicon glyphicon-file"></span> &nbsp;My Bookings</a>
            </div>
            <div class="well">
                <a href=""><span class="glyphicon glyphicon-star"></span> &nbsp;Become a Premium Member</a>
            </div>
            <div class="well">
                <p><span class="glyphicon glyphicon-cog"></span> &nbsp;Edit Account</p>
            </div>
        </div>
    </div>
</div>

<footer class="container-fluid text-center">
    <p>Food Hunt - Copyright &copy; 2018</p>
</footer>

</body>
</html>