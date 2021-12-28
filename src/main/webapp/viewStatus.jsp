<%@ page import="java.util.List" %>
<%@ page import="project.Dao.UserDao" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page import="project.Model.Transactions" %>
<%@ page import="project.Dao.TransactionDao" %>
<%@ page import="project.Model.ConnRequest" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Transactions</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<div id="searchid">
    <h2>Search the Transaction by Id</h2>
    <form action="RequestServlet" method="post">
        <input type="text" id="id" placeholder="Enter the Id" name="referenceN">
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
    ConnRequest connRequest=(ConnRequest) session.getAttribute("message");
    if(connRequest==null) {
            List<ConnRequest> connRequestList = new UserDao(FactoryProvider.getFactory()).getAllConnectionRequests();
        if (connRequestList == null) {
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message1", "No Record Found");
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
                            <td>User Name</td>
                            <td>Request Reference Number</td>
                            <td>Requested Board</td>
                            <td>Request Status</td>
                            <td>Action</td>
        </tr>
        <%
            for (ConnRequest connRequest1 : connRequestList){
        %>
        <tr class="top">
            <td><%=connRequest1.getName()%></td>
            <td><%=connRequest1.getRequestNumber()%></td>
            <td><%=connRequest1.getBoardType()%></td>
            <td><%=connRequest1.getStatus()%></td>
            <td>
                <%
                    if(connRequest1.getStatus().equals("Pending")){
                %>
                Please Wait
                <%
                }else if(connRequest1.getStatus().equals("Disapproved")){
                %>
                Sorry your Request is Disapproved Make Another Request
                <%}else{
                    session.setAttribute("CurrentConnection",connRequest1);
                %>
                <!-- Button trigger modal -->
                <a href="createPassword.jsp">Create Password</a>
                <%
                    }
                %>
            </td>
        </tr>
        <%}%>
    </table>
</div>
<% }
}
else{
%>
<div class="card-body">
    <table>
        <tr class="top">
            <td>User Name</td>
            <td>Request Reference Number</td>
            <td>Requested Board</td>
            <td>Request Status</td>
            <td>Action</td>
        </tr>
        <tr class="top">
                            <td><%=connRequest.getName()%></td>
                            <td><%=connRequest.getRequestNumber()%></td>
                            <td><%=connRequest.getBoardType()%></td>
                            <td><%=connRequest.getStatus()%></td>
                            <td>
                                        <%
                                    if(connRequest.getStatus().equals("Pending")){
                                        %>
                                         Please Wait
                                        <%
                                    }else if(connRequest.getStatus().equals("Disapproved")){
                                        %>
                                         Sorry your Request is Disapproved Make Another Request
                                       <%}
                                          else{
                                           session.setAttribute("CurrentConnection",connRequest);
                                       %>
                                <a href="createPassword.jsp">Create Password</a>
                                <%
                                    }
                                %>
                            </td>
                        </tr>
        <%}%>
    </table>
</div>
<%
    }
%>

</body>
</html>

