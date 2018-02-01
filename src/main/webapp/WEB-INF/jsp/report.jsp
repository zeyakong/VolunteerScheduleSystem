<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/7
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Report</title>
    <%@include file="common/head.jsp" %>
    <style>
        .lead{
            margin-top: 0px;
            margin-bottom: 0px;
        }
        .mid
        {
            padding-top:80px;
        }
    </style>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">

    <div class="container">
        <a class="navbar-brand" href="#">Volunteer Schedule System</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" >Admin: <%=request.getSession().getAttribute("adminUsername")%></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link float-sm-right" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mid">
    <h1>Report:</h1>
    <button type="button" class="btn btn-info" onclick="goback()">Go back</button>
    <HR>
    <a>Volunteer number: ${v}</a>
    <HR>
    <a>Program number: ${m}</a>
    <HR>
    <a>Wait List Long: ${w}</a>
    <HR>
    <a>Success Conform:${s}</a>
    <HR>
    <a>All requests number: ${r}</a>

</div>
</body>
<script>
    function goback() {
        window.location.href="doLogin.action";
    }
</script>
</html>