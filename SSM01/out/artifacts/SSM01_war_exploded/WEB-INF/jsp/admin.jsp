<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- 引入jstl -->
<%@include file="common/tag.jsp" %>
<!DOCTYPE html>
<style type="text/css">
    body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #eee;
    }
</style>
<head>
    <%@include file="common/head.jsp"%>
    <title>Admin</title>
</head>
<body>
<!-- 页面显示部分 -->
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>admin</h2>
        </div>
        <div>
            <a class="btn btn-info" href="/volunteerSystem/addVolunteer" target="_blank">addVolunteer</a>
            <a class="btn btn-info" href="/volunteerSystem/addManager" target="_blank">addManager</a>
        </div>

        <div>
            <h3>Volunteers</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>id</th>
                    <th>username</th>
                    <th>password</th>
                    <th>email</th>
                    <th>Delete</th>
                    <th>Edit</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="sk" items="${list}">
                    <tr>
                        <td>${sk.volunteerId}</td>
                        <td>${sk.volunteerUsername}</td>
                        <td>${sk.volunteerPassword}</td>
                        <td>${sk.volunteerEmail}</td>
                        <td><a class="btn btn-info" href="${basePath}/volunteerSystem/${sk.volunteerId}/delete" target="_blank">Delete</a></td>
                        <td><a class="btn btn-info" href="${basePath}/volunteerSystem/${sk.volunteerId}/edit" target="_blank">edit</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div>
            <h3>Managers</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>id</th>
                    <th>username</th>
                    <th>password</th>
                    <th>email</th>
                    <th>Delete</th>
                    <th>Edit</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="sk" items="${list2}">
                    <tr>
                        <td>${sk.managerId}</td>
                        <td>${sk.managerUsername}</td>
                        <td>${sk.managerPassword}</td>
                        <td>${sk.managerEmail}</td>
                        <td><a class="btn btn-info" href="${basePath}/volunteerSystem/${sk.managerId}/delete" target="_blank">Delete</a></td>
                        <td><a class="btn btn-info" href="${basePath}/volunteerSystem/${sk.managerId}/edit" target="_blank">edit</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div>
            <h3>Wait List of Application</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>wait id</th>
                    <th>volunteer id</th>
                    <th>request id</th>
                    <th>conform</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="sk" items="${list3}">
                    <tr>
                        <td>${sk.waitId}</td>
                        <td>${sk.volunteerId}</td>
                        <td>${sk.requestId}</td>
                        <td><a class="btn btn-info" href="${basePath}/volunteerSystem/${sk.waitId}/conform" target="_blank">conform</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
