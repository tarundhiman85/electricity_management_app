<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>

    <%@include file="/common_css_js1.jsp"%>

</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/Security - 2181.mp4" type="video/mp4">

</video>

<%@include file="navbar.jsp"%>


<div class="formsection">
    <h2>Login</h2>
    <img id="formimg" style="width: 3rem; padding:2rem; box-sizing: content-box;" src="./img/hand (1).png" alt="" srcset="">
    <%@include file="message.jsp"%>
    <form style="width: 75%;" action="LoginServlet" method="post">
        <div class="formcol">
            <div class="formlevel">
                <img style="width: 2rem; margin-right:1rem ;" src="./img/email.png" alt="" srcset="">
                <label>Email Address</label>
            </div>
            <input style="padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="email" type="email" class="form-control" placeholder="Enter email">

        </div>
        <div class="formcol">
            <div class="formlevel">
                <img style="width: 2rem; margin-right:1rem ;" src="./img/lock (1).png" alt="" srcset="">
                <label>Password</label>
            </div>
            <input style="padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="password" type="password" class="form-control" placeholder="Enter Password">

        </div>
        <div class="formsectionbtn">
            <button type="submit"  style="margin-right:1rem ;" >
                <span></span>
                <span></span>
                <span></span>
                <span></span>
Submit
            </button>
            <button type="reset" >
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
<div class="container-fluid a">
    <div class="row al">
        <div class="col-md-4">
<div class="card mt-3">
    <div class="card-head">
        <h3>Login Here</h3>
    </div>
    <div class="card-body">
        <%@include file="message.jsp"%>
        <form action="LoginServlet" method="post">
            <div class="form-group a">
                <label for="exampleInputEmail1">Email address</label>
                <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                <small>We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>
            <div style="margin-bottom: 15px">
                <a class="link" href="register.jsp" style="color: #312d62">If Not Registered Click Here</a>
            </div>
            <div class="container text-center">
                <button type="submit" id="register">Submit</button>
                <button type="reset" id="reset">Reset</button>
            </div>
        </form>
    </div>
</div>
</div>
</div>
</div>--%>
</body>
</html>
