<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>

<video autoplay muted loop class="myVideo">
    <source src="./img/World - 1992.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>

<div style="width: 40rem; height: 40rem;" class="formsection">

    <h1>Register for New Connection</h1>
    <img id="formimg" style="width: 3rem; padding:2rem; box-sizing: content-box;" src="./img/hand (1).png" alt="" srcset="">
    <%@include file="message.jsp"%>

    <form style="width: 80%;" action="RegisterServlet" method="post">
        <div class="formrows">
            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/email.png" alt="" srcset="">
                    <label>Email Address</label>
                </div>
                <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_email" type="email" class="form-control" placeholder="Enter email">

            </div>
            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/lock (1).png" alt="" srcset="">
                    <label>Password</label>
                </div>
                <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_password" type="password" class="form-control" placeholder="Enter Password">

            </div>
        </div>
        <div class="formrows">
            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/user (2).png" alt="" srcset="">
                    <label>User Name</label>
                </div>
                <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_name" type="text" class="form-control" placeholder="Enter Name">

            </div>
            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/call.png" alt="" srcset="">
                    <label>Phone Number</label>
                </div>
                <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_phone" type="number" class="form-control" placeholder="Enter Phone Number">

            </div>
        </div>
        <div class="formrows">
            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/home (2).png" alt="" srcset="">
                    <label>Residential Address</label>
                </div>
                <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_address" type="text" class="form-control" placeholder="Residential Address">

            </div>

            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/fuse-box.png" alt="" srcset="">
                    <label>Choose Electricity Board</label>
                </div>
                <select style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="board" id="board">
                    <option value="derc">Delhi Electricity Regulatory Commission</option>
                    <option value="uhbvn">Uttar Haryana Bijli Vitran Nigam</option>
                    <option value="dhbvn">Dakshin Haryana Bijli Vitran Nigam</option>
                    <option value="pspcl">Punjab State Power Corporation Limited</option>
                </select>

            </div>
        </div>
<%--        <a style="text-decoration: none" href="login.jsp" class="text-center d-block mb-2 link">If Already a User Click Here</a>--%>
        <div style="display: flex; justify-content: center" class="formsectionbtn">
            <button type="submit"  style="margin-right:1rem ;" >
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Register
            </button>
            <button type="reset" style="margin-right:1rem ;">
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
                    <h2 class="text-center my-3"><strong>Add User Here</strong></h2>
                    <form action="RegisterServlet" method="post">
                        <div class="form-group">
                            <label for="email">User Email</label>
                            <input name="user_email" required type="email" class="form-control" id="email" placeholder="Enter your email here" aria-describedby="emailHelp" >
                        </div>
                        <div class="form-group">
                            <label for="name">User Name</label>
                            <input name="user_name" required type="text" class="form-control" id="name" placeholder="Enter your name here" aria-describedby="emailHelp" >
                        </div>
                        <div class="form-group">
                            <label for="password" >User Password</label>
                            <h6 style="font-size: xx-small;">Password must have atleast 1 capital letter and number and small case letter</h6>
                            <input name="user_password" type="password" required class="form-control" id="password" placeholder="Enter your password" aria-describedby="emailHelp" >
                        </div>
                        <div class="form-group">
                            <label for="phone" >User Phone</label>
                            <input name="user_phone" required type="number" class="form-control" id="phone" placeholder="Enter your phone" aria-describedby="emailHelp" >
                        </div>
                        <div class="form-group">
                            <label for="phone">User Address</label>
                            <input name="user_address" type="text" required class="form-control" placeholder="Enter your Address">
                        </div>
                        <div class="form-group">
                            <label for="board">Choose a Electricity Board</label>
                            <select name="board" id="board">
                                <option value="derc">Delhi Electricity Regulatory Commission</option>
                                <option value="uhbvn">Uttar Haryana Bijli Vitran Nigam</option>
                                <option value="dhbvn">Dakshin Haryana Bijli Vitran Nigam</option>
                                <option value="pspcl">Punjab State Power Corporation Limited</option>
                            </select>
                        </div>
                        <a href="login.jsp" class="text-center d-block mb-2 link">If Already a User Click Here</a>
                        <div class="container text-center">
                            <button id="register">Register</button>
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
