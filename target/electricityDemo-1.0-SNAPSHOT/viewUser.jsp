<%@ page import="java.util.List" %>
<%@ page import="project.Dao.UserDao" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View User</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<div id="searchid">
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
            %>
</body>
</html>
