<%@ page import="project.Dao.UserDao" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<%
    User user = (User)session.getAttribute("current-User");
    if(user==null){
        session.setAttribute("message1","You are not logged in!!");
        response.sendRedirect("login.jsp");
        return;
    }
    else if(user.getRoll_id()==2){
        session.setAttribute("message1","You are not Admin Don't access this page");
        response.sendRedirect("index.jsp");
        return;
    }
    UserDao userDao = new UserDao(FactoryProvider.getFactory());
    long count=userDao.getNumberofUsers();
%>
<body>


<video autoplay muted loop class="myVideo">
    <source src="./img/Electricity - 11578.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>


<div style="top:10rem" class="serviceheader">
    <h1>Admin Authenticate Services</h1>
</div>

<div style="top:18rem" class="servicesection">

    <div  id="cardfirst" class="card1">
        <img  src="./img/add-friend.png" alt="" srcset="">
        <div class="cardbody">
        <a href="register.jsp"><button class="cardbtn">Add New Connection</button></a>
        </div>

    </div>
    <div id="cardsecond" class="card1">
        <img  src="./img/profile.png" alt="" srcset="">
        <div class="cardbody">
            <a href="viewUser.jsp"> <button class="cardbtn">View User</button></a>
        </div>
    </div>
    <div id="cardthird" class="card1">
        <img src="./img/bill.png" alt="" srcset="">
        <div class="cardbody">
            <a href="calculateBill.jsp"> <button class="cardbtn">Calculate Bill</button></a>
        </div>

    </div>
    <div id="cardfourth" class="card1">
        <img  src="./img/resolve.png" alt="" srcset="">
        <div class="cardbody">
          <a href="ResolveIsue.jsp">  <button class="cardbtn">View & Resolve Issue</button></a>
        </div>

    </div>
</div>



<%--

<div class="container">
    <div class="rowindex">
        <div class="colindex spcol">
            <div class="card">
                <img class="card-img-top" src="img/user.png" alt="Users">
            </div>
            <br><br><strong class="link">Number of Users : <%=count%></strong>
        </div>
        <div class="colindex">
            <div class="card">
                <img class="card-img-top" src="./img/profile.png" alt="View Bill & Profile">
            </div>
            <a class="link" href="viewUser.jsp"><br><br><strong>View User</strong></a>
        </div>
        <div class="colindex">
            <div class="card">
                <img class="card-img-top" src="img/bill.png" alt="Calculate Bill">
            </div>
            <a class="link" href="calculateBill.jsp"><br><br><strong>Calculate Bill</strong></a>
        </div>
        <div class="colindex">
            <div class="card">
                <img class="card-img-top" src="./img/add-friend.png" alt="Add User">
            </div>
            <a class="link" href="register.jsp"><br><br><strong>Add User</strong></a>
        </div>
        <div class="colindex">
            <div class="card">
                <img class="card-img-top" src="./img/resolve.png" alt="Resolve User Issues">
            </div>
            <a class="link" href="ResolveIsue.jsp"><br><br><strong>Resolve User Issues</strong></a>
        </div>
    </div>
</div>
--%>

</body>
</html>
