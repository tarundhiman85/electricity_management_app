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
        <h1>Welcome in ElectroBill Limited</h1>
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
    <div class="headerbutton">
        <a href="newConnection.jsp" style="text-decoration: none"><div style="display: flex; align-items: center;" class="connectionbtn">
            <img style="padding-right: 0.6rem; width: 2rem" src="img/add.png" alt="" srcset="">
            <h4  style="color: skyblue; font-size: 1rem;">New Connection Request</h4>
        </div></a>
    </div>
    <div style="margin-top: 5rem;" class="downarrow">
        <img style=" width: 3rem" src="./img/down-arrow.png" alt="" srcset="">
    </div>
</div>
<div class="serviceheader">
    <h1>Our Services</h1>
</div>

<div class="servicesection">

    <div id="cardfirst" class="card1">
        <img  src="./img/add.png" alt="" srcset="">
        <div class="cardbody">
            <button class="cardbtn">New Connection Request</button>
        </div>
    </div>
    <div id="cardsecond" class="card1">
        <img src="./img/resume.png" alt="" srcset="">
        <div class="cardbody">
            <button class="cardbtn">View Bill and Profile</button>
        </div>

    </div>
    <div  id="cardthird" class="card1">
        <img  src="./img/wallet.png" alt="" srcset="">
        <div class="cardbody">
            <button class="cardbtn">Wallet Money</button>
        </div>

    </div>
    <div id="cardfourth" class="card1">
        <img  src="./img/cashless-payment.png" alt="" srcset="">
        <div class="cardbody">
            <button class="cardbtn"> Bill Payment</button>
        </div>

    </div>

    <div id="cardfive" class="card1">
        <img  src="./img/help (1).png" alt="" srcset="">
        <div class="cardbody">
            <button class="cardbtn">Need Help?</button>
        </div>
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
        <img style="padding-right: 0.6rem; width: 2rem" src="img/user.png" alt="" srcset="">
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
            <img style="padding-right: 0.6rem; width: 2rem" src="img/user.png" alt="" srcset="">
          <a href="admin.jsp">  <h4  style="color: skyblue; font-size: 1rem;">Go To Admin Services</h4></a>
        </div>
    </div>

</div>
<%
    }
%>

</body>
</html>