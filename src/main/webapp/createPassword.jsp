<%--
  Created by IntelliJ IDEA.
  User: Tarun Dhiman
  Date: 28-12-2021
  Time: 04:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Password</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<form action="CreatePasswordServlet" method="post">
    <div class="form-group">
        <h6 style="font-size: xx-small;">Password must have atleast 1 capital letter and number and small case letter</h6>
        <input name="user_password" type="password" required class="form-control"  placeholder="Enter your password" aria-describedby="emailHelp" >
    </div>
    <div class="form-group">
        <h6 style="font-size: xx-small;">Password must have atleast 1 capital letter and number and small case letter</h6>
        <input name="confirm_password" type="password" required class="form-control" placeholder="Enter your password again" aria-describedby="emailHelp" >
    </div>
    <input type="submit" value="Create Password">
</form>
</body>
</html>
