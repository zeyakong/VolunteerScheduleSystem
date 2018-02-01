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
    <title>Admin</title>
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
                    <a class="nav-link">Admin: <%=request.getSession().getAttribute("adminUsername")%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/report">Report</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="row">
    <div class="col-md-2">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">

            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab"
               aria-controls="v-pills-home" aria-selected="true">Account</a>

            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab"
               aria-controls="v-pills-profile" aria-selected="false">Wait List</a>

            <a class="nav-link" id="v-pills-su-tab" data-toggle="pill" href="#v-pills-su" role="tab"
               aria-controls="v-pills-su" aria-selected="false">Success List</a>

            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab"
               aria-controls="v-pills-messages" aria-selected="false">All Service Requests</a>

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
                                    <li class="nav-item dropdown active">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
                                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Create
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                                            <a class="dropdown-item" data-toggle="modal" data-target="#createModal1">Volunteer</a>
                                            <a class="dropdown-item" data-toggle="modal" data-target="#createModal2">Program Manager</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item disabled" href="#">Admin</a>
                                        </div>
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
                                <th>ID</th>
                                <th>Type</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>email</th>
                                <th>Operation</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="sk" items="${list}">
                                <tr>
                                    <td><p class="lead">${sk.volunteerId}</p></td>
                                    <td><p class="lead">volunteer</p></td>
                                    <td><p class="lead">${sk.volunteerUsername}</p></td>
                                    <td><p class="lead">********</p></td>
                                    <td><p class="lead">${sk.volunteerEmail}</p></td>
                                    <td>
                                        <div class="btn-group-sm" role="group">
                                            <button type="button" class="btn btn-info"> Edit</button>
                                            <button type="button" class="btn btn-danger"  data-toggle="modal" data-target="#delete" onclick="mId(-'${sk.volunteerId}')">Delete</button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:forEach var="sk" items="${list2}">
                                <tr>
                                    <td><p class="lead">${sk.managerId}</p></td>
                                    <td><p class="lead">manager</p></td>
                                    <td><p class="lead">${sk.managerUsername}</p></td>
                                    <td><p class="lead">********</p></td>
                                    <td><p class="lead">${sk.managerEmail}</p></td>
                                    <td>
                                        <div class="btn-group-sm" role="group">
                                            <button type="button" class="btn btn-info"> Edit</button>
                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delete" onclick="mId('${sk.managerId}')">Delete</button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">


                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                            <a class="navbar-brand" href="#">Wait List</a>
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
                                <th>Wait Number</th>
                                <th>Service Request</th>
                                <th>Volunteer</th>
                                <th>Operation</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="sk" items="${list3}">
                                <tr>
                                <tr>
                                <td><p class="lead">${sk.waitId}</p></td>
                                <td><p class="lead">${sk.requestName}</p></td>
                                <td><p class="lead">${sk.volunteerUsername}</p></td>
                                    <td>
                                        <button type="button" class="btn-sm btn-success" onclick="conform('${sk.waitId}')"> Conform</button>
                                    </td>
                                </tr>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>




            <div class="tab-pane fade" id="v-pills-su" role="tabpanel" aria-labelledby="v-pills-su-tab">


                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                            <a class="navbar-brand" href="#">Success List</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent6" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent6">
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
                                <th>Success Number</th>
                                <th>Service Request</th>
                                <th>Volunteer</th>
                                <th>Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="sk" items="${list5}">
                                <tr>
                                <tr>
                                    <td><p class="lead">${sk.successId}</p></td>
                                    <td><p class="lead">${sk.requestName}</p></td>
                                    <td><p class="lead">${sk.volunteerUsername}</p></td>
                                    <td>
                                        <span class="badge badge-success">Enrolled</span>
                                    </td>
                                </tr>
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
                            <a class="navbar-brand" href="#">Requests</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent4" aria-controls="navbarSupportedContent4"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent4">
                                <ul class="navbar-nav mr-auto">
                                </ul>
                                <form class="form-inline my-2 my-lg-0" action="searchIt.action">
                                    <input class="form-control mr-sm-2" type="search" placeholder="Search by Volunteer" id = "searchValue" name="searchValue"
                                           aria-label="Search">
                                    <button class="btn btn-outline-success my-2 my-sm-0">Search by Volunteer</button>
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
                                <th>manager</th>
                                <th>needNumber</th>
                                <th>start</th>
                                <th>end</th>
                                <th>operation</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="sk" items="${list4}">
                                <tr>
                                    <td><p class="lead">${sk.requestId}</p></td>
                                    <td><p class="lead">${sk.requestName}</p></td>
                                    <td><p class="lead">${sk.requestLocation}</p></td>
                                    <td><p class="lead">${sk.managerId}</p></td>
                                    <td><p class="lead">${sk.requestNeedNumber}</p></td>
                                    <td><p class="lead">${sk.requestStartTime}</p></td>
                                    <td><p class="lead">${sk.requestEndTime}</p></td>
                                    <td>
                                        <button type="button" class="btn btn-dark disabled"> No operation
                                        </button>
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
<!-- Modal register-->
<div class="modal fade" id="createModal1" tabindex="-1" role="dialog" aria-labelledby="register1"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="register1">Create Volunteer</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="registerun1">Username</label>
                        <input type="text" class="form-control" id="registerun1" placeholder="Enter username">
                    </div>
                    <div class="form-group">
                        <label for="registerpw1">Password</label>
                        <input type="password" class="form-control" id="registerpw1" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label for="registerem1">Email(Optional)</label>
                        <input type="email" aria-describedby="emailHelp" class="form-control" id="registerem1"
                               placeholder="Enter Email">
                    </div>
                    <button type="submit" class="btn btn-primary" onclick="createV()">Submit</button>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>



<!-- Modal register-->
<div class="modal fade" id="createModal2" tabindex="-1" role="dialog" aria-labelledby="register2"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="register2">Create Program Manager</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="registerun2">Username</label>
                        <input type="text" class="form-control" id="registerun2" placeholder="Enter username">
                    </div>
                    <div class="form-group">
                        <label for="registerpw2">Password</label>
                        <input type="password" class="form-control" id="registerpw2" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label for="registerem2">Email(Optional)</label>
                        <input type="email" aria-describedby="emailHelp" class="form-control" id="registerem2"
                               placeholder="Enter Email">
                    </div>
                    <button type="submit" class="btn btn-primary" onclick="createM()">Submit</button>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
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
                <p>Are you sure to delete this account? All of the information of this account will be deleted and all the post request/ application from this account  will be also deleted!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="doDelete()">Yes</button>
                <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


</body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
    function createV() {
        var name = $("#registerun1").val();
        var password = $("#registerpw1").val();
        var email = $("#registerem1").val();
        $.ajax({
            type:"POST",
            url:"/createVolunteer.action",
            data:"name="+name+"&password="+password+"&email="+email,
            success:function (data) {
                //如果成功,转发到其他页面，否则提示内容
                if(data){
                    //success
                    window.location.href="index.action";
                }else{
                    //incorrect
                    $("#statu1").text("Error!");
                }
            }
        });
    }

    function createM() {
        var name = $("#registerun2").val();
        var password = $("#registerpw2").val();
        var email = $("#registerem2").val();
        $.ajax({
            type:"POST",
            url:"/createManager.action",
            data:"name="+name+"&password="+password+"&email="+email,
            success:function (data) {
                //如果成功,转发到其他页面，否则提示内容
                if(data){
                    //success
                    window.location.href="index.action";
                }else{
                    //incorrect
                    $("#statu1").text("Error!");
                }
            }
        });
    }

    var userid;
    function mId(id) {
        userid = id;
    }

    function doDelete() {
        if(userid>0){
            window.location.href="deleteManager.action?id="+userid;
        }else{
            userid = 0-userid;
            window.location.href="deleteVolunteer.action?id="+userid;
        }
    }

    function conform(waitid) {
        $.ajax({
            type: "POST",
            url: "/conform.action",
            data: "waitId=" + waitid,
            success: function (data) {
                //如果成功,转发到其他页面，否则提示内容
                if (data) {
                    //success
                    alert("Conform Successfully!");
                    window.location.href="doLogin.action";
                } else {
                    //incorrect
                    alert("Error! Time Conflict. Check the success list");
                    window.location.href="doLogin.action";
                }
            }
        });
    }

</script>
</html>
