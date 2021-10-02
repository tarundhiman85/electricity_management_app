
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<div class="container-fluid a">
    <div class="row al">
        <div class="col-md-4">
<div class="card mt-3">
    <div class="card-head">
        <h3>Login Here</h3>
    </div>
    <div class="card-body">
        <%@include file="message.jsp"%>
        <form action="LoginServlet" method="post">
            <div class="form-group a">
                <label for="exampleInputEmail1">Email address</label>
                <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                <small>We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>
            <div style="margin-bottom: 15px">
                <a class="link" href="register.jsp" style="color: #312d62">If Not Registered Click Here</a>
            </div>
            <div class="container text-center">
                <button type="submit" id="register">Submit</button>
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
