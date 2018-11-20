<%@ page import="edu.utdallas.foodhunt.restaurantmanagement.businesslayer.RestaurantService" %>
<%@ page import="edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Restaurant" %>
<%@ page import="edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Menu" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    String restaurantID = "";
    Restaurant restaurant = null;
    List<Menu> menuItems = null;
    if (request.getParameter("restaurantID") != null) {
        restaurantID = request.getParameter("restaurantID");

    } else if (request.getAttribute("restaurantID") != null) {
        restaurantID = (String) request.getAttribute("restaurantID");
    }

    RestaurantService restaurantService = new RestaurantService();
    restaurant = restaurantService.getRestaurant(restaurantID);
    menuItems = restaurantService.getMenuItems(restaurantID);
    request.setAttribute("menuItems", menuItems);

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
                    String username = "";
                    if (session.getAttribute("userName") != null) {
                        username = (String) session.getAttribute("userName");
                    }

                    if (username.equalsIgnoreCase("admin")) {
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

            <br/>
            <div class="row">
                <div class="col-md-4 img">
                    <img src="images/<%=restaurant.getPictureUrl()%>"
                         alt="" class="img-rounded" height="400px" width="400px">
                </div>
                <div class="col-md-8 details">
                    <blockquote>
                        <h5><%=restaurant.getName()%>
                        </h5>
                    </blockquote>
                    <p>

                    <table class="table table-striped">

                        <tbody>
                        <tr>
                            <td>Restaurant Type :</td>
                            <td><%=restaurant.getRestaurantType()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Food Rating :</td>
                            <td><%=restaurant.getFoodRating()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Accessibility Rating :</td>
                            <td><%=restaurant.getAccessibilityRating()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Ambience Rating :</td>
                            <td><%=restaurant.getAmbienceRating()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Overall Rating :</td>
                            <td><%=restaurant.getOverallRating()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Opening Time :</td>
                            <td><%=restaurant.getOpenTime()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Closing Time :</td>
                            <td><%=restaurant.getCloseTime()%>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    </p>
                    <%
                        String userType = "";
                        if (session.getAttribute("userName") != null) {
                            userType = (String) session.getAttribute("userName");
                        }

                        if (userType.equalsIgnoreCase("admin")) {
                    %>
                    <div>
                        <a href="addMenuItem.jsp?restaurantID=<%=restaurant.getId()%>"><span
                                class="glyphicon glyphicon-plus"></span> &nbsp;Add Menu Item</a>
                    </div>
                    <a type="button" href="adminHome.jsp" class="btn btn-danger btn-lg">Go Back</a>
                    <%} else {%>
                    <a type="button" href="userHome.jsp" class="btn btn-danger btn-lg">Go Back</a>
                    <%}%>
                    <table id="menuTable">
                        <thead>
                        <tr>
                            <th>Item Name</th>
                            <th>Cuisine</th>
                            <th>Price</th>
                            <%
                                String user1 = "";
                                if (session.getAttribute("userName") != null) {
                                    user1 = (String) session.getAttribute("userName");
                                }

                                if (user1.equalsIgnoreCase("admin")) {
                            %>
                            <th>Edit Item</th>
                            <th>Delete Item</th>
                            <th>Change Visibility</th>
                            <%}%>
                        </tr>
                        </thead>
                        <tbody id="menuTable1">
                        <c:forEach items="${menuItems}" var="menuItem">
                            <%
                                String user = "";
                                if (session.getAttribute("userName") != null) {
                                    user = (String) session.getAttribute("userName");
                                }

                                if (user.equalsIgnoreCase("admin") && menuItems.size() != 0) {
                            %>
                            <tr>
                                <td>${menuItem.getMenuItem()}</td>
                                <td>${menuItem.getCuisine()}</td>
                                <td>${menuItem.getMenuPrice()}</td>

                                <td><a type="button" class="btn btn-success"
                                       href="editMenuItem.jsp?menuId=${menuItem.getMenuId()}">Edit</a></td>
                                <td>
                                    <button type="button" class="btn btn-danger" data-toggle="modal"
                                            data-target="#myModal1" onclick="modalSet1(${menuItem.getMenuId()})">Delete
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger" data-toggle="modal"
                                            data-target="#myModal2" onclick="modalSet2(${menuItem.getMenuId()})">Change
                                        Visibility
                                    </button>
                                </td>
                            </tr>
                            <%} else if (!user.equalsIgnoreCase("admin") && menuItems.size() != 0) {%>
                            <c:if test="${menuItem.active}">
                                <tr>
                                    <td>${menuItem.getMenuItem()}</td>
                                    <td>${menuItem.getCuisine()}</td>
                                    <td>${menuItem.getMenuPrice()}</td>
                                </tr>
                            </c:if>
                            <%}%>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <br>
            <br>


        </div>
        <div class="col-sm-2 sidenav">


        </div>
    </div>
</div>
<!-- Modal -->
<div id="myModal1" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Confirm Delete</h4>
            </div>
            <div class="modal-body">

                <p>Are you sure you want to Delete this menu item?</p>


            </div>

            <div class="modal-footer">
                <button id="Yes" type="button" class="btn btn-success" data-dismiss="modal">Yes</button>

                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>

    </div>
</div>

<!-- Modal -->
<div id="myModal2" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Confirm Visibility</h4>
            </div>
            <div class="modal-body">

                <p>Are you sure you want to change the visibility of this menu item?</p>


            </div>

            <div class="modal-footer">
                <button id="Yes1" type="button" class="btn btn-success" data-dismiss="modal">Yes</button>

                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>

    </div>
</div>

<footer class="container-fluid text-center">
    <p>Food Hunt - Copyright &copy; 2018</p>
</footer>
<script>
    function modalSet1(val) {
        $("#myModal1 #Yes").attr("href", "DeleteMenuItemController?menuId=" + val)
    }

    $("#Yes").click(function (e) {
        $.ajax({
            type: "POST",
            url: $("#Yes").attr("href")
        }).done(function () {
            location.reload()
        })
    })

    function modalSet2(val) {
        $("#myModal2 #Yes1").attr("href", "EditMenuItemVisibilityController?menuId=" + val)
    }

    $("#Yes1").click(function (e) {
        $.ajax({
            type: "POST",
            url: $("#Yes1").attr("href")
        }).done(function () {
            location.reload()
        })
    })

</script>
</body>
</html>
