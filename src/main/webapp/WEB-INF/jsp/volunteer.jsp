<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/6
  Time: 23:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Volunteer</title>
    <%@include file="common/head.jsp" %>
    <%
        Object obj = session.getAttribute("userType");
        if (obj == null) {

    %>
    <meta http-equiv="refresh" content="0; url=doLogin"/>
    <%
        }
    %>

    <style>
        .row {
            padding-top: 80px;
            padding-right: 20px;
            padding-left: 20px;
        }

        .lead {
            margin-top: 0px;
            margin-bottom: 0px;
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
                    <a class="nav-link">Volunteer: <%=request.getSession().getAttribute("volunteerUsername")%> </a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link float-sm-right" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="row">
    <div class="col-md-2">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab"
               aria-controls="v-pills-home" aria-selected="true">All Service Requests</a>
            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab"
               aria-controls="v-pills-profile" aria-selected="false">Applications</a>
        </div>
    </div>

    <div class="col-md-10">
        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">


                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                            <a class="navbar-brand" href="#">Requests You Can Choose</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent2" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent2">
                                <ul class="navbar-nav mr-auto">
                                </ul>
                                <form class="form-inline my-2 my-lg-0">
                                    <input class="form-control mr-sm-2" type="search" placeholder="Search"
                                           aria-label="Search">
                                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                                </form>
                            </div>
                        </nav>


                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>name</th>
                                <th>location</th>
                                <th>details</th>
                                <th>needNumber</th>
                                <th>start</th>
                                <th>end</th>
                                <th>operation</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="sk" items="${list}">
                                <tr>
                                    <td><p class="lead">${sk.requestId}</p></td>
                                    <td><p class="lead">${sk.requestName}</p></td>
                                    <td><p class="lead">${sk.requestLocation}</p></td>
                                    <td><p class="lead">${sk.requestDetails}</p></td>
                                    <td><p class="lead">${sk.requestNeedNumber}</p></td>
                                    <td><p class="lead">${sk.requestStartTime}</p></td>
                                    <td><p class="lead">${sk.requestEndTime}</p></td>
                                    <td>
                                        <button type="button" class="btn btn-warning"
                                                onclick="apply('${sk.requestId}')"> Apply
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>



            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                            <a class="navbar-brand" href="#">Applications</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent3" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent3">
                                <ul class="navbar-nav mr-auto">
                                </ul>
                                <form class="form-inline my-2 my-lg-0">
                                    <input class="form-control mr-sm-2" type="search" placeholder="Search"
                                           aria-label="Search">
                                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                                </form>
                            </div>
                        </nav>


                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>name</th>
                                <th>location</th>
                                <th>details</th>
                                <th>start</th>
                                <th>end</th>
                                <th>status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="sk" items="${list2}">
                                <tr>
                                    <td><p class="lead">${sk.requestId}</p></td>
                                    <td><p class="lead">${sk.requestName}</p></td>
                                    <td><p class="lead">${sk.requestLocation}</p></td>
                                    <td><p class="lead">${sk.requestDetails}</p></td>
                                    <td><p class="lead">${sk.requestStartTime}</p></td>
                                    <td><p class="lead">${sk.requestEndTime}</p></td>
                                    <td>
                                        <span class="badge badge-pill badge-warning">Applying</span>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:forEach var="sk" items="${list3}">
                                <tr>
                                    <td><p class="lead">${sk.requestId}</p></td>
                                    <td><p class="lead">${sk.requestName}</p></td>
                                    <td><p class="lead">${sk.requestLocation}</p></td>
                                    <td><p class="lead">${sk.requestDetails}</p></td>
                                    <td><p class="lead">${sk.requestStartTime}</p></td>
                                    <td><p class="lead">${sk.requestEndTime}</p></td>
                                    <td>
                                        <span class="badge badge-success">Enrolled</span>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>



            </div>
        </div>

    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
    function apply(id) {
        $.ajax({
            type: "POST",
            url: "/apply.action",
            data: "requestId=" + id,
            success: function (data) {
                //如果成功,转发到其他页面，否则提示内容
                if (data) {
                    //success
                    alert("Apply Successfully!");
                    window.location.href="doLogin.action";
                } else {
                    //incorrect
                    alert("You Can't Apply Twice!");
                    window.location.href="doLogin.action";
                }
            }
        });
    }
</script>
</html>
