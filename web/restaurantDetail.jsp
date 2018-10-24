<%@ page import="edu.utdallas.foodhunt.restaurantmanagement.businesslayer.RestaurantService" %>
<%@ page import="edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Restaurant" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%
String restaurantID ="";
Restaurant restaurant=null;
if(request.getParameter("restaurantID")!= null){
    restaurantID = request.getParameter("restaurantID");
    RestaurantService restaurantService=new RestaurantService();
    restaurant=restaurantService.getRestaurant(restaurantID);
}
%>
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

<div class="container-fluid text-center">
    <div class="row content">
        <div class="col-sm-2 sidenav">

        </div>
        <div class="col-sm-8 text-left">

            <br/>
            <div class="row">
                <div class="col-md-4 img">
                    <img src="images/<%=restaurant.getPictureUrl()%>"
                         alt="" class="img-rounded" height="400px" width="400px">
                </div>
                <div class="col-md-8 details">
                    <blockquote>
                        <h5><%=restaurant.getName()%></h5>
                    </blockquote>
                    <p>

                    <table class="table table-striped">

                        <tbody>
                        <tr>
                            <td>Restaurant Type :</td>
                            <td><%=restaurant.getRestaurantType()%></td>
                        </tr>
                        <tr>
                            <td>Food Rating :</td>
                            <td><%=restaurant.getFoodRating()%></td>
                        </tr>
                        <tr>
                            <td>Accessibility Rating :</td>
                            <td><%=restaurant.getAccessibilityRating()%></td>
                        </tr>
                        <tr>
                            <td>Ambience Rating :</td>
                            <td><%=restaurant.getAmbienceRating()%></td>
                        </tr>
                        <tr>
                            <td>Overall Rating :</td>
                            <td><%=restaurant.getOverallRating()%></td>
                        </tr>
                        <tr>
                            <td>Opening Time :</td>
                            <td><%=restaurant.getOpenTime()%></td>
                        </tr>
                        <tr>
                            <td>Closing Time :</td>
                            <td><%=restaurant.getCloseTime()%></td>
                        </tr>
                        </tbody>
                    </table>

                    </p>
                </div>
            </div>
            <br>
            <br>
            <%
                String userType="";
                if(session.getAttribute("userName")!=null) {
                    userType = (String) session.getAttribute("userName");
                }

                if(userType.equalsIgnoreCase("admin")){
            %>
            <a type="button" href="adminHome.jsp" class="btn btn-danger btn-lg">Go Back</a>
            <%}
            else{%>
            <a type="button" href="userHome.jsp" class="btn btn-danger btn-lg">Go Back</a>
            <%}%>

        </div>
        <div class="col-sm-2 sidenav">


        </div>
    </div>
</div>


<footer class="container-fluid text-center">
    <p>Food Hunt - Copyright &copy; 2018</p>
</footer>

</body>
</html>
