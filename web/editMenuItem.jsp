<%@ page import="edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Menu" %>
<%@ page import="edu.utdallas.foodhunt.restaurantmanagement.businesslayer.RestaurantService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Menu Item</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/addValidation.js"></script>

    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {
            height: 100pc;
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
            <%Menu menu = new RestaurantService().getMenuItem(request.getParameter("menuId"));%>
            <div class="container">
                <h2>Edit a Menu Item</h2>
                <form action="EditMenuItemController" method="post">
                    <input type="hidden" name="menuID" , value="<%=menu.getMenuId()%>">
                    <div class="row">
                        <div class="form-group col-lg-6">
                            <label for="menuName">Item Name: </label>
                            <input type="text" class="form-control" id="menuName" placeholder="Enter Item Name"
                                   name="menuName" value="<%=menu.getMenuItem()%>">
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-lg-6">
                            <label for="Type">Cusine: </label>
                            <select class="form-control" id="type" name="type" value="<%=menu.getCuisine()%>">
                                <option value="Indian">Indian</option>
                                <option value="Chinese">Chinese</option>
                                <option value="Italian">Italian</option>
                                <option value="Mexican">Mexican</option>
                                <option value="Thai">Thai</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-lg-6">
                            <label for="Price">Price:</label>
                            <input type="text" class="form-control" id="Price" placeholder="Enter Price"
                                   name="menuPrice" value="<%=menu.getMenuPrice()%>">
                        </div>
                    </div>
                    <input type="submit" name="submit" value="Edit" class="btn btn-lg btn-primary btn-lg">
                    <a type="button" href="restaurantDetail.jsp" class="btn btn-danger btn-lg">Cancel</a>
                </form>
            </div>
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
