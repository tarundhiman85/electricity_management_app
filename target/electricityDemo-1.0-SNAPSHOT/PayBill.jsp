<%@ page import="project.Dao.UserDao" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page import="project.Model.Bill" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pay Bill</title>
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
<form action="PayBillServlet" method="post">
    <div class="container">
        <div class="card-body f1">
            <%@include file="message.jsp"%>
            <h2 class="text-center my-3"><strong>Pay <%=user.getBoardType().toUpperCase()%></strong></h2>
            <div class="container text-center" style="border: 1px solid black; padding-top: 13px"> <h2 class="card-title" style="font-weight: bolder">Pay Bill</h2></div>
            <p class="card-text" style="margin-top: 10px">Enter Card Number<br><input type="text"  required class="form-control"></p>
            <p class="card-text">Enter Expiry Date<br><input type="text"  required class="form-control"></p>
            <p class="card-text">Enter CVV Code<br><input type="text" required class="form-control"></p>
            <p class="card-text">Enter Due Amount<br><input type="text" placeholder="Enter between 1 to <%=bill.getDues()%>" name="due" required class="form-control"></p>
            <p class="card-text">Enter Bill Amount<br><input type="text" placeholder="Enter between 1 to <%=bill.getAmount()%>" name="billA" required class="form-control"></p>
            <div class="container text-center"><input id="register" type="submit" value="Pay"></div>
        </div>
    </div>
</form>
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
