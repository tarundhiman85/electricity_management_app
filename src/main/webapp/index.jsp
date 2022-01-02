<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Electricity Bill Management</title>
    <%@include file="/common_css_js1.jsp"%>

</head>
<%
    User user = (User) session.getAttribute("current-User");
%>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/Black - 13495.mp4" type="video/mp4">
</video>

<%@include file="navbar.jsp"%>

<%
    if(user==null){
%>

<div class="headersection">
    <div class="headertitle">
        <h1>Welcome to ElectroBill Limited</h1>
    </div>
    <div class="headerpara">
        <div class="col1">
            <h3>A Unified Solution</h3>
        </div>
        <div class="col2">
            <h3> for </h3>
        </div>
        <div class="col3">
            <h3>Electricity Bill Management </h3>
        </div>
    </div>
    <div style="margin-top: 5rem;" class="downarrow">
        <img style=" width: 3rem" src="./img/down-arrow.png" alt="" srcset="">
    </div>
    <div class="headerbutton">
        <a href="services.jsp" style="text-decoration: none"><div style="display: flex; align-items: center;" class="connectionbtn">
            <img style="padding-right: 0.6rem; width: 2.5rem" src="img/customer-service.png" alt="" srcset="">
            <h4  style="margin-left:1.5rem;color: skyblue; font-size: 1rem;">Our Services</h4>
        </div></a>
    </div>

</div>

<%
} else if(user.getRoll_id()==2){
%>
<div class="headersection">
    <div class="headertitle">
        <h1>Welcome <%=user.getUserName()%> in User Panel</h1>
    </div>
    <div class="headerpara">
        <div class="col1">
            <h3>A Unified Solution</h3>
        </div>
        <div class="col2">
            <h3> for </h3>
        </div>
        <div class="col3">
            <h3>Electricity Bill Management </h3>
        </div>
    </div>
        <div style="margin-top: 5rem;" class="downarrow">
            <img style=" width: 3rem" src="./img/down-arrow.png" alt="" srcset="">
        </div>

    <div class="headerbutton">
    <div style="display: flex; align-items: center;" class="connectionbtn">
        <img style="padding-right: 0.6rem; width: 2.5rem" src="img/community.png" alt="" srcset="">
        <a href="user.jsp"> <h4  style="color: skyblue; font-size: 1rem;">Go for User Services</h4></a>
    </div>
    </div>


</div>

<%
} else {
%>

<div class="headersection">
    <div class="headertitle">
        <h1>Welcome <%=user.getUserName()%> in Admin Panel</h1>
    </div>
    <div class="headerpara">
        <div class="col1">
            <h3>A Unified Solution</h3>
        </div>
        <div class="col2">
            <h3> for </h3>
        </div>
        <div class="col3">
            <h3>Electricity Bill Management </h3>
        </div>
    </div>
    <div style="margin-top: 5rem;" class="downarrow">
        <img style=" width: 3rem" src="./img/down-arrow.png" alt="" srcset="">
    </div>

    <div class="headerbutton">
        <div style="display: flex; align-items: center;" class="connectionbtn">
            <img style="padding-right: 0.6rem; width: 2.5rem" src="img/admin.png" alt="" srcset="">
          <a href="admin.jsp">  <h4  style="color: skyblue; font-size: 1rem;">Go To Admin Services</h4></a>
        </div>
    </div>

</div>
<%
    }
%>

</body>
</html>