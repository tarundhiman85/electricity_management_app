<%@ page import="project.Model.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="project.Model.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Resolve Issue</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>

<div class="card-body mt-5 container">
    <%@include file="message.jsp"%>
    <table>
        <tr class="top">
            <td>User Id</td>
            <td>Query Id</td>
            <td>Query</td>
            <td>Action</td>
        </tr>
        <%
            List<Query> queryList = new UserDao().getAllQueries();
            for (Query q : queryList){
                if(q.getResolve().equals("No")){
        %>
        <tr class="top">
            <td><%=q.getUser().getUserId()%></td>
            <td><%=q.getQueryId()%></td>
            <td><%=q.getMsg()%></td>
            <td>
                <form action="ResolveServlet" method="post">
                    <input id="register" type="submit" value="Resolve">
                    <input type="hidden" name="qId" value="<%=q.getQueryId()%>">
                </form>
            </td>
        </tr>
            <%}}%>
    </table>
</div>
</body>
</html>
