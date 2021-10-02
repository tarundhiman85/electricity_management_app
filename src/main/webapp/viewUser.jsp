<%@ page import="java.util.List" %>
<%@ page import="project.Model.UserDao" %>
<%@ page import="project.Controller.FactoryProvider" %>
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
    <input id="register" type="submit" value="Search">
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
<div class="card-body">
      <table>
          <tr class="top">
              <td>User Id</td>
              <td>User Name</td>
              <td>User Email</td>
              <td>User Phone</td>
              <td>User Address</td>
              <td>Action</td>
          </tr>
          <%
              for (User users : userList){
                  if(users.getRoll_id()!=1 ){
          %>
          <tr class="top">
              <td><%=users.getUserId()%></td>
              <td><%=users.getUserName()%></td>
              <td><%=users.getUserEmail()%></td>
              <td><%=users.getUserPhone()%></td>
              <td><%=users.getUserAddress()%></td>
              <td>
                  <a href="editUser.jsp?user_id=<%=users.getUserId()%>" style="font-size: 17px;" class="link">Update</a>
                  <a href="DeleteUserServlet?user_id=<%=users.getUserId()%>" style="font-size: 17px;" class="link">Delete</a>
              </td>
          </tr>
<%
              }}%>
      </table>
</div>
          <% } }
           else {
               %>
<div class="card-body">
    <table>
        <tr class="top">
            <td>User Id</td>
            <td>User Name</td>
            <td>User Email</td>
            <td>User Phone</td>
            <td>User Address</td>
            <td>Action</td>
        </tr>
        <tr class="top">
            <td><%=user.getUserId()%></td>
            <td><%=user.getUserName()%></td>
            <td><%=user.getUserEmail()%></td>
            <td><%=user.getUserPhone()%></td>
            <td><%=user.getUserAddress()%></td>
            <td>
                <a href="editUser.jsp?user_id=<%=user.getUserId()%>" style="font-size: 17px;" class="link">Update</a>
                <a href="DeleteUserServlet?user_id=<%=user.getUserId()%>" style="font-size: 17px;" class="link">Delete</a>
            </td>
        </tr>
    </table>
</div>
            <%if(session.getAttribute("message")!=null){
                    session.removeAttribute("message");
                }}}
                if(session.getAttribute("message1")!=null) {
                    session.removeAttribute("message1");
                }
            %>
</body>
</html>
