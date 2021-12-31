<%@ page import="java.util.List" %>
<%@ page import="project.Dao.UserDao" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View User</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/Atoms - 8579.mp4" type="video/mp4">
</video>

<%@include file="navbar.jsp"%>

<div style="top:8rem" class="servicesection">

    <div style="width:18rem; height: 16rem;" class="card1 cardouter">
        <div class="cardinner">
            <img style="width: 8rem; margin-top: 1rem; margin-bottom: 1rem;" src="./img/teamwork.png" alt="" srcset="">
            <div style="text-align: center;" class="cardbody">
                <h2 style="font-size: 1.3rem;">Total Users</h2>
                <h2 style="font-size: 1.3rem;">1300</h2>
            </div>
        </div>



    </div>

    <div style="width:18rem; height: 16rem;" class="card1 cardouter">
        <div class="cardinner">
            <img style="width: 8rem; margin-top: 1rem; margin-bottom: 1rem;" src="./img/electrical-panel.png" alt="" srcset="">
            <div style="text-align: center;" class="cardbody">
                <h2 style="font-size: 1.3rem;">Electricity Board</h2>
                <h2 style="font-size: 1.3rem;">1300</h2>
            </div>
        </div>



    </div>
    <div style="width:18rem; height: 16rem;" class="card1 cardouter">
        <div class="cardinner">
            <img style="width: 8rem; margin-top: 1rem; margin-bottom: 1rem;" src="./img/approved.png" alt="" srcset="">
            <div style="text-align: center;" class="cardbody">
                <h2 style="font-size: 1.3rem;">Actice Users</h2>
                <h2 style="font-size: 1.3rem;">1300</h2>
            </div>
        </div>



    </div>

</div>
<div class="tablesection">

    <div class="tableform">
        <h2>Search the User by Id</h2>
        <form style="display: flex; margin: 1rem;" action="SearchServlet" method="post">
            <div style="margin-right:1rem" class="searchform">
                <div  class="boximage">
                    <img style="width:2rem" src="./img/loupe.png" alt="" srcset="">
                </div>
                <input style="background:linear-gradient(45deg, black, transparent); border-color: transparent; color:white "  type="text" placeholder="Enter the User ID" name="id">
            </div>

            <input style="color: white; background-color: rgb(155, 216, 216); border-radius: 0.6rem; width: 6rem;" type="submit" value="Search">
        </form>
    </div>

    <%
        if(session.getAttribute("message1")!=null){
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message1","No Record Found");
    %>
    <%@include file="message.jsp"%>
    <%    }
    else{
        User user = (User) session.getAttribute("message");
        if(user==null){
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            List<User> userList =  userDao.getAllUsers();
            if(userList==null)
            {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message1","No Record Found");
    %>

    <div>
        <%@include file="message.jsp"%>
    </div>
    <%
    }else{
    %>


    <table style="background:linear-gradient(45deg, black, transparent) " class="table">
        <thead>
        <tr>
            <th scope="col">User ID</th>
            <th scope="col">User Name</th>
            <th scope="col">User Email</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (User users : userList){
                if(users.getRoll_id()!=1 ){
        %>

        <tr>
            <th scope="row"><%=users.getUserId()%></th>
            <td><%=users.getUserName()%></td>
            <td><%=users.getUserEmail()%></td>
            <td>
                <a href="viewInfo.jsp?user_id=<%=users.getUserId()%>" style="font-size: 17px; text-decoration: none;" class="link">Select</a>
                <a href="editUser.jsp?user_id=<%=users.getUserId()%>" style="font-size: 17px; text-decoration: none" class="link">Update</a>
                <a href="DeleteUserServlet?user_id=<%=users.getUserId()%>" style="font-size: 17px; text-decoration: none" class="link">Delete</a>
            </td>
        </tr>
        <%
                }}%>
        </tbody>
    </table>
    <% } }

    %>
    <%if(session.getAttribute("message")!=null){
        session.removeAttribute("message");
    }}
        if(session.getAttribute("message1")!=null) {
            session.removeAttribute("message1");
        }
    %>
</div>








<%--
<div>
    <h2>Search the User by Id</h2>
    <form action="SearchServlet" method="post">
    <input type="text" id="id" placeholder="Enter the Id" name="id">
    <input class="registerbtn" id="register" type="submit" value="Search">
    </form>
</div>
<%
    if(session.getAttribute("message1")!=null){
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("message1","No Record Found");
%>
<%@include file="message.jsp"%>
<%    }
    else{
        User user = (User) session.getAttribute("message");
        if(user==null){
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            List<User> userList =  userDao.getAllUsers();
            if(userList==null)
            {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message1","No Record Found");
%>

<div>
    <%@include file="message.jsp"%>
</div>
<%
    }else{
%>

<div class="">
<table class="table">
    <thead>
    <tr>
        <th scope="col">User Id</th>
        <th scope="col">User Name</th>
        <th scope="col">User Email</th>
        <th scope="col">User Phone</th>
        <th scope="col">User Address</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (User users : userList){
            if(users.getRoll_id()!=1 ){
    %>
    <tr>
        <th scope="row"><%=users.getUserId()%></th>
        <td><%=users.getUserName()%></td>
        <td id="useremail"><%=users.getUserEmail()%></td>
        <td><%=users.getUserPhone()%></td>
        <td><%=users.getUserAddress()%></td>
        <td id="useraction">
            <a href="editUser.jsp?user_id=<%=users.getUserId()%>" style="font-size: 17px;" class="link">Update</a>
            <a href="DeleteUserServlet?user_id=<%=users.getUserId()%>" style="font-size: 17px;" class="link">Delete</a>
        </td>
    </tr>
    <%
            }}%>
    </tbody>

</table>

</div>
<% } }

%>
            <%if(session.getAttribute("message")!=null){
                    session.removeAttribute("message");
                }}
                if(session.getAttribute("message1")!=null) {
                    session.removeAttribute("message1");
                }
            %> --%>
</body>
</html>
