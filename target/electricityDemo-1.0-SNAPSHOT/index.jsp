<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Electricity Bill Management</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<div class="container">
    <div class="initial">
        <img src="./img/welcome.png" alt="Welcome" srcset="">
        <div class="dishead">
            <h1>Welcome! KEBS Electricity Board </h1>
            <h4 style="margin-top: 2rem; font-size: 2rem; color: gold">Complete Solution for Electricity Bill Management</h4>
        </div>

    </div>

</div>
<div class="container">
    <div class="rowindex">
        <div class="colindex spcol">
            <div class="card">
                <img class="card-img-top" src="./img/new connection.png" alt="New Connection">
            </div>
            <a class="link" href="viewInfo.jsp"><br><br><strong>New Connection Request</strong></a>
        </div>
        <div class="colindex">
            <div class="card">
                <img class="card-img-top" src="./img/pngaaa.com-1119855.png" alt="New Connection">
            </div>
            <a class="link" href="viewInfo.jsp"><br><br><strong>Need Help?</strong></a>
        </div>
        <div class="colindex">
            <div class="card">
                <img class="card-img-top" src="./img/new connection.png" alt="New Connection">
            </div>
            <a class="link" href="services.jsp"><br><br><strong>Our Services</strong></a>
        </div>
    </div>
</div>

   <%-- <div class="parent_div">
        <div class="welcome">
            <strong>Welcome to Electricity Bill Management System</strong><br>
            <b>Goals of the Project</b><br>
            To let the admin to be able to see the Number of Users Registered<br>
            To let the admin to see the Total Number of Users<br>
            To let the admin to Add new users<br>
            To let the admin Calculate the bill<br>
            To let the user see the Information<br>
            To let the user Pay Bill<br>
        </div>
    </div>

<%@include file="common_modals.jsp"%> --%>
</body>
</html>