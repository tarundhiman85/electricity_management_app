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
        httpSession.setAttribute("message","You are not logged in Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    Balance balance = new UserDao(FactoryProvider.getFactory()).getBalanceByUserId(user.getUserId(), user);

    Bill bill = new UserDao(FactoryProvider.getFactory()).getBillByUserId(user.getUserId());
    %>

<head>
    <title>Wallet</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>

<div class="container admin">
    <div class="container-fluid mt-3">
        <%@include file="message.jsp"%>
    </div>
    <div class="row mt-3">
        <%--    First col--%>
        <div class="col-md-4">
            <%--first-box--%>
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/availableBalance.png" alt="user_icon">
                    </div>
                    <h1><%=balance.getAvailBalance()%></h1>
                    <h1 class="text-uppercase text-muted">
                        Available Balance
                    </h1>
                </div>
            </div>
        </div>
        <%--Second col--%>
        <div class="col-md-4">
            <div class="card"  data-toggle="modal" data-target="#exampleModal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/addBalance.png" alt="user_icon">
                    </div>
                    <h1 class="text-uppercase text-muted">
                        Add Balance
                    </h1>
                </div>
            </div>
        </div>
            <div class="col-md-4">
            <div class="card"  data-toggle="modal" data-target="#exampleModal1">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/PayBillWithBalance.png" alt="user_icon">
                    </div>
                    <h1 class="text-uppercase text-muted">
                        Pay Bill With Wallet
                    </h1>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Payment</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="AddBalanceServlet" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Enter Card Number" required/>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Enter CVV Number" required/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="balance" class="form-control" placeholder="Enter Balance" required/>
                    </div>
                    <div class="form-group text-center">
                        <input type="submit" value="Add Balance"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Add Payment</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <%
                    if(bill!=null){
                %>
                <form action="PayBillWithWalletServlet" method="post">
                    <div class="form-group">
                        <input type="text" placeholder="Enter Dues  <%=bill.getDues()%>" name="due" required class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="text" placeholder="Enter Amount  <%=bill.getAmount()%>" name="billA" required class="form-control">
                    </div>
                    <div class="form-group text-center">
                        <input type="submit" value="Pay Bill"/>
                    </div>
                </form>
                <%}else{
                %>
                <p>No Bill to be Paid</p>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
