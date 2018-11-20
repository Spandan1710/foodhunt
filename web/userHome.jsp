<%@ page import="edu.utdallas.foodhunt.restaurantmanagement.businesslayer.RestaurantService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome User</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/addValidation.js"></script>
    <script src="js/userSearch.js"></script>
    <script src="js/searchJS.js"></script>
    <script src="js/makeReservation.js"></script>
    <script src="js/geoLocation.js"></script>
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
<!--%request.setAttribute("restaurants", new RestaurantService().getRestaurants());%-->
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

            <h2>Search a Restaurant</h2>
            <p>Filter the restaurants using the search field and click on 'Make a Booking'</p>

            <form action="SearchController" method="post">
                <input type="hidden" id="latitude" name="latitude" value=" ">
                <input type="hidden" id="longitude" name="longitude" value=" ">
                <input id="myInput" name="keyword" type="text" placeholder="Keyword" onfocus="geoFindMe()">
                <button value="Search" type="submit">Search</button>
            </form>


            <%
                String msg = "";
                msg = (String) session.getAttribute("resMessage");
                String alertMessage = "";
                String alertClass = "";
                int restaurantId = 0;
                if (msg != null) {
                    if (msg.equalsIgnoreCase("success")) {
                        alertMessage = "Reservation is done successfully.";
                        alertClass = "alert alert-success";
                    }
                    if (msg.equalsIgnoreCase("fail")) {
                        alertMessage = "Unable to book the restaurant.";
                        alertClass = "alert alert-danger";
                        restaurantId = (int) request.getAttribute("restaurantId");
                    }
            %>
            <div class="<%=alertClass%>" role="alert"><%=alertMessage%>
            </div>

            <%
                if (msg.equalsIgnoreCase("fail")) { %>

            <form action="AlternateSearchController" method="post">
                <input type="hidden" id="latitude1" name="latitude" value=" ">
                <input type="hidden" id="longitude1" name="longitude" value=" ">
                <input id="restaurantId" type="hidden"name="restaurantId" value="<%=restaurantId%>">
                <button class="btn btn-success" onmouseenter="geoFindAlternate()" type="submit">Search Similar Restaurant</button>
            </form>



            <% }
                session.removeAttribute("resMessage");
            } else {
                session.setAttribute("resMessage", "");
            }
            %>
            <br><br>

            <table>
                <thead>
                <tr>
                    <th>Restaurant</th>
                    <th>Restaurant Type</th>
                    <th>Book</th>
                </tr>
                </thead>
                <tbody id="myTable">
                <c:if test="${restaurants.size()} == 0">
                    <p><b>No Result Found</b></p>
                </c:if>
                <c:forEach items="${restaurants}" var="restaurant">
                    <tr>
                        <td>
                            <a href="restaurantDetail.jsp?restaurantID=${restaurant.getId()}">${restaurant.getName()}</a>
                        </td>
                        <td>${restaurant.getRestaurantType()}</td>
                        <td>
                            <button type="button" class="btn btn-success" data-toggle="modal"
                                    data-target="#myModalBooking" onclick="modalSet(${restaurant.getId()})">
                                Make a Booking
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


        </div>
        <div class="col-sm-2 sidenav">
            <div class="well">
                <a href="viewOffers.jsp"><span class="glyphicon glyphicon-plus"></span> &nbsp;View Deals and Offers</a>
            </div>
            <div class="well">
                <a href="myBookings.jsp"><span class="glyphicon glyphicon-file"></span> &nbsp;My Bookings</a>
            </div>
            <div class="well">
                <a href="premiumMember.jsp"><span class="glyphicon glyphicon-star"></span> &nbsp;Become a Premium Member</a>
            </div>
            <div class="well">
                <p><span class="glyphicon glyphicon-cog"></span> &nbsp;Edit Account</p>
            </div>
        </div>
    </div>
</div>


<!--Booking Modal -->
<div id="myModalBooking" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Make a Booking </h4>
            </div>
            <div class="modal-body">
                <p>Please fill out the following details to make a booking: </p>

                <div class="row content">
                    <div class="col-sm-2 ">

                    </div>
                    <div class="col-sm-8 text-left">
                        <form id="bookingform" action="MakeReservationController" method="post">
                            <input id="id" type="hidden" name="id">
                            <div class="form-group">
                                <label class="control-label" for="bookingDate">Booking Date:</label>
                                <input type="date" class="form-control" id="bookingDate" name="bookingDate">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="bookingTime">Booking Time:</label>
                                <input type="time" class="form-control" id="bookingTime" name="bookingTime">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="bookingSeats">No of Persons:</label>
                                <input type="text" class="form-control" id="bookingSeats" name="bookingSeats">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="feedback">Feedback:</label>
                                <input type="text" class="form-control" id="feedback" name="feedback">
                            </div>
                            <div class="modal-footer">
                                <button id="Yes" type="submit" class="btn btn-success" data-dismiss="modal">Book
                                </button>

                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            </div>

                        </form>

                    </div>

                    <div class="col-sm-2 ">

                    </div>
                </div>


            </div>

        </div>

    </div>
</div>
<footer class="container-fluid text-center">
    <p>Food Hunt - Copyright &copy; 2018</p>
</footer>
<script>
    $('#myInput').keypress(function (e) {
        if (e.which == 13) {
            $('#search').submit();
        }
    })

    function modalSet(val) {
        $("#myModalBooking #bookingform #id").val(val)
    }

    $("#Yes").click(function (e) {
        $("#bookingform").submit()
    }).done(function () {
        location.reload()
    })


</script>
</body>
</html>
