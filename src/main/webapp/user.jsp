
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page import="java.util.Date" %>
<%@ page import="project.Dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
    <%@include file="/common_css_js1.jsp"%>

</head>
<%
    //check reminder of bill
    session.setAttribute("message",null);
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
        <img  src="./img/user-profile.png" alt="" srcset="">
        <div class="cardbody">
            <a href="editUser.jsp?user_id=<%=user1.getUserId()%>"> <button class="cardbtn">Update Profile</button></a>
        </div>
    </div>
    <div id="cardthird" class="card1">
        <img  src="./img/money-transfer.png" alt="" srcset="">
        <div class="cardbody">
          <a href="viewTransaction.jsp"> <button class="cardbtn">Transaction History</button></a>
        </div>
    </div>
    <div  id="cardfourth" class="card1">
        <img  src="./img/wallet.png" alt="" srcset="">
        <div class="cardbody">
            <a href="wallet.jsp"><button class="cardbtn">Wallet Money</button></a>
        </div>
    </div>
    <div id="cardfive" class="card1">
        <img  src="./img/cashless-payment.png" alt="" srcset="">
        <div class="cardbody">
            <a href="PayBill.jsp"> <button class="cardbtn"> Bill Payment</button></a>
        </div>
    </div>
    <div id="cardsix" class="card1">
        <img  src="./img/check.png" alt="" srcset="">
        <div class="cardbody">
            <a href="UserResolved.jsp"><button class="cardbtn">Check Issue Status</button></a>
        </div>
    </div>
    <div id="cardseven" class="card1">
        <img  src="./img/help (1).png" alt="" srcset="">
        <div class="cardbody">
            <a href="help.jsp">  <button class="cardbtn">Need Help?</button></a>
        </div>
    </div>
    </div>
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div style="transform: skew(0deg); height: 25rem; width:31rem; left:0rem; top:10rem" class="formsection">

                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModal2Label">Payment Alert</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <img style="width: 3rem; padding:2rem; box-sizing: content-box;" src="./img/hand (1).png" alt="" srcset="">
                <p>Dear <%=user1.getUserName()%> Please Pay Your Pending Bill</p>
                <p>Your Bill Payment Date is </p>
                <div style="display: flex; justify-content: center; width: 35%" class="formsectionbtn">
                    <a style="text-decoration: none" href="PayBill.jsp"><button style="margin:1rem ;" type="submit">
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                        Pay Bill
                    </button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<%
    if(new UserDao(FactoryProvider.getFactory()).checkReminder(user.getUserId(), new Date())){
%>
<p id="checkReminder" hidden>1</p>
<%
}else{
%>
<p id="checkReminder" hidden>0</p>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
<%
        }
    }
%>
<script>
    $(function(){
        let val = parseInt(document.getElementById("checkReminder").innerText);
        if(val===1) {

            $('#exampleModal2').modal('show');

        }
    })
</script>

</html>