<%@ page import="org.hibernate.Session" %>
<%@ page import="project.Controller.FactoryProvider" %>
<%@ page import="project.Model.Bill" %>
<%@ page import="project.Model.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Info</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<%
        HttpSession httpSession = request.getSession();
        User user = (User) httpSession.getAttribute("current-User");
        UserDao userDao = new UserDao(FactoryProvider.getFactory());
        Bill bill = userDao.getBillByUserId(user.getUserId());
%>
<%
    if(bill!=null){
%>
<div class="container">
    <div class="card-body f1">
        <div class="container text-center" style="border: 1px solid black; padding-top: 13px"> <h3 class="card-title" style="font-weight: bolder">Your Information and Pending Amount</h3></div>
        <p class="card-text" style="margin-top: 10px">Name: <%=bill.getUser().getUserName()%></p>
        <p class="card-text">Address: <%=bill.getUser().getUserAddress()%></p>
        <p class="card-text">Dues Left: Rs.<%=bill.getDues()%>/-</p>
        <p class="card-text">Bill Amount: Rs.<%=bill.getAmount()%>/-</p>
        <div class="container text-center" style="border: 1px solid black;"><a class="link" href="PayBill.jsp">Pay Bill</a></div>

    </div>
</div>

<%
    }else{
        httpSession.setAttribute("message1","Sorry Bill Not Calculated by Admin");
    %>
<%@include file="message.jsp"%>
<%
    }
%>
</body>
</html>
