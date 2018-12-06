<%--
  Created by IntelliJ IDEA.
  User: Hadi-PC
  Date: 12/7/2018
  Time: 12:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col text-center">
                <form action="registerHandler.jsp" method="post">
                    <div class="form-group">
                        <div class="input-group mb-2">
                            <div class="input-group-prepend w-100">
                                <span class="input-group-text">Username:</span>
                                <input type="text" class="form-control" id="userName" name="userName"
                                       aria-describedby="userNameDesc"
                                       placeholder="Username"
                                       style="border-bottom-left-radius: 0;border-top-left-radius: 0">
                            </div>
                        </div>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend w-100">
                                <span class="input-group-text">Password:</span>
                                <input type="password" class="form-control" id="password" name="password"
                                       aria-describedby="passwordDesc"
                                       placeholder="Password"
                                       style="border-bottom-left-radius: 0;border-top-left-radius: 0">
                            </div>
                            <button type="submit" class="btn btn-success mt-2 w-100">Register</button>
                            <button type="reset" class="btn btn-danger mt-2 w-100">Reset</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</body>
</html>
