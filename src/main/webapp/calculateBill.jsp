<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculate Bill</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/Digital - 45056.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>
<%
    HttpSession httpSession = request.getSession();
    if(httpSession.getAttribute("message1")!=null){
        httpSession.setAttribute("message1","No Record Found");
        %>
<%
    }
%>


<div  style="top:12rem" class="tablesection">
<div  class="tableform">
    <h2>Enter the User Id to Search</h2>
    <%@include file="message.jsp"%>
    <form style="display: flex; margin: 1rem;" action="BillServlet" method="post">
        <div style="margin-right:1rem" class="searchform">
            <div  class="boximage">
                <img style="width:2rem" src="./img/loupe.png" alt="" srcset="">
            </div>
            <input type="text" placeholder="Enter User ID" name="usId">
        </div>

        <input style="color: white; background-color: rgb(155, 216, 216); border-radius: 0.6rem; width: 6rem;" type="submit" value="Search">
    </form>
</div>
</div>

</body>
</html>
