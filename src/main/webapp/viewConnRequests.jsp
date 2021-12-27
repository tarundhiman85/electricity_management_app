<%@ page import="project.Model.ConnRequest" %>
<%@ page import="java.util.List" %>
<%@ page import="project.Dao.UserDao" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Connection Requests</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<%--
To Do:
first create a card in admin page that is view requests
first check the conn request table(first run a new connection request so that new table will be created)
then create a html table and display all the information by first getting a list of requests
for refrence check viewTransactions
display all the information which we get by that table
--%>
<div class="container">
    <%@include file="message.jsp"%>
    <%
        List<ConnRequest> connRequestList = new UserDao(FactoryProvider.getFactory()).getAllConnectionRequests();
        if (connRequestList == null) {
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message1", "No Record Found");
        }
        else{
            for(ConnRequest connRequest: connRequestList){
    %>
    <div class="card-body">
        <table>
            <tr class="top">
                <td>User Name</td>
                <td>User Email</td>
                <td>User Address</td>
                <td>User Phone</td>
                <td>User Board Type</td>
                <td>Action</td>
            </tr>
            <tr class="top">
                <td><%=connRequest.getName()%></td>
                <td><%=connRequest.getEmail()%></td>
                <td><%=connRequest.getAddress()%></td>
                <td><%=connRequest.getPhone()%></td>
                <td><%=connRequest.getBoardType()%></td>
                <td>
                    <form action="RegisterServlet" method="post">
                        <input type="hidden" name="user_password" value=" ">
                        <input type="hidden" name="user_name" value="<%=connRequest.getEmail()%>">
                        <input type="hidden" name="user_email" value="<%=connRequest.getEmail()%>">
                        <input type="hidden" name="user_address" value="<%=connRequest.getAddress()%>">
                        <input type="hidden" name="board" value="<%=connRequest.getBoardType()%>">
                        <input type="submit" value="Approve">
                    </form>
                    <form action="DisapproveServlet" method="post">
                        <input type="hidden" name="connId" value="<%=connRequest.getId()%>">
                        <input type="submit" value="Disapprove">
                    </form>
                </td>
            </tr>

            <%}%>
        </table>
    </div>
    <%}%>
</div>
</body>
</html>
