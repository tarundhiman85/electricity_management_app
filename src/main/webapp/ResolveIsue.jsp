<%@ page import="project.Model.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="project.Dao.QueryDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Resolve Issue</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/World - 1992.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>



<div style="top:10rem" class="tablesection">
    <div class="tableform">
        <h2>Users Query</h2>
    </div>

    <table style="background:linear-gradient(45deg, black, transparent) " class="table">
        <thead>
        <tr>
            <th scope="col">User ID</th>
            <th scope="col">Query ID</th>
            <th scope="col">Query Message</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Query> queryList = new QueryDao().getAllQueries();
            for (Query q : queryList){
                if(q.getResolve().equals("No")){
        %>

        <tr>

            <th scope="row"><%=q.getUser().getUserId()%></th>
            <td><%=q.getQueryId()%></td>
            <td><%=q.getMsg()%></td>
            <td>
                <form action="ResolveServlet" method="post">
                    <div style="display: flex; " class="formsectionbtn">
                        <button style="margin-top:0rem; padding:3px 15px;" type="submit">
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            Resolve
                        </button>

                    </div>

                    <input type="hidden" name="qId" value="<%=q.getQueryId()%>">
                </form>
            </td>
        </tr>
        <%}}%>
        </tbody>
    </table>
</div>
</body>
</html>
