<%@ page import="project.Model.User" %><%
    User user1 = (User) session.getAttribute("current-User");
%>
<nav class="navbar navbar-sticky-top">
    <div class="navimg">
        <a href="index.jsp"><img  src="./img/ReBS.png" alt="" srcset=""></a>



    <%--<a class="navbar-brand"  href="index.jsp">Electricity Bill Management</a>--%>
    </div>
    <%
        if(user1==null){
    %>
<div>
    <input type="checkbox" id="check">
    <label for="check" class="checkbt">
        <i class="fas fa-bars"></i>
    </label>
        <ul class="navbar-nav log_cursor">
            <li class="nav-item">
                <a class="nav-link na" href="help.jsp">Help</a>
            </li>
            <li class="nav-item">
                <a class="nav-link na" href="faq.jsp">FAQ</a>
            </li>
            <li class="nav-item">
               <a href="login.jsp"><img class="navbarimg" style="width: 3em; height: auto" src="./img/login.png" alt="" srcset=""></a>
            </li>

        </ul>
</div>

</nav>
    <%
    } else if(user1.getRoll_id()==2){
    %>
<div class="wel">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link na" href="help.jsp" style="cursor: pointer;">Help</a>
        </li>
        <li class="nav-item">
            <a class="nav-link na" href="faq.jsp" style="cursor: pointer;">FAQ</a>
        </li>
        <li class="nav-item">
            <img class="navbarimg" style="width: 3em; height: auto" src="./img/userprofile.png" alt="" srcset="">
        </li>
        <li class="nav-item">
            <a class="nav-link na" href="user.jsp" style="cursor: pointer;">Welcome <%=user1.getUserName()%></a>
        </li>
        <li class="nav-item">
            <a class="nav-link na" href="LogoutServlet" style="cursor: pointer;">
                <img class="navbarimg" style="width: 3em; height: auto" src="./img/logout.png" alt="" srcset="">
            </a>
        </li>
    </ul>

</div>

</nav>
<%
    } else {
%>

<div class="wel">
<ul class="navbar-nav" >
    <li class="nav-item">
        <img class="navbarimg" style="width: 3em; height: auto" src="./img/userprofile.png" alt="" srcset="">
    </li>
    <li class="nav-item">
        <a class="nav-link na" href="admin.jsp" style="cursor: pointer;">Welcome <%=user1.getUserName()%></a>
    </li>
    <li class="nav-item">
        <a class="nav-link na" href="LogoutServlet" style="cursor: pointer;">
            <img class="navbarimg" style="width: 3em; height: auto" src="./img/logout.png" alt="" srcset="">
        </a>
    </li>
</ul>

</div>
<div>

</div>
</nav>

<%
    }
%>
