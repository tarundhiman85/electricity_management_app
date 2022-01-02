<%@ page import="project.Helper.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Details</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/Electricity - 11578.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>
<%
    int userId=Integer.parseInt(request.getParameter("user_id").trim());
    Session s= FactoryProvider.getFactory().openSession();
    User user = s.get(User.class,userId);
%>

<div style="height: 40rem; width: 40rem " class="formsection">

    <h2 style="margin-top:1rem">Update User Profile</h2>
    <img id="formimg" style="width: 3rem; padding:2rem; box-sizing: content-box;" src="./img/hand (1).png" alt="" srcset="">
    <%@include file="message.jsp"%>
    <form style="width: 80%;" action="UpdateUserServlet" method="post">
        <div class="formrows">
            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/user (2).png" alt="" srcset="">
                    <label>Name</label>
                </div>
                <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_name" type="text" value="<%=user.getUserName()%>" class="form-control" placeholder="Enter Name">

            </div>
            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/email.png" alt="" srcset="">
                    <label>Email Address</label>
                </div>
                <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_email" type="email" value="<%=user.getUserEmail()%>" class="form-control" placeholder="Enter Email">


            </div>
        </div>
        <div class="formrows">
            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/lock (1).png" alt="" srcset="">
                    <label>Password</label>
                </div>
                <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_password" type="password" value="<%=user.getUserPassword()%>" class="form-control" placeholder="Enter Password">

            </div>

            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/call.png" alt="" srcset="">
                    <label>Phone Number</label>
                </div>
                <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_phone" type="text" value="<%=user.getUserPhone()%>" class="form-control" placeholder="Enter PhoneNo">

            </div>
        </div>
        <input type="hidden" name="user_id" value="<%=userId%>">
        <div style="width: 90%; margin: auto;" class="formcol">
            <div class="formlevel">
                <img style="width: 2rem; margin-right:1rem ;" src="./img/home (2).png" alt="" srcset="">
                <label>Residential Address</label>
            </div>
            <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_address" type="text" value="<%=user.getUserAddress()%>" class="form-control" placeholder="Residential Address">

        </div>


        <%--    <a style="text-decoration: none" href="login.jsp" class="text-center d-block mb-2 link">If Already a User Click Here</a>--%>
        <div style="display: flex; justify-content: center;" class="formsectionbtn">
            <button style="margin:1rem ;" type="submit">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Update
            </button>
            <button  style="margin:1rem ;" type="reset" >
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Reset
            </button>
        </div>

    </form>
</div>













<%--
<div class="container-fluid">
    <%@include file="message.jsp"%>
    <div class="row mt-5">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body px-5">
                    <h4 class="text-center my-3">Edit User Here</h4>
                    <form action="UpdateUserServlet" method="post">
                        <div class="form-group">
                            <label for="email">User Email</label>
                            <input name="user_email" value="<%=user.getUserEmail()%>" required type="email" class="form-control" id="email" placeholder="Enter your email here" aria-describedby="emailHelp" >
                        </div>
                        <div class="form-group">
                            <label for="name">User Name</label>
                            <input name="user_name" value="<%=user.getUserName()%>" style="border:1px solid #72d3f1;" required type="text" class="form-control" id="name" placeholder="Enter your name here" aria-describedby="emailHelp" >
                        </div>
                        <div class="form-group">
                            <label for="password" >User Password</label>
                            <input name="user_password" value="<%=user.getUserPassword()%>" type="password" required class="form-control" id="password" placeholder="Enter your password" aria-describedby="emailHelp" >
                        </div>
                        <div class="form-group">
                            <label for="phone" >User Phone</label>
                            <input name="user_phone" value="<%=user.getUserPhone()%>" required type="number" class="form-control" id="phone" placeholder="Enter your phone" aria-describedby="emailHelp" >
                        </div>
                        <input type="hidden" name="user_id" value="<%=userId%>">
                        <div class="form-group">
                            <label for="phone">User Address</label>
                            <input name="user_address" value="<%=user.getUserAddress()%>" class="form-control" placeholder="Enter your Address">
                        </div>
                        <a href="login.jsp" class="text-center d-block mb-2 link">If Already a User Click Here</a>
                        <div class="container text-center">
                            <button id="deposit1">Update</button>
                            <button type="reset" id="reset">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

--%>


</body>
</html>
