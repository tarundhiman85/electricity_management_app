<%@ page import="project.Model.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="project.Model.User" %>
<%@ page import="project.Dao.QueryDao" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Resolved Issue</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/World - 1992.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>

<div style="top:10rem" class="tablesection">
    <div class="tableform">
        <h2>User Query Status</h2>
    </div>

    <table style="background:linear-gradient(45deg, black, transparent) " class="table">
        <thead>
        <tr>
            <th scope="col">Query ID</th>
            <th scope="col">Status</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <%
                List<Query> queryList = new QueryDao(FactoryProvider.getFactory()).getAllQueries();
                User current = (User)request.getSession().getAttribute("current-User");
                for (Query q : queryList){
                    if (q.getUser().getUserId()==current.getUserId() && q.getResolve().equals("Yes")){
            %>
            <th scope="row"><%=q.getQueryId()%></th>
            <td>"<%=q.getMsg()%>" Your Query is Resolved by Admin</td>
            <%
                    }else{
            %>
            <th scope="row"><%=q.getQueryId()%></th>
            <td>"<%=q.getMsg()%>" is not resolved Yet Wait for Admin Reply</td>
            <%}
                }%>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>