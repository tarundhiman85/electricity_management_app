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
<div style="height: 55rem; width: 40rem " class="formsection">
<h1>Request for New Connection</h1>
<img id="formimg" style="width: 3rem; padding:2rem; box-sizing: content-box;" src="./img/hand (1).png" alt="" srcset="">
<%@include file="message.jsp"%>
<form style="width: 80%;" action="ConnRequestServlet" method="post">
    <div class="formrows">
        <div style="width: 40%; margin: auto;" class="formcol">
            <div class="formlevel">
                <img style="width: 2rem; margin-right:1rem ;" src="./img/user (2).png" alt="" srcset="">
                <label>Name</label>
            </div>
            <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_name" type="text" class="form-control" placeholder="Enter Name">
        </div>
        <div style="width: 40%; margin: auto;" class="formcol">
            <div class="formlevel">
                <img style="width: 2rem; margin-right:1rem ;" src="./img/email.png" alt="" srcset="">
                <label>Email Address</label>
            </div>
            <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_email" type="email" class="form-control" placeholder="Enter Email">
        </div>
    </div>
    <div class="formrows">
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
        <div style="width: 40%; margin: auto;" class="formcol">
            <div class="formlevel">
                <img style="width: 2rem; margin-right:1rem ;" src="./img/call.png" alt="" srcset="">
                <label>Phone Number</label>
            </div>
            <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_phone" type="text" class="form-control" placeholder="Enter PhoneNo">
        </div>
    </div>
    <div class="formrows" style="margin-bottom: 1rem">
        <div style="width: 90%; margin: auto;" class="formcol">
            <div class="formlevel">
            <img style="width: 2rem; margin-right:1rem ;" src="./img/home (2).png" alt="" srcset="">
            <label>Choose Connection Type</label>
        </div>
        <select style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="conn_Type">
            <option value="domestic">Domestic</option>
            <option value="commercial">Commercial</option>
        </select>
    </div>
    </div>
    <div style="width: 90%; margin: auto;" class="formcol">
        <div class="formlevel">
            <img style="width: 2rem; margin-right:1rem ;" src="./img/home (2).png" alt="" srcset="">
            <label>Residential Address</label>
        </div>
        <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;" name="user_address" type="text" class="form-control" placeholder="Residential Address">
    </div>
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
</body>
</html>