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
<%
    //getting total users
    UserDao userDao = new UserDao(FactoryProvider.getFactory());
    List<User> allUsers = userDao.getAllUsers();
%>
<div style="top:8rem" class="servicesection">
    <div style="width:18rem; height: 16rem;" class="card1 cardouter">
        <div class="cardinner">
            <img style="width: 8rem; margin-top: 1rem; margin-bottom: 1rem;" src="./img/teamwork.png" alt="" srcset="">
            <div style="text-align: center;" class="cardbody">
                <h2 style="font-size: 1.3rem;">Total Users</h2>
                <h2 style="font-size: 1.3rem;"><%=allUsers.size()%></h2>
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
                <input style="color:white;background:linear-gradient(45deg, black, transparent); border-color: transparent; color:white "  type="text" placeholder="Enter the User ID" name="id">
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
            userDao = new UserDao(FactoryProvider.getFactory());
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
            <th scope="col">User Board</th>
            <th scope="col">User Bill No</th>
            <th scope="col">User Conn Type</th>
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
            <td><%=users.getBoardType().toUpperCase()%></td>
            <td><%=users.getBillNo()%></td>
            <td><%=users.getConnType()%></td>
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
    <% } }else{%>
    <table style="background:linear-gradient(45deg, black, transparent) " class="table">
        <thead>
        <tr>
            <th scope="col">User ID</th>
            <th scope="col">User Name</th>
            <th scope="col">User Email</th>
            <th scope="col">User Board</th>
            <th scope="col">User Bill No</th>
            <th scope="col">User Conn Type</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row"><%=user.getUserId()%></th>
            <td><%=user.getUserName()%></td>
            <td><%=user.getUserEmail()%></td>
            <td><%=user.getBoardType().toUpperCase()%></td>
            <td><%=user.getBillNo()%></td>
            <td><%=user.getConnType()%></td>
            <td>
                <a href="viewInfo.jsp?user_id=<%=user.getUserId()%>" style="font-size: 17px; text-decoration: none;" class="link">Select</a>
                <a href="editUser.jsp?user_id=<%=user.getUserId()%>" style="font-size: 17px; text-decoration: none" class="link">Update</a>
                <a href="DeleteUserServlet?user_id=<%=user.getUserId()%>" style="font-size: 17px; text-decoration: none" class="link">Delete</a>
            </td>
        </tr>
        </tbody>
    </table>
        <%
    }
    }
%>
</div>
</body>
</html>