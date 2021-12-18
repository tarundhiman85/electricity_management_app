<%@ page import="project.Helper.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Details</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<%
    int userId=Integer.parseInt(request.getParameter("user_id").trim());
    Session s= FactoryProvider.getFactory().openSession();
    User user = s.get(User.class,userId);
%>
<div class="container-fluid">
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
</body>
</html>
