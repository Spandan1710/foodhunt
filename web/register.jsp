<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="css/restaurant.css" rel="stylesheet">

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <script type="text/javascript" src="js/script.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register</title>

</head>
<body>
<div class="container">
    <div class="row" id="pwd-container">
        <div class="col-md-4"></div>

        <div class="col-md-4">
            <section class="login-form">

                <form name="regform" action="LoginController" method="post" onsubmit="return regValidate()">
                    <br>${message}<br>

                    Username: <input type="text" name="username" class="form-control input-lg"> <br>

                    Password: <input type="password" name="password" id="password" class="form-control input-lg">
                    <br>
                    Confirm Password: <input type="password" name="confirm-password" id="confirm-password"
                                             class="form-control input-lg">
                    <br>
                    <div id="password_error"></div>
                    <br>
                    <input type="submit" name="submit" value="Register" class="btn btn-lg btn-primary btn-block">
                    <input type="reset" name="reset" class="btn btn-lg btn-primary btn-block">

                </form>
            </section>
        </div>
    </div>
</div>
</body>
</html>