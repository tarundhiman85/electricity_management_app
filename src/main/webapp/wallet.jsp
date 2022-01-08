<%@ page import="project.Helper.FactoryProvider" %>
<%@ page import="project.Dao.UserDao" %>
<%@ page import="project.Model.Balance" %>
<%@ page import="project.Model.Bill" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    HttpSession httpSession = request.getSession();
    User user=(User)httpSession.getAttribute("current-User");
    if(user==null)
    {
        httpSession.setAttribute("message1","You are not logged in Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    Balance balance = new UserDao(FactoryProvider.getFactory()).getBalanceByUserId(user.getUserId(), user);
    Bill bill = new UserDao(FactoryProvider.getFactory()).getBillByUserId(user.getUserId());
    %>
<head>
    <title>My Wallet</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/Atoms - 8579.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>
<div style="top:10rem" class="serviceheader">
    <%@include file="message.jsp"%>
</div>
<div style="top:18rem" class="servicesection">
    <div style="width:18rem; height: 16rem;" class="card1 cardouter">
        <div class="cardinner" >
            <img style="width: 8rem; margin-top: 1rem; margin-bottom: 1rem;" src="./img/balance.png" alt="" srcset="">
            <div style="text-align: center;" class="cardbody">
                <h2 style="font-size: 1.3rem;">Availiable Balance</h2>
                <h2><%=balance.getAvailBalance()%></h2>
            </div>
        </div>
    </div>
    <div style="width:18rem; height: 16rem;" class="card1 cardouter">
        <div class="cardinner "  data-bs-toggle="modal" data-bs-target="#exampleModal">
            <img style="width: 8rem; margin-top: 1rem; margin-bottom: 1rem;" src="./img/addBalance.png" alt="" srcset="">
            <div style="text-align: center;" class="cardbody">
                <h2 style="font-size: 1.3rem;">Add Balance</h2>
            </div>
        </div>
    </div>
    <div style="width:18rem; height: 16rem;" class="card1 cardouter" >
        <div class="cardinner " data-bs-toggle="modal" data-bs-target="#exampleModal1" >
            <img style="width: 8rem; margin-top: 1rem; margin-bottom: 1rem;" src="./img/wallet (3).png" alt="" srcset="">
            <div style="text-align: center;" class="cardbody">
                <h2 style="font-size: 1.3rem;">Pay Bill with Wallet</h2>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div style="transform: skew(0deg); height: 40rem; left:0rem; top:10rem" class="formsection">
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">Add Balance</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <img style="width: 3rem; padding:2rem; box-sizing: content-box;" src="./img/hand (1).png" alt="" srcset="">
            <form style="width:80%" action="AddBalanceServlet" method="post">
                <div class="formcol">
                    <div style="margin: 0.3rem" class="formlevel">
                        <img style="width: 2rem; margin-right:1rem ;" src="./img/credit-card.png" alt="" srcset="">
                        <label style="font-size: 1rem">Card Number</label>
                    </div>
                    <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" required type="text" class="form-control" placeholder="Enter Card Number">
                </div>
                <div class="formcol">
                    <div  style="margin: 0.3rem"class="formlevel">
                        <img style="width: 2rem; margin-right:1rem ;" src="./img/credit-card (1).png" alt="" srcset="">
                        <label style="font-size: 1rem">CVV Number</label>
                    </div>
                    <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" required type="text" class="form-control" placeholder="Enter CVV Number">
                </div>
                <div class="formcol">
                    <div  style="margin: 0.3rem"class="formlevel">
                        <img style="width: 2rem; margin-right:1rem ;" src="./img/money.png" alt="" srcset="">
                        <label style="font-size: 1rem">Balance</label>
                    </div>
                    <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="balance" required type="text" class="form-control" placeholder="Enter Balance">
                </div>
                <div class="formsectionbtn">
                    <button type="submit"  style="margin-right:1rem ;" >
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                        Add Balance
                    </button>
                </div>
            </form>
        </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div style="transform: skew(0deg); left:0rem; top:10rem; height: 40rem" class="formsection">
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel1">Bill Payment</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <img id="formimg" style="width: 3rem; padding:2rem; box-sizing: content-box;" src="./img/hand (1).png" alt="" srcset="">
            <div style="width:80%" class="modal-body">
                <%
                    if(bill!=null){
                %>
                <form  action="PayBillWithWalletServlet" method="post">
                    <div class="formcol">
                        <div style="margin: 0.3rem" class="formlevel">
                            <img style="width: 2rem; margin-right:1rem ;" src="./img/account.png" alt="" srcset="">
                            <label style="font-size: 1rem">Bill Dues Ammount </label>
                        </div>
                        <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" required name="due" type="text" class="form-control" placeholder="Dues Ammount  RS.<%=bill.getDues()%>">
                    </div>
                    <div class="formcol">
                        <div  style="margin: 0.3rem"class="formlevel">
                            <img style="width: 2rem; margin-right:1rem ;" src="./img/pay (1).png" alt="" srcset="">
                            <label style="font-size: 1rem">Bill Pay Ammount</label>
                        </div>
                        <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" required name="billA" type="text" class="form-control" placeholder="Pay Ammount  RS.<%=bill.getAmount()%>">
                    </div>
                    <div class="formsectionbtn">
                        <button type="submit"  style="margin-right:1rem ;" >
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            Pay Bill
                        </button>
                    </div>
                </form>
                <%}else{
                %>
                <h4>No Bill to be Paid</h4>
                <%
                    }
                %>
            </div>
        </div>
            </div>
    </div>
</div>
</body>
</html>