<%@ page import="project.Model.UserDao" %>
<%@ page import="project.Controller.FactoryProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<%
    UserDao userDao = new UserDao(FactoryProvider.getFactory());
    long count=userDao.getNumberofUsers();
%>
<body class="back">
<%@include file="navbar.jsp"%>
<div class="container">
    <div class="row mt-3">
        <%--    first col--%>
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <div class="container" style="margin-bottom: 45px; margin-top: 10px">
                        <img src="img/user.png" alt="">
                    </div>
                    <strong  class="button-4 w-button link">Number of Users : <%=count%></strong><br>
                </div>
            </div>
        </div>
        <%--    first col--%>
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <div class="container">
                        <img src="img/profile.png" alt="">
                    </div>
                    <a href="viewUser.jsp" class="button-4 w-button link"><br><br><strong>View User</strong></a>
                </div>
            </div>
    </div>
    </div>
    <div class="row mt-3">
        <%--    first col--%>
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <div class="container">
                        <img src="img/bill.png" alt="">
                    </div>
                    <a href="calculateBill.jsp" class="button-4 w-button link"><br><br><strong>Calculate Bill</strong></a>
                </div>
            </div>
        </div>
            <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <div class="container">
                        <img src="img/add-friend.png" alt="">
                    </div>
                    <a href="register.jsp" class="button-4 w-button link"><br><br><strong>Add User</strong></a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
