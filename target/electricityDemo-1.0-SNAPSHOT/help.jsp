
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Help - Electricity Bill Management</title>
    <%@include file="common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<div class="container row my-2">
    <div class="section col-md-7">

        <form class="row g-3">
            <h1>Hi, We can Help You?</h1>
            <div class="col-md-6 my-2 ">
                <%--@declare id="inputname"--%><label for="inputName" class="form-label">Name</label>
                <input type="name" class="form-control" placeholder="First name" aria-label="First name">
            </div>
            <div class="col-md-6">
                <%--@declare id="inputbillno"--%><label for="inputBillNo" class="form-label">Electricity Bill No.</label>

                <input type="billno" class="form-control" placeholder="Electricity Bill No"
                       aria-label="Electricity Bill No">
            </div>

            <div class="col-md-6 my-2">
                <label for="inputEmail4" class="form-label">Email</label>
                <input type="emailid" placeholder="Email" class="form-control" id="inputEmail4">
            </div>
            <div class="col-md-6">
                <%--@declare id="inputphone"--%><label for="inputPhone" class="form-label">Phone No.</label>
                <input type="phone" placeholder="Phone No." class="form-control" id="inputPhoneNo">
            </div>
            <div class="form-floating col-12 my-2">
                <%--@declare id="inputquery"--%><label for="inputQuery" class="form-label">Query</label>
                <textarea class="form-control" placeholder="Say Your Query Here" id="floatingTextarea2"
                          style="height: 100px"></textarea>

            </div>

            <div class="col-12 my-2">
                <button type="submit" class="btn btn-primary">Need Help</button>
            </div>
        </form>



    </div>
    <div class="section right col-md-5">
        <img src="./img/pngaaa.com-1119855.png" alt="" srcset="">
    </div>
</div>


</body>
</html>
