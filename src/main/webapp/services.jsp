<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Our Services</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/atoms2.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>
<%
    session.setAttribute("message",null);
%>
<div style="top:10rem" class="serviceheader">
    <h1>Our Services</h1>
</div>
<div style="top:18rem" class="servicesection">
    <div id="cardfirst" class="card1">
        <img  src="./img/add.png" alt="" srcset="">
        <div class="cardbody">
            <a href="newConnection.jsp">   <button class="cardbtn">New Connection Request</button></a>
        </div>
    </div>
    <div id="cardsecond" class="card1">
        <img src="./img/resume.png" alt="" srcset="">
        <div class="cardbody">
            <a href="login.jsp">   <button class="cardbtn">View Bill and Profile</button></a>
        </div>
    </div>
    <div  id="cardthird" class="card1">
        <img  src="./img/wallet.png" alt="" srcset="">
        <div class="cardbody">
            <a href="login.jsp">   <button class="cardbtn">Wallet Money</button></a>
        </div>
    </div>
    <div id="cardfourth" class="card1">
        <img  src="./img/cashless-payment.png" alt="" srcset="">
        <div class="cardbody">
            <a href="login.jsp">  <button class="cardbtn"> Bill Payment</button></a>
        </div>
    </div>
    <div id="cardfive" class="card1">
        <img  src="./img/status.png" alt="" srcset="">
        <div class="cardbody">
            <a href="viewStatus.jsp"><button class="cardbtn">View Status</button></a>
        </div>
    </div>
    <div id="cardsix" class="card1">
        <img  src="./img/transaction (1).png" alt="" srcset="">
        <div class="cardbody">
            <a href="login.jsp"><button class="cardbtn">View Transaction</button></a>
        </div>
    </div>
    <div id="cardseven" class="card1">
        <img  src="./img/help (1).png" alt="" srcset="">
        <div class="cardbody">
            <a href="login.jsp">  <button class="cardbtn">Need Help?</button></a>
        </div>
    </div>
</div>
<script>
    let video=document.getElementsByClassName("myVideo");
    video.playbackRate=0.1;
</script>
</body>
</html>
