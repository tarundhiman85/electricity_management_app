<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculate Bill</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<%
    HttpSession httpSession = request.getSession();
    if(httpSession.getAttribute("message1")!=null){
        httpSession.setAttribute("message1","No Record Found");
        %>
<%
    }
%>
<%@include file="message.jsp"%>
<div class="container" style="color: #312d62; margin-top: 50px; font-family: 'Montserrat', sans-serif">
    <h4 style="font-weight: bolder">Enter the User Id to Search</h4>
    <form action="BillServlet" method="post">
        <input type="text" name="usId" placeholder="Enter User Id">
        <input type="submit" value="Search" id="register">
    </form>
</div>
</body>
</html>
