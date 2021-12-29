<%@ page import="project.Model.User" %><%
    User user1 = (User) session.getAttribute("current-User");
%>

<div class="navigation">
    <div class="navleft">
        <div class="navlogo">
            <a href="index.jsp">   <img style="width: 2rem" src="./img/electricity.png" alt="" srcset=""></a>
        </div>
        <div class="navtitle">
            <h2 style="font-size: 1.5rem">ElectroBill</h2>
        </div>
    </div>

    <%
        if(user1==null){
    %>

    <div class="navright">
        <ul>
            <li style="padding-right:0px ;" class="navitem"><img style="width: 1.5rem" src="./img/home (1).png" alt="" srcset=""> </li>
            <li style="border-bottom:1px solid gold ;" class="navitem"> <a href="index.jsp">Home</a></li>
            <li class="navitem"><a href="newConnection.jsp">New Connection Request</a></li>
            <li class="navitem"><a href="viewStatus.jsp">View Status</a></li>
            <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user.png" alt="" srcset=""><a href=""></a> </li>
            <li class="navitem"><a href="login.jsp">Login</a> </li>
            <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/sunny.png" alt="" srcset=""></li>
            <li class="navitem"><a href="indexlight.jsp">Light Mode</a> </li>
        </ul>
    </div>
</div>
    <%
    } else if(user1.getRoll_id()==2){
    %>
<div class="navright">
    <ul>
        <li style="padding-right:0px ;" class="navitem"><img style="width: 1.5rem" src="./img/home (1).png" alt="" srcset=""> </li>
        <li style="border-bottom:1px solid gold ;" class="navitem"> <a href="index.jsp">Home</a></li>
        <li class="navitem"><a href="viewInfo.jsp">Profile</a></li>
        <li class="navitem"><a href="help.jsp">Help</a></li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user.png" alt="" srcset=""><a href=""></a> </li>
        <li class="navitem"><a href="user.jsp">Welcome <%=user1.getUserName()%></a> </li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user.png" alt="" srcset=""><a href=""></a> </li>
        <li class="navitem"><a href="LogoutServlet">Logout</a> </li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/sunny.png" alt="" srcset=""></li>
        <li class="navitem"><a href="indexlight.jsp">Light Mode</a> </li>
    </ul>
</div>
</div>

<%
} else {
%>
<div class="navright">
    <ul>
        <li style="padding-right:0px ;" class="navitem"><img style="width: 1.5rem" src="./img/home (1).png" alt="" srcset=""> </li>
        <li style="border-bottom:1px solid gold ;" class="navitem"> <a href="index.jsp">Home</a></li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user.png" alt="" srcset=""><a href=""></a> </li>
        <li class="navitem"><a href="admin.jsp">Welcome <%=user1.getUserName()%></a> </li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user.png" alt="" srcset=""><a href=""></a> </li>
        <li class="navitem"><a href="LogoutServlet">Logout</a> </li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/sunny.png" alt="" srcset=""></li>
        <li class="navitem"><a href="indexlight.jsp">Light Mode</a> </li>
    </ul>
</div>
</div>
<%
    }
%>




<%--
<nav class="navbar navbar-sticky-top">
    <div class="navimg">
        <a href="index.jsp"><img  src="./img/ReBS.png" alt="" srcset=""></a>

    <a class="navbar-brand"  href="index.jsp">Electricity Bill Management</a>
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
                <a class="nav-link na" href="newConnection.jsp">New Connection</a>
            </li>
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
<div class="ml-auto">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link na" href="help.jsp" style="cursor: pointer;">Help</a>
        </li>
        <li class="nav-item">
            <a class="nav-link na" href="faq.jsp" style="cursor: pointer;">FAQ</a>
        </li>
        <li class="nav-item">
            <img class="navbarimg" style="width: 2.5em; height: auto" src="./img/userprofile.png" alt="" srcset="">
        </li>
        <li class="nav-item">
            <a class="nav-link na" href="user.jsp" style="cursor: pointer;">Welcome <%=user1.getUserName()%></a>
        </li>
        <li class="nav-item">
            <a class="nav-link na" href="LogoutServlet" style="cursor: pointer;">
                <img class="navbarimg" style="width: 2em; margin: -5px; height: auto" src="./img/logout.png" alt="" srcset="">
            </a>
        </li>
    </ul>

</div>

</nav>
<%
    } else {
%>

<div class="ml-auto">
<ul class="navbar-nav" >
    <li class="nav-item">
        <img class="navbarimg" style="width: 2.5em; height: auto" src="./img/userprofile.png" alt="" srcset="">
    </li>
    <li class="nav-item">
        <a class="nav-link na" href="admin.jsp" style="cursor: pointer;">Welcome <%=user1.getUserName()%></a>
    </li>
    <li class="nav-item">
        <a class="nav-link na" href="LogoutServlet" style="cursor: pointer;">
            <img class="navbarimg" style="width: 2em; margin: -5px; height: auto" src="./img/logout.png" alt="" srcset="">
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
--%>