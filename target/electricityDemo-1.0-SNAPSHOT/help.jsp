
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Help - Electricity Bill Management</title>
    <%@include file="common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/Light - 5164.mp4" type="video/mp4">
</video>
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
<div style="height: 38rem; width: 150rem" class="container row my-2 formsection">
    <div class="section col-md-7">
        <%@include file="message.jsp"%>
        <form class="row g-3" action="QueryServlet" method="post">
            <h1 style="color: white">Hi, We can Help You?</h1>
            <hr>
            <div class="form-floating col-12 my-2">
                <textarea name="query" class="form-control" placeholder="Say Your Query Here" id="floatingTextarea2"
                          style="color:white;height: 100px; background: transparent;"></textarea>
            </div>
            <div class="col-12 my-2">
                <div class="formsectionbtn">
                    <button type="submit"  style="margin-right:1rem ;" >
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                        Need Help?
                    </button>
                </div>
            </div>
        </form>
    </div>
    <div class="section right col-md-5">
        <img style="width: 15rem" src="./img/help (3).png" alt="" srcset="">
    </div>
</div>
<hr>
<%}%>

</body>
</html>
