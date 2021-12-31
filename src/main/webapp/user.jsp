<%@ page import="project.Dao.BillDao" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<%
    //check reminder of bill
    User user = (User)session.getAttribute("current-User");
    if(user==null){
        session.setAttribute("message1","You are not logged in!!");
        response.sendRedirect("login.jsp");
        return;
    }
    else {%>

<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/Electricity - 11578.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>

<div style="top:10rem" class="serviceheader">
    <h1>User Authentication Services</h1>
</div>

<div style="top:18rem" class="servicesection">

    <div id="cardfirst" class="card1">
        <img src="./img/resume.png" alt="" srcset="">
        <div class="cardbody">
            <a href="viewInfo.jsp"> <button class="cardbtn">View Bill and Profile</button></a>
        </div>

    </div>

    <div id="cardsecond" class="card1">
        <img  src="./img/money-transfer.png" alt="" srcset="">
        <div class="cardbody">
          <a href="viewTransaction.jsp"> <button class="cardbtn">Transaction History</button></a>
        </div>
    </div>

    <div  id="cardthird" class="card1">
        <img  src="./img/wallet.png" alt="" srcset="">
        <div class="cardbody">
            <a href="wallet.jsp"><button class="cardbtn">Wallet Money</button></a>
        </div>

    </div>
    <div id="cardfourth" class="card1">
        <img  src="./img/cashless-payment.png" alt="" srcset="">
        <div class="cardbody">
            <a href="PayBill.jsp"> <button class="cardbtn"> Bill Payment</button></a>
        </div>
    </div>

    <div id="cardfive" class="card1">
        <img  src="./img/check.png" alt="" srcset="">
        <div class="cardbody">
            <a href="UserResolved.jsp"><button class="cardbtn">Check Issue Status</button></a>
        </div>
    </div>
    <div id="cardsix" class="card1">
        <img  src="./img/help (1).png" alt="" srcset="">
        <div class="cardbody">
            <a href="help.jsp">  <button class="cardbtn">Need Help?</button></a>
        </div>
    </div>

</div>
<%
    if(new BillDao(FactoryProvider.getFactory()).checkReminder(user.getUserId(), new Date())){
%>
<p id="checkReminder" hidden>1</p>
<%
}else{
%>
<p id="checkReminder" hidden>0</p>
</body>
<%
        }
    }
%>
<script>
    $(function(){
        let val = parseInt(document.getElementById("checkReminder").innerText);
        if(val===1) {
            alert("You Have to Pay the Bill Now")
        }
    })
</script>
</html>