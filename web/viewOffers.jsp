<%@ page import="edu.utdallas.foodhunt.restaurantmanagement.businesslayer.RestaurantService" %>
<%@ page import="edu.utdallas.foodhunt.dealsandoffers.businesslayer.DealService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Offers</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
<%

    request.setAttribute("memberType", session.getAttribute("isUserPremium"));
    request.setAttribute("user", session.getAttribute("userName"));
    request.setAttribute("deals", new DealService().getDeals(session.getAttribute("userName").toString(), Boolean.parseBoolean(session.getAttribute("isUserPremium").toString())));
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
                <%
                    String userType = "";
                    if (session.getAttribute("userName") != null) {
                        userType = (String) session.getAttribute("userName");
                    }
                    if (userType.equalsIgnoreCase("admin")) {
                %>
                <li class="active"><a href="adminHome.jsp">Home</a></li>
                <%} else {%>
                <li class="active"><a href="userHome.jsp">Home</a><%}%>
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
            <h2>Deals and Offers</h2>
            <br><br>
            <c:if test="${deals.size()!=0}">
                <table>
                    <thead>
                    <tr>
                        <th>Deal Description</th>
                        <th>Deal Type</th>
                    </tr>
                    </thead>
                    <tbody id="myTable">
                        <%--user check--%>
                    <c:forEach items="${deals}" var="deal">
                        <tr>
                            <td>${deal.getDeal()}</td>
                            <c:if test="${deal.premium}">
                                <td>Premium Deal</td>
                            </c:if>
                            <c:if test="${!deal.premium}">
                                <td>Normal Deal</td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${deals.size()==0}"><p class="alert alert-danger">Oops!! Currently there are no deals available
                for you.</p></c:if>

        </div>
        <div class="col-sm-2 sidenav">
            <div class="well">
                <p><span class="glyphicon glyphicon-cog"></span> &nbsp;Edit Account</p>
            </div>

            <div class="well">
                <a href="myBookings.jsp"><span class="glyphicon glyphicon-file"></span> &nbsp;My Bookings</a>
            </div>

        </div>
    </div>
</div>
</body>
</html>
