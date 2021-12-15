
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Help - Electricity Bill Management</title>
    <%@include file="common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<%
    User user = (User)session.getAttribute("current-User");
    if(user==null){
        session.setAttribute("message1","You are not logged in!!");
        response.sendRedirect("login.jsp");
        return;
    }
    else{
%>
<div class="container row my-2">
    <div class="section col-md-7">
        <%@include file="message.jsp"%>
        <form class="row g-3" action="QueryServlet" method="post">
            <h1>Hi, We can Help You?</h1>
            <hr>
            <div class="form-floating col-12 my-2">
                <%--@declare id="inputquery"--%><label for="inputQuery" class="form-label">Query</label>
                <textarea name="query" class="form-control" placeholder="Say Your Query Here" id="floatingTextarea2"
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
<hr>
<%}%>

</body>
</html>
