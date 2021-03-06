<%@ page import="project.Helper.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bill Info</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/Atoms - 8579.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>
<%
    int userId=Integer.parseInt(request.getParameter("user_id").trim());
    Session s= FactoryProvider.getFactory().openSession();
    User user = s.get(User.class,userId);
%>


<div style="width: 40rem; height:45rem" class="formsection">
    <h2>Enter <%=user.getBoardType().toUpperCase()%> Bill Information</h2>
    <img id="formimg" style="width: 3rem; padding:2rem; box-sizing: content-box;" src="./img/hand (1).png" alt="" srcset="">
    <%@include file="message.jsp"%>
    <form style="width: 75%; " action="BillFormServlet" method="post">
        <div class="formcol">
            <div class="formlevel">
                <img style="width: 2rem; margin-right:1rem ;" src="./img/email.png" alt="" srcset="">
                <label>User Name</label>
            </div>
            <input style="padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem; color:white;" name="user_name" required type="text" class="form-control" value="<%=user.getUserName()%>" placeholder="Enter Name">

        </div>
        <div class="formcol">
            <div class="formlevel">
                <img style="width: 2rem; margin-right:1rem ;" src="./img/lock (1).png" alt="" srcset="">
                <label>User Address</label>
            </div>
            <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_address" required type="text" class="form-control" value="<%=user.getUserAddress()%>" placeholder="Enter Password">

        </div>
        <div class="formcol">
            <div class="formlevel">
                <img style="width: 2rem; margin-right:1rem ;" src="./img/email.png" alt="" srcset="">
                <label>Unit Consumed</label>
            </div>
            <input style=" color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="units" required class="form-control" type="text" placeholder="Enter Unit Consumed">

        </div>
        <div class="formcol">
            <div class="formlevel">
                <img style="width: 2rem; margin-right:1rem ;" src="./img/lock (1).png" alt="" srcset="">
                <label>Any Dues</label>
            </div>
            <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="dues" required class="form-control" type="text" placeholder="Enter Any Dues">

        </div>
        <input type="hidden" name="uid" value="<%=user.getUserId()%>">
        <div class="formsectionbtn">
            <button style="margin-right:1rem ;" >
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Calculate Bill
            </button>
            <button type="reset" >
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Reset
            </button>
        </div>



    </form>
</div>
</body>
</html>
