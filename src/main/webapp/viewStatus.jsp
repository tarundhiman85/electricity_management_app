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
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/Angel - 26277.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>

<div style="top:10rem" class="tablesection">

    <div class="tableform">
        <h2>Search the Status by Request Number</h2>
        <form style="display: flex; margin: 1rem;" action="RequestServlet" method="post">
            <div style="margin-right:1rem" class="searchform">
                <div  class="boximage">
                    <img style="width:2rem" src="./img/loupe.png" alt="" srcset="">
                </div>
                <input style="background:linear-gradient(45deg, black, transparent); border-color: transparent; color:white "  type="text" placeholder="Enter the User ID" name="referenceN">
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


    <table style="background:linear-gradient(45deg, black, transparent) " class="table">
        <thead>
        <tr>
            <th scope="col">User Name</th>
            <th scope="col">Request Reference Number</th>
            <th scope="col">Reqested Board </th>
            <th scope="col">Reqest Status </th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (ConnRequest connRequest1 : connRequestList){
        %>

        <tr>
            <th scope="row"><%=connRequest1.getName()%></th>
            <td><%=connRequest1.getRequestNumber()%></td>
            <td><%=connRequest1.getBoardType()%></td>
            <td><%=connRequest1.getStatus()%></td>
            <td>
                <%
                    if(connRequest1!=null && connRequest1.getStatus().equals("Pending")){
                %>
                Please Wait
                <%
                }else if(connRequest1!=null && connRequest1.getStatus().equals("Disapproved")){
                %>
                Sorry your Request is Disapproved Make Another Request
                <%}else{
                    session.setAttribute("CurrentConnection",connRequest1);
                %>
                <!-- Button trigger modal -->
                <a href="createPassword.jsp" style="font-size: 17px; text-decoration: none" class="link">Create Password</a>
                <%
                    }
                %>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <% }
    }
    else{
    %>
    <table style="background:linear-gradient(45deg, black, transparent) " class="table">
        <thead>
        <tr>
            <th scope="col">User Name</th>
            <th scope="col">Request Reference Number</th>
            <th scope="col">Requested Board </th>
            <th scope="col">Request Status </th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
               <tr>
            <th scope="row"><%=connRequest.getName()%></th>
            <td><%=connRequest.getRequestNumber()%></td>
            <td><%=connRequest.getBoardType()%></td>
            <td><%=connRequest.getStatus()%></td>
            <td>
                <%
                    if(connRequest!=null && connRequest.getStatus().equals("Pending")){
                %>
                Please Wait
                <%
                }else if(connRequest!=null && connRequest.getStatus().equals("Disapproved")){
                %>
                Sorry your Request is Disapproved Make Another Request
                <%}
                else{
                    session.setAttribute("CurrentConnection",connRequest);
                %>
                <a href="createPassword.jsp" style="font-size: 17px; text-decoration: none" class="link">Create Password</a>
                <%
                    }
                %>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <%
        }
    %>


</div>




















<%--
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
                    if(connRequest1.getStatus()!=null && connRequest1.getStatus().equals("Pending")){
                %>
                Please Wait
                <%
                }else if(connRequest.getStatus()!=null && connRequest1.getStatus().equals("Disapproved")){
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
--%>
</body>
</html>

