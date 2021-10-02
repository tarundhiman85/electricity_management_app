<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bill Info</title>
    <%@include file="/common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<%
    HttpSession httpSession = request.getSession();
        User user = (User) session.getAttribute("message");
%>
<div class="container-fluid">
    <div class="row mt-5">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body px-5">
                    <%@include file="message.jsp"%>
                    <h3 style="color: #312d62; font-weight: bolder" class="text-center my-3">Enter Bill Information</h3>
                    <form action="BillFormServlet" method="post">
                        <div class="form-group">
                            <label for="name">User Name</label>
                            <input name="user_name" required type="text" class="form-control" value="<%=user.getUserName()%>" id="name" placeholder="Enter your name here" aria-describedby="emailHelp" >
                        </div>
                        <div class="form-group">
                            <label for="name">User Address</label>
                            <input name="user_address" required type="text" class="form-control" placeholder="Enter your Address" value="<%=user.getUserAddress()%>">
                        </div>
                        <div class="form-group">
                            <label for="name">Unit Consumed</label>
                            <input name="units" required class="form-control" type="text" placeholder="Enter Unit Consumed">
                        </div>
                        <div class="form-group">
                            <label for="name">Any Dues</label>
                            <input name="dues" required class="form-control" type="text" placeholder="Enter Any Dues">
                        </div>
                        <div class="form-group">
                            <label for="name">Date</label>
                            <input name="date" required class="form-control" type="date" placeholder="Enter Any Dues">
                        </div>
                        <input type="hidden" name="uid" value="<%=user.getUserId()%>">
                        <div class="container text-center">
                            <button id="register">Calculate Bill</button>
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
