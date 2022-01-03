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
    <source src="./img/Electricity - 11578.mp4" type="video/mp4">
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
    <h1>Your Profile and Bill Info</h1>
</div>

<div style="top:18rem" class="servicesection">

    <div class="container">
        <div class="card-body f1">
            <p class="card-text" style="margin-top: 10px">Name: <%=bill.getUser().getUserName()%></p>
            <p class="card-text" style="margin-top: 10px">Bill Number: <%=bill.getUser().getBillNo()%></p>
            <p class="card-text">Email Address: <%=bill.getUser().getUserEmail()%></p>
            <p class="card-text">Phone Number: <%=bill.getUser().getUserPhone()%></p>
            <p class="card-text">Address: <%=bill.getUser().getUserAddress()%></p>
            <p class="card-text">Connection Type: <%=bill.getUser().getConnType()%></p>
            <p class="card-text">Dues Left: Rs.<%=bill.getDues()%>/-</p>
            <p class="card-text">Bill Amount: Rs.<%=bill.getAmount()%>/-</p>
            <div style="display: flex; justify-content: center;" class="formsectionbtn">
                <button style="margin:1rem ;" type="submit">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    Pay Bill
                </button>
            </div>
        </div>
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
