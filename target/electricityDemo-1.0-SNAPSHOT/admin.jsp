<%@ page import="project.Model.UserDao" %>
<%@ page import="project.Controller.FactoryProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<%
    User user = (User)session.getAttribute("current-User");
    if(user==null){
        session.setAttribute("message1","You are not logged in!!");
        response.sendRedirect("login.jsp");
        return;
    }
    else if(user.getRoll_id()==2){
        session.setAttribute("message1","You are not Admin Don't access this page");
        response.sendRedirect("index.jsp");
        return;
    }
    UserDao userDao = new UserDao(FactoryProvider.getFactory());
    long count=userDao.getNumberofUsers();
%>
<body class="back">
<%@include file="navbar.jsp"%>
<div class="flexi">
        <div class="flexItem">
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
        <div class="flexItem">
            <div class="card text-center">
                <div class="card-body">
                    <div class="container">
                        <img src="img/profile.png" alt="">
                    </div>
                    <a href="viewUser.jsp" class="button-4 w-button link"><br><br><strong>View User</strong></a>
                </div>
            </div>
<%--    </div>--%>
    </div>
<%--    <div class="row mt-3">--%>

        <div class="flexItem">
            <div class="card text-center">
                <div class="card-body">
                    <div class="container">
                        <img src="img/bill.png" alt="">
                    </div>
                    <a href="calculateBill.jsp" class="button-4 w-button link"><br><br><strong>Calculate Bill</strong></a>
                </div>
            </div>
        </div>
            <div class="flexItem">
            <div class="card text-center">
                <div class="card-body">
                    <div class="container">
                        <img src="img/add-friend.png" alt="">
                    </div>
                    <a href="register.jsp" class="button-4 w-button link"><br><br><strong>Add User</strong></a>
                </div>
            </div>
        </div>
    <div class="flexItem">
        <div class="card text-center">
            <div class="card-body">
                <div class="container">
                    <img src="img/resolve.png" alt="">
                </div>
                <a href="ResolveIsue.jsp" class="button-4 w-button link"><br><br><strong>Resolve User Issue</strong></a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
