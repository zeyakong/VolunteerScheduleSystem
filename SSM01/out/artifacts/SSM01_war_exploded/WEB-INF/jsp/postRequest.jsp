<!doctype html>
<html lang="en">
<head>
    <title>Hello, world!</title>
    <%@include file="common/head.jsp"%>

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin .form-signin-heading,
        .form-signin  {
            margin-bottom: 10px;
        }
        .form-signin  {
            font-weight: normal;
        }
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }
        .form-signin .form-control:focus .bs-example{
            z-index: 2;
        }
        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>
<div class="container" >

    <form class="form-signin" action="${pageContext.request.contextPath }/volunteerSystem/addtherequest.action">
        <h2 class="form-signin-heading">Post Request
        </h2>
        <label for="inputEmail" class="sr-only">Username</label>
        <input name = "name" type="text" id="inputEmail" class="form-control" placeholder="name" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input name = "location" type="text" id="inputPassword" class="form-control" placeholder="location" required>
        <label for="inputPassword" class="sr-only">Password</label>
        <input name = "details" type="text"  class="form-control" placeholder="details">
        <label for="inputPassword" class="sr-only">Password</label>
        <input name = "need" type="text" class="form-control" placeholder="need">
        <label for="inputPassword" class="sr-only">Password</label>
        <input name = "start" type="text"  class="form-control" placeholder="start">
        <label for="inputPassword" class="sr-only">Password</label>
        <input name = "end" type="text"  class="form-control" placeholder="end">

        <button class="btn btn-lg btn-primary btn-block" type="submit">Post Service Request</button>
    </form>

</div> <!-- /container -->

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

</body>
</html>
