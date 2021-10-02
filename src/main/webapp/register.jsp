<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<div class="container-fluid">
    <div class="row mt-5">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body px-5">
                    <h2 class="text-center my-3"><strong>Add User Here</strong></h2>
                    <form action="RegisterServlet" method="post">

                        <div class="form-group">
                            <label for="email">User Email</label>
                            <input name="user_email" required type="email" class="form-control" id="email" placeholder="Enter your email here" aria-describedby="emailHelp" >
                        </div>
                        <div class="form-group">
                            <label for="name">User Name</label>
                            <input name="user_name" required type="text" class="form-control" id="name" placeholder="Enter your name here" aria-describedby="emailHelp" >

                        </div>
                        <div class="form-group">
                            <label for="password" >User Password</label>
                            <input name="user_password" type="password" required class="form-control" id="password" placeholder="Enter your password" aria-describedby="emailHelp" >
                        </div>
                        <div class="form-group">
                            <label for="phone" >User Phone</label>
                            <input name="user_phone" required type="number" class="form-control" id="phone" placeholder="Enter your phone" aria-describedby="emailHelp" >
                        </div>

                        <div class="form-group">
                            <label for="phone">User Address</label>
                            <input name="user_address" type="text" required class="form-control" placeholder="Enter your Address">

                        </div>
                        <a href="login.jsp" class="text-center d-block mb-2 link">If Already a User Click Here</a>
                        <div class="container text-center">
                            <button id="register">Register</button>
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
