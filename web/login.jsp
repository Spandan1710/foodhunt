<%@page import="db.DbManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/restaurant.css" rel="stylesheet">

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="script.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
</head>
<body>
	
	<div class="container">
		<div class="row" id="pwd-container">
		    <div class="col-md-4"></div>
		    
		    <div class="col-md-4">
		        <section class="login-form">
		    
				<form name="loginform" action="LoginController" method="post" onsubmit="return loginValidate()" >
				          <img src="images/foodhunt.png" class="img-responsive" alt="" />
				
				${message}<br>
				${successMessage}<br>
				
				
				Username: <input type="text" name="username" id="username" class="form-control input-lg"><br>
				Password: <input type="password" name="password" id="password" class="form-control input-lg"><br>
				<input type="submit" name="submit" value="login" class="btn btn-lg btn-primary btn-block"><br>
				<a href="register.jsp">registration</a>
				
				</form>
				
				</section>
			</div>
		</div>
	</div>
</body>
</html>