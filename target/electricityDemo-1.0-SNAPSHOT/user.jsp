
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<div class="container">
    <div class="row mt-3">
        <%--    first col--%>
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <div class="container">
                        <img class="img-fluid" style="height: 190px; margin-top: 10px" src="./img/profile.png"  alt="user_icon">
                    </div>
                    <a class="link" href="viewInfo.jsp"><br><br><strong>View Profile and Bill</strong></a>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-3">
        <%--    first col--%>
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <div class="container">
                        <img style="margin-top: 10px" src="./img/pay.png" alt="">
                    </div>
                    <a href="PayBill.jsp" class="button-4 w-button link"><br><br><strong>Pay Bill</strong></a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
