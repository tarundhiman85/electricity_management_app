
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
    <div class="flexi">
        <%--    first col--%>
            <div class="flexItem">
                <div class="card-body text-center">
                    <div class="container">
                        <img class="img-fluid" style="height: 190px; margin-top: 10px" src="./img/profile.png"  alt="user_icon">
                    </div>
                    <a class="link" href="viewInfo.jsp"><br><br><strong>View Profile and Bill</strong></a>
            </div>
        </div>
        <%--    2nd  col--%>
            <div class="flexItem">
                <div class="card-body text-center">
                    <div class="container">
                        <img class="img-fluid" style="height: 190px; margin-top: 10px" src="./img/money-transfer.png"  alt="">
                    </div>
                    <a class="link" href="viewTransaction.jsp"><br><br><strong>View Transactions</strong></a>
                </div>
            </div>

        <%--    first col--%>
            <div class="flexItem">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="height: 190px;margin-top: 10px" src="./img/pay.png" alt="">
                    </div>
                    <a href="PayBill.jsp" class="button-4 w-button link"><br><br><strong>Pay Bill</strong></a>
                 </div>
            </div>
    </div>
    </body>
    </html>
