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
    <title>volunteer</title>
</head>
<body>
<!-- 页面显示部分 -->
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>Volunteer</h2>
        </div>

        <div>
            <h3>Services Requests</h3>
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
                        <td>${sk.requestId}</td>
                        <td>${sk.requestName}</td>
                        <td>${sk.requestLocation}</td>
                        <td>${sk.requestDetails}</td>
                        <td>${sk.requestNeedNumber}</td>
                        <td>${sk.requestStartTime}</td>
                        <td>${sk.requestEndTime}</td>
                        <td><a class="btn btn-info" href="${basePath}/volunteerSystem/${sk.requestId}/${volunteerId}/apply" target="_blank">apply</a></td>
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