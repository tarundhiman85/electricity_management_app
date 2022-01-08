<%@ page import="project.Model.ConnRequest" %>
<%@ page import="java.util.List" %>
<%@ page import="project.Dao.UserDao" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Connection Requests</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/World - 1992.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>
<div style="top:10rem" class="tablesection">
    <div class="tableform">
        <h2>New Connection Requests</h2>
    </div>
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
    <table style="background:linear-gradient(45deg, black, transparent) " class="table">
        <thead>
        <tr>
            <th scope="col">User Name</th>
            <th scope="col">User Email</th>
            <th scope="col">User Address</th>
            <th scope="col">Phone No</th>
            <th scope="col">User Board Type</th>
            <th scope="col">Connection Type</th>
            <th scope="col">Status</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row"><%=connRequest.getName()%></th>
            <td><%=connRequest.getEmail()%></td>
            <td><%=connRequest.getAddress()%></td>
            <td><%=connRequest.getPhone()%></td>
            <td><%=connRequest.getBoardType()%></td>
            <td><%=connRequest.getConnType()%></td>
            <td><%=connRequest.getStatus()%></td>
            <td>
                <%
                    if(connRequest.getStatus().equals("Approved")){
                %>
                Request Approved
                <%}else{%>
                <form action="CreateUserServlet" method="post">
                    <input type="hidden" name="user_password" value=" ">
                    <input type="hidden" name="user_name" value="<%=connRequest.getName()%>">
                    <input type="hidden" name="user_email" value="<%=connRequest.getEmail()%>">
                    <input type="hidden" name="user_address" value="<%=connRequest.getAddress()%>">
                    <input type="hidden" name="user_phone" value="<%=connRequest.getPhone()%>">
                    <input type="hidden" name="board" value="<%=connRequest.getBoardType()%>">
                    <input type="hidden" name="conn_type" value="<%=connRequest.getConnType()%>">
                    <input type="hidden" name="connId" value="<%=connRequest.getRequestNumber()%>">
                    <div style="display: flex; " class="formsectionbtn">
                        <button style="top:0rem; padding: 3px 15px" type="submit">
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            Approve
                        </button>
                    </div>
                </form>
                <form action="DisapproveServlet" method="post">
                    <input type="hidden" name="connId" value="<%=connRequest.getId()%>">
                    <div style="display: flex; " class="formsectionbtn">
                        <button style="top:0rem; padding: 3px 15px" type="submit">
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            DisApprove
                        </button>
                    </div>
                </form>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
        <%}}%>
</div>
</body>
</html>
