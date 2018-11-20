<%@ page import="edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Restaurant" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.utdallas.foodhunt.restaurantmanagement.businesslayer.RestaurantService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome Admin</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/addValidation.js"></script>
    <script src="js/userSearch.js"></script>
    <script src="js/searchJS.js"></script>
    <script src="js/geoLocation.js"></script>

    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        /* Add a gray background color and some padding to the footer */
        footer {
            background-color: #555;
            color: white;
            padding: 25px;
        }

        .carousel-inner img {
            width: 48%; /* Set width to 100% */
            margin: auto;
            min-height: 110px;
            max-height: 380px;
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

        /* Hide the carousel text when the screen is less than 600 pixels wide */
        @media (max-width: 600px) {
            .carousel-caption {
                display: none;
            }
        }
    </style>
</head>
<body>

<%request.setAttribute("restaurants", new RestaurantService().getRestaurants());%>
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
                <li class="active"><a href="adminHome.jsp">Home</a></li>
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

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="images/img1.jpg" alt="Image">
            <div class="carousel-caption">

            </div>
        </div>

        <div class="item">
            <img src="images/img2.jpg" alt="Image">
            <div class="carousel-caption">

            </div>
        </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<input type="hidden" id="latitude" value =" ">
<input type="hidden" id="longitude" value =" ">


<div class="container text-center">
    <br>
    <div class="row">
        <div class="col-sm-9">
            <p>Filter the restaurants using the search field</p>
            <input id="myInput" type="text" placeholder="keyword">
            <button value="Search" onclick="geoFindMe();">Search</button>
            <br/><br/>
            <table id="table">
                <thead>
                <tr>
                    <th>Restaurant</th>
                    <th>Restaurant Type</th>
                    <th>Modify</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody id="myTable">
                <c:forEach items="${restaurants}" var="restaurant">
                    <tr>
                        <td>
                            <a href="restaurantDetail.jsp?restaurantID=${restaurant.getId()}">${restaurant.getName()}</a>
                        </td>
                        <td>${restaurant.getRestaurantType()}</td>
                        <td><a type="button" class="btn btn-warning"
                               href="modifyRestaurant.jsp?id=${restaurant.getId()}">Modify Restaurant</a></td>
                        <td>
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"
                                    onclick="modalSet(${restaurant.getId()})">Delete
                                Restaurant
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


        </div>

        <div class="col-sm-3">
            <br/><br/><br/><br/>
            <div class="well">
                <a href="addRestaurant.jsp"><span class="glyphicon glyphicon-plus"></span> &nbsp;Add a Restaurant</a>
            </div>

            <div class="well">
                <a href="addDeals.jsp"><span class="glyphicon glyphicon-plus"></span> &nbsp;Add Deals and Offers</a>
            </div>
            <div class="well">
                <a href="viewOffers.jsp"><span class="glyphicon glyphicon-plus"></span> &nbsp;View Deals and Offers</a>
            </div>
            <div class="well">
                <p><span class="glyphicon glyphicon-cog"></span> &nbsp;Edit Account</p>
            </div>

        </div>
    </div>
</div>
<br>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Confirm Delete</h4>
            </div>
            <div class="modal-body">

                <p>Are you sure you want to Delete this Restaurant?</p>


            </div>

            <div class="modal-footer">
                <button id="Yes" type="button" class="btn btn-success" data-dismiss="modal">Yes</button>

                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
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
        $("#myModal #Yes").attr("href", "DeleteRestaurantController?id=" + val)
    }

    $("#Yes").click(function (e) {
        $.ajax({
            type: "POST",
            url: $("#Yes").attr("href")
        }).done(function () {
            location.reload()
        })
    })

</script>
</body>
</html>
