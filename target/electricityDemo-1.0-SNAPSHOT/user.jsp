
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
    <%@include file="/common_css_js.jsp"%>
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

<body class="back">
<%@include file="navbar.jsp"%>
<div class="container">
    <div class="rowindex">
        <div class="colindex spcol">
            <div class="card">
                <img class="card-img-top" src="./img/profile.png" alt="View Bill & Profile">
            </div>
            <a class="link" href="viewInfo.jsp"><br><br><strong>pay.png</strong></a>
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
    </div>
</div>
    </body>
<%}%>
</html>
