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
            <a href="viewUser.jsp"> <button class="cardbtn">View Bill and Profile</button></a>
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
        <img  src="./img/yourResolved.png" alt="" srcset="">
        <div class="cardbody">
            <a href="UserResolved.jsp"><button class="cardbtn">View Resolved Issue</button></a>
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


<%--
<div class="container">
    <div class="rowindex">
        <div class="colindex spcol">
            <div class="card">
                <img class="card-img-top" src="./img/profile.png" alt="View Bill & Profile">
            </div>
            <a class="link" href="viewInfo.jsp"><br><br><strong>View Profile and Bill</strong></a>
        </div>
        <div class="colindex">
            <div class="card">
                <img class="card-img-top" src="./img/money-transfer.png" alt="View Transaction">
            </div>
            <a class="link" href="viewTransaction.jsp"><br><br><strong>View Transaction</strong></a>
        </div>
        <div class="colindex">
            <div class="card">
                <img class="card-img-top" src="./img/pay.png" alt="Pay Bill">
            </div>
            <a class="link" href="PayBill.jsp"><br><br><strong>Pay Bill</strong></a>
        </div>
        <div class="colindex">
            <div class="card">
                <img class="card-img-top" src="./img/yourResolved.png" alt="Resolve Issue">
            </div>
            <a class="link" href="UserResolved.jsp"><br><br><strong>Check Resolved Issues</strong></a>
        </div>
        <div class="colindex">
            <div class="card">
                <img class="card-img-top" src="./img/wallet.png" alt="Resolve Issue">
            </div>
            <a class="link" href="wallet.jsp"><br><br><strong>Wallet</strong></a>
        </div>
    </div>
</div>
</div>--%>


</html>
