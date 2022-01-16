<%@ page import="org.hibernate.Session" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page import="project.Model.Bill" %>
<%@ page import="project.Dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Info</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body >
<video autoplay muted loop class="myVideo">
    <source src="./img/Light - 5164.mp4" type="video/mp4">
</video>
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

<div style="top:10rem" class="serviceheader">
    <h2 style="color: goldenrod">Your Profile</h2>
</div>
<div style="top:14rem; padding: 4rem 0rem; border-top: 1px solid white; backdrop-filter: blur(10px); box-shadow: 2px 2px 10px" class="servicesection">
      <div style="width:30%; justify-content: center; display: flex;" class="container">
          <img style="width: 10rem" src="./img/profile.png">
    </div>
<div style="width:70%; flex-direction: column" class="container">
    <div class="servicecard">
        <h4 style="margin-right: 20rem" ><strong>Name:</strong> <%=bill.getUser().getUserName()%></h4>
        <h4><strong>Bill Number:</strong> <%=bill.getUser().getBillNo()%></h4>
    </div>
    <div class="servicecard">
        <h4 style="margin-right: 6rem"><strong>Connection Type:</strong>  <%=bill.getUser().getConnType()%></h4>
        <h4><strong>Phone Number:</strong>  <%=bill.getUser().getUserPhone()%> </h4>
    </div>
    <div class="servicecard">
        <h4><strong>Email Address:</strong>  <%=bill.getUser().getUserEmail()%></h4>
    </div>
    <div class="servicecard">
        <h4><strong>Address:</strong>  <%=bill.getUser().getUserAddress()%></h4>
    </div>
    <div class="servicecard">
        <h4><strong>Payment Date:</strong>  <%=bill.getReminder()%></h4>
    </div>
</div>
</div>
<div style="top:38rem" class="serviceheader">
    <h2 style="color: goldenrod">Your Bill Info</h2>
</div>
<div style="top:42rem" class="servicesection">
    <div style="flex-direction: column; width: 50%" class="container">
        <h4 ><strong>Dues Left:</strong> Rs.<%=bill.getDues()%>/-</h4>
        <h4 ><strong>Bill Amount:</strong> Rs.<%=bill.getAmount()%>/-</h4>
    </div>
    <div style="display: flex; justify-content: center; width: 30%" class="formsectionbtn">
        <a style="text-decoration: none" href="PayBill.jsp"><button style="margin:1rem ;" type="submit">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            Pay Bill
        </button>
        </a>
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