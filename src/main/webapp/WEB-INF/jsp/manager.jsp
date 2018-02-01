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
    <title>Program Manager</title>
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
        .row{
            padding-top: 80px;
            padding-right: 20px;
            padding-left: 20px;
        }
        .lead{
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
                    <a class="nav-link" >Program Manager: <%=request.getSession().getAttribute("managerUsername")%></a>
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
               aria-controls="v-pills-home" aria-selected="true">Your Service</a>
            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab"
               aria-controls="v-pills-profile" aria-selected="false">Messages</a>
        </div>
    </div>

    <div class="col-md-10">
        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">


                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                            <a class="navbar-brand" href="#">Account</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent2" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent2">
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item active">
                                        <a class="nav-link" data-toggle="modal" data-target="#postModal">Post New</a>
                                    </li>
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
                            <th>needNumber</th>
                            <th>start</th>
                            <th>end</th>
                            <th>Operation</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="sk" items="${list}">
                            <tr>
                                <td>${sk.requestId}</td>
                                <td>${sk.requestName}</td>
                                <td>${sk.requestLocation}</td>
                                <td>${sk.requestNeedNumber}</td>
                                <td>${sk.requestStartTime}</td>
                                <td>${sk.requestEndTime}</td>
                                <td>
                                    <div class="btn-group-sm" role="group">
                                        <button type="button" class="btn btn-info"> Edit</button>
                                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delete" onclick="mV('${sk.requestId}')">Delete</button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        </table>
                    </div>
                </div>

            </div>
            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
               <p class="lead">No Message</p>
            </div>
        </div>


        <div class="modal" tabindex="-1" role="dialog" id = "delete">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete!</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure to delete this service request? All of the information of this request will be deleted and all the volunteers who applied this request will be cancelled from it!</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="doDelete()">Yes</button>
                        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal post-->
        <div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="postModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="postModalLabel">Post a New Service Request</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="name">Request Name</label>
                                <input type="text" class="form-control" id="name" placeholder="Enter Name">
                            </div>
                            <div class="form-group">
                                <label for="location">Location</label>
                                <input type="text" class="form-control" id="location" placeholder="Location">
                            </div>
                            <div class="form-group">
                                <label for="detail">Details</label>
                                <input type="text" class="form-control" id="detail" placeholder="Enter Details">
                            </div>
                            <div class="form-group">
                                <label for="need">Need Number</label>
                                <input type="number" class="form-control" id="need" placeholder="Need">
                            </div>
                            <div class="form-group">
                                <label for="st">Start Time</label>
                                <input type="datetime-local" class="form-control" id="st" placeholder="Start Time">
                            </div>
                            <div class="form-group">
                                <label for="et">End Time</label>
                                <input type="datetime-local" class="form-control" id="et" placeholder="End">
                            </div>

                            <button type="button" class="btn btn-primary" onclick="post()">Submit</button>
                        </form>
                        <span class="badge badge-danger" id="statu1"></span>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>

    var rid ;
    function mV(id) {
        rid = id;
    }

    function doDelete() {
        window.location.href="doDelete.action?id="+rid;
    }

    function post() {
        var name = $("#name").val();
        var location = $("#location").val();
        var detail = $("#detail").val();
        var need = $("#need").val();
        var st = $("#st").val();
        var et = $("#et").val();
        $.ajax({
            type:"POST",
            url:"/postRequest.action",
            data:"name="+name+"&location="+location+"&detail="+detail+"&need="+need+"&st="+st+"&et="+et,
            success:function (data) {
                //如果成功,转发到其他页面，否则提示内容
                if(data){
                    //success
                    window.location.href="doLogin.action";
                }else{
                    //incorrect
                    $("#statu1").text("Error!");
                }
            }
        });
    }
</script>
</html>
