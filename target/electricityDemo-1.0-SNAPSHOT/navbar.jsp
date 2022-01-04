<%@ page import="project.Model.User" %><%
    User user1 = (User) session.getAttribute("current-User");
%>

<div class="navigation">
    <div class="navleft">
        <div class="navlogo">
            <a href="index.jsp"><img style="width: 2rem" src="./img/electricity.png" alt="" srcset=""></a>
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
            <li class="navitem"><a href="services.jsp">Our Services</a></li>
            <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user.png" alt="" srcset=""><a href=""></a> </li>
            <li class="navitem"><a href="login.jsp">Login</a> </li>


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
        <li class="navitem"><a href="editUser.jsp?user_id=<%=user1.getUserId()%>">Update Profile</a></li>
        <li class="navitem"><a href="help.jsp">Help</a></li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user.png" alt="" srcset=""><a href=""></a> </li>
        <li class="navitem"><a href="user.jsp">Welcome <%=user1.getUserName()%></a> </li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user.png" alt="" srcset=""><a href=""></a> </li>
        <li class="navitem"><a href="LogoutServlet">Logout</a> </li>

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
        <li class="navitem"><a href="editUser.jsp?user_id=<%=user1.getUserId()%>">Update Profile</a></li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user.png" alt="" srcset=""><a href=""></a> </li>
        <li class="navitem"><a href="admin.jsp">Welcome <%=user1.getUserName()%></a> </li>
        <li style="padding-right:0px" class="navitem"><img style="width: 1.5rem" src="./img/user.png" alt="" srcset=""><a href=""></a> </li>
        <li class="navitem"><a href="LogoutServlet">Logout</a> </li>

    </ul>
</div>
</div>

<%
    }
%>

