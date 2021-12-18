<%@ page import="project.Model.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="project.Model.User" %>
<%@ page import="project.Dao.QueryDao" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Resolved Issue</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<div class="card-body mt-5">
    <table>
        <tr class="top">
            <td>Query Id</td>
            <td>Action</td>
        </tr>
        <tr class="top">
            <%
            List<Query> queryList = new QueryDao(FactoryProvider.getFactory()).getAllQueries();
            User current = (User)request.getSession().getAttribute("current-User");
            for (Query q : queryList){
                if (q.getUser().getUserId()==current.getUserId() && q.getResolve().equals("Yes")){
            %>
                <td><%=q.getQueryId()%></td>
                <td>"<%=q.getMsg()%>" Your Query is Resolved by Admin</td>
            <%}else{
            %>
                <td><%=q.getQueryId()%></td>
                <td>"<%=q.getMsg()%>" is not resolved Yet Wait for Admin Reply</td>
            <%}}%>
        </tr>
    </table>
</div>
</body>
</html>