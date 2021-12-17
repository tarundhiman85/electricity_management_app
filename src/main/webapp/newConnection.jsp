
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Connection - Electricity Bill Management</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<div class="container-fluid">
    <%@include file="message.jsp"%>
    <div class="row mt-5">
        <div class="col">
            <div class="card formcard">
                <div class="card-body cardbody px-5">

                    <h3 style="color: #312d62; font-weight: bolder; font-size: 2.2rem" class="text-center my-3">New Connection Request Form</h3>
                    <form class="formbody" action="ConnRequestServlet" method="post">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input name="user_name" required type="text" class="form-control"  id="name" placeholder="Enter your name here" aria-describedby="emailHelp" >
                        </div>
                        <div class="form-group">
                            <label for="name">User Email</label>
                            <input name="user_email" required type="email" class="form-control" placeholder="Enter your Email">
                        </div>
                        <div class="form-group">
                            <label for="name">Enter Phone Number</label>
                            <input name="user_phone" required class="form-control" type="text" placeholder="Enter Phone Number">
                        </div>
                        <div class="form-group">
                            <label for="name">Enter Residential/Office Address</label>
                            <input name="user_address" required class="form-control" type="text" placeholder="Enter Address">
                        </div>
                        <div class="form-group">
                            <label for="name">Choose Connection Type</label>
                            <select name="conn_Type">
                                <option value="domestic">Domestic</option>
                                <option value="commercial">Commercial</option>
                            </select>
                        </div>
                        <div class="container formbtn text-center">
                            <button id="register">Registration</button>
                            <button type="reset" id="reset">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
