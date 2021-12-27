
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Connection - Electricity Bill Management</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/World - 1992.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>

<div style="width: 40rem; height: 43rem;" class="formsection">
    <%@include file="message.jsp"%>

    <h1>Request for New Connection</h1>
    <img id="formimg" style="width: 3rem; padding:2rem; box-sizing: content-box;" src="./img/hand (1).png" alt="" srcset="">
    <form style="width: 80%;" action="ConnRequestServlet" method="post">
        <div class="formrows">
            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/user (2).png" alt="" srcset="">
                    <label>Name</label>
                </div>
                <input style="padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="name" type="name" class="form-control" placeholder="Enter Name">

            </div>
            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/email.png" alt="" srcset="">
                    <label>Email Address</label>
                </div>
                 <input style="padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="email" type="email" class="form-control" placeholder="Enter email">

            </div>
        </div>
        <div class="formrows">
            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/fuse-box.png" alt="" srcset="">
                    <label>Choose Electricity Board</label>
                </div>
                <select style="padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="board" id="board">
                    <option value="derc">Delhi Electricity Regulatory Commission</option>
                    <option value="uhbvn">Uttar Haryana Bijli Vitran Nigam</option>
                    <option value="dhbvn">Dakshin Haryana Bijli Vitran Nigam</option>
                    <option value="pspcl">Punjab State Power Corporation Limited</option>
                </select>
            </div>

            <div style="width: 40%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/call.png" alt="" srcset="">
                    <label>Phone Number</label>
                </div>
                <input style="padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="password" type="password" class="form-control" placeholder="Enter Password">

            </div>
        </div>
        <div class="formrows">
            <div style="width: 90%; margin: auto;" class="formcol">
                <div class="formlevel">
                    <img style="width: 2rem; margin-right:1rem ;" src="./img/home (2).png" alt="" srcset="">
                    <label>Resedential Address</label>
                </div>
                <input style="padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="email" type="email" class="form-control" placeholder="Enter email">

            </div>

        </div>
        <a style="text-decoration: none" href="login.jsp" class="text-center d-block mb-2 link">If Already a User Click Here</a>
        <div style="display: flex; justify-content: center;" class="formsectionbtn">
            <button style="margin:1rem ;" type="submit">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Submit
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
<div class="container">
    <%@include file="message.jsp"%>
    <div class="row mt-5">
        <div class="col">
            <div class="card formcard">
                <div class="card-body cardbody px-5">

                    <h3 style="color: #312d62; font-weight: bolder; font-size: 2.2rem" class="text-center my-3">New Connection Request Form</h3>
                    <form class="formbody" action="ConnRequestServlet" method="post">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input name="user_name" required type="text" class="form-control"  id="name" placeholder="Enter your name here" aria-describedby="emailHelp" >
                        </div>
                        <div class="form-group">
                            <label for="name">User Email</label>
                            <input name="user_email" required type="email" class="form-control" placeholder="Enter your Email">
                        </div>
                        <div class="form-group">
                            <label for="name">Enter Phone Number</label>
                            <input name="user_phone" required class="form-control" type="text" placeholder="Enter Phone Number">
                        </div>
                        <div class="form-group">
                            <label for="name">Enter Residential/Office Address</label>
                            <input name="user_address" required class="form-control" type="text" placeholder="Enter Address">
                        </div>
                        <div class="form-group">
                            <label for="name">Choose Connection Type</label>
                            <select name="conn_Type">
                                <option value="domestic">Domestic</option>
                                <option value="commercial">Commercial</option>
                            </select>
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
                        <div class="container formbtn text-center">
                            <button id="register">Registration</button>
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
