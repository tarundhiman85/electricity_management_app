<%@ page import="project.Model.User" %><%
    User user1 = (User) session.getAttribute("current-User");
%>
<nav class="navbar navbar-fixed-top">
    <a class="navbar-brand"  href="index.jsp">Electricity Bill Management</a>
    <%
        if(user1==null){
    %>
<div >
    <input type="checkbox" id="check">
    <label for="check" class="checkbt">
        <i class="fas fa-bars"></i>
    </label>
        <ul class="navbar-nav log_cursor">
        <li class="nav-item">
            <a class="nav-link na" href="login.jsp">Login</a>
        </li>
        </ul>
</div>

</nav>
    <%
    } else if(user1.getRoll_id()==2){
    %>
<div class="wel">
    <a class="nav-link na" href="user.jsp" style="cursor: pointer;">Welcome <%=user1.getUserName()%></a>
</div>
<div>
    <a class="nav-link na" href="LogoutServlet" style="cursor: pointer;">Log out</a>
</div>
</nav>
<%
    } else {
%>

<div class="wel">
    <a class="nav-link na" href="admin.jsp" style="cursor: pointer;">Welcome <%=user1.getUserName()%></a>
</div>
<div>
    <a class="nav-link na" href="LogoutServlet" style="cursor: pointer;">Log out</a>
</div>
</nav>

<%
    }
%>
