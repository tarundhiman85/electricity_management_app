<%@ page import="project.Model.User" %><%
    User user1 = (User) session.getAttribute("current-User");
%>


<div class="navigation">
    <div class="navleft">
        <div class="navlogo">
            <a href="index.jsp">   <img style="width: 2rem" src="./img/electricity.png" alt="" srcset=""></a>
        </div>
        <div class="navtitle">
            <h2>ElectroBill</h2>
        </div>
    </div>

    <%
        if(user1==null){
    %>

    <div class="navright">
        <ul>
            <li style="padding-right:0px ;" class="navitem"><img style="width: 1.5rem" src="./img/home-button.png" alt="" srcset=""> </li>
            <li style="border-bottom:1px solid gold ;" class="navitem"> <a href="index.jsp">Home</a></li>
            <li class="navitem"><a href="newConnection.jsp">New Connection Request</a></li>
            <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user (1).png" alt="" srcset=""><a href=""></a> </li>
            <li class="navitem"><a href="">Login</a> </li>
            <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/sun.png" alt="" srcset=""></li>
            <li class="navitem"><a href="index.jsp">Dark Mode</a> </li>
        </ul>
    </div>
</div>
<%
} else if(user1.getRoll_id()==2){
%>
<div class="navright">
    <ul>
        <li style="padding-right:0px ;" class="navitem"><img style="width: 1.5rem" src="./img/home-button.png" alt="" srcset=""> </li>
        <li style="border-bottom:1px solid gold ;" class="navitem"> <a href="index.jsp">Home</a></li>
        <li class="navitem"><a href="viewUser.jsp">Profile</a></li>
        <li class="navitem"><a href="help.jsp">Help</a></li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user (1).png" alt="" srcset=""><a href=""></a> </li>
        <li class="navitem"><a href="user.jsp">Welcome <%=user1.getUserName()%></a> </li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user (1).png" alt="" srcset=""><a href=""></a> </li>
        <li class="navitem"><a href="/LoginServlet">Logout</a> </li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/sun.png" alt="" srcset=""></li>
        <li class="navitem"><a href="index.jsp">Dark Mode</a> </li>
    </ul>
</div>
</div>

<%
} else {
%>
<div class="navright">
    <ul>
        <li style="padding-right:0px ;" class="navitem"><img style="width: 1.5rem" src="./img/home-button.png" alt="" srcset=""> </li>
        <li style="border-bottom:1px solid gold ;" class="navitem"> <a href="index.jsp">Home</a></li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user (1).png" alt="" srcset=""><a href=""></a> </li>
        <li class="navitem"><a href="admin.jsp">Welcome <%=user1.getUserName()%></a> </li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user (1).png" alt="" srcset=""><a href=""></a> </li>
        <li class="navitem"><a href="/LoginServlet">Logout</a> </li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/sun.png" alt="" srcset=""></li>
        <li class="navitem"><a href="index.jsp">Dark Mode</a> </li>
    </ul>
</div>
</div>
<%
    }
%>




