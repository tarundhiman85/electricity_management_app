<%@ page import="project.Dao.UserDao" %>
<%@ page import="project.Helper.FactoryProvider" %>
<%@ page import="project.Model.Bill" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pay Bill</title>
    <%@include file="/common_css_js1.jsp"%>
</head>
<body>
<video autoplay muted loop class="myVideo">
    <source src="./img/Money - 50291.mp4" type="video/mp4">
</video>
<%@include file="navbar.jsp"%>
<%
    HttpSession httpSession = request.getSession();
    User user = (User) httpSession.getAttribute("current-User");
    UserDao userDao = new UserDao(FactoryProvider.getFactory());
    Bill bill = userDao.getBillByUserId(user.getUserId());
%>
<%
    if(bill!=null){
%>
<div style="top:5rem" class="debitcardsection">


    <div class="debitcard">
        <div class="front">
            <div class="image">
                <img src="./img/chip.png" alt="">
                <img src="./img/maestro.png" alt="">
            </div>
            <div class="card-number-box">################</div>
            <div class="flexbox">
                <div class="box">
                    <span>card holder</span>
                    <div class="card-holder-name">full name</div>
                </div>
                <div class="box">
                    <span>expires</span>
                    <div class="expiration">
                        <span class="expiry-date">mm/yy</span>

                    </div>
                </div>
            </div>
        </div>

        <div class="back">
            <div class="stripe"></div>
            <div class="box">
                <span>cvv</span>
                <div class="cvv-box"></div>
                <img src="./img/maestro.png" alt="">
            </div>
        </div>

    </div>



    <div style="height: 65%; justify-content: center;position: initial; width: 70%; margin-left: auto; margin-right: auto; margin-top: -7rem; padding-top: 10rem;"
         class="formsection">

        <h2>Pay <%=user.getBoardType().toUpperCase()%> Electricity Bill with Debit/Credit Card</h2>
        <img id="formimg" style="width: 3rem; padding:2rem; box-sizing: content-box;" src="./img/hand (1).png" alt=""
             srcset="">
        <%@include file="message.jsp"%>
        <form style="width: 80%;" action="PayBillServlet" method="post">
            <div class="formrows">
                <div style="width: 40%; margin: auto;" class="formcol">
                    <div class="formlevel">
                        <img style="width: 2rem; margin-right:1rem ;" src="./img/pin-number.png" alt="" srcset="">
                        <label>Card Number</label>
                    </div>
                    <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;"
                           type="text" class="form-control card-number-input" placeholder="Enter Card Number">

                </div>
                <div style="width: 40%; margin: auto;" class="formcol">
                    <div class="formlevel">
                        <img style="width: 2rem; margin-right:1rem ;" src="./img/user (2).png" alt="" srcset="">
                        <label>Card Holder Name</label>
                    </div>
                    <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;"
                           type="text" class="form-control card-holder-input" placeholder="Enter Card Holder Name">


                </div>
            </div>
            <div class="formrows">
                <div style="width: 40%; margin: auto;" class="formcol">
                    <div class="formlevel">
                        <img style="width: 2rem; margin-right:1rem ;" src="./img/cvv.png" alt="" srcset="">
                        <label>CVV</label>
                    </div>
                    <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;"
                           type="text" class="form-control cvv-input" placeholder="Enter CVV Code">


                </div>

                <div style="width: 40%; margin: auto;" class="formcol">
                    <div class="formlevel">
                        <img style="width: 2rem; margin-right:1rem ;" src="./img/calendar.png" alt="" srcset="">
                        <label>Card Expiry Date</label>
                    </div>
                    <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;"
                           type="text" class="form-control expiry-input" placeholder="Enter Expiry Date">

                </div>
            </div>

            <div class="formrows" style="margin-bottom: 1rem">
                <div style="width: 40%; margin: auto;" class="formcol">
                    <div class="formlevel">
                        <img style="width: 2rem; margin-right:1rem ;" src="./img/account.png" alt="" srcset="">
                        <label>Due Ammount</label>
                    </div>
                    <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;"
                           type="text" class="form-control" placeholder="Enter <%=bill.getDues()%>" name="due">

                </div>
                <div style="width: 40%; margin: auto;" class="formcol">
                    <div class="formlevel">
                        <img style="width: 2rem; margin-right:1rem ;" src="./img/pay (1).png" alt="" srcset="">
                        <label>Pay Ammount</label>
                    </div>
                    <input style="color:white;padding: 0.3rem; margin-bottom: 1rem; border-radius: 0.4rem;"
                           type="text" class="form-control" placeholder="Enter <%=bill.getAmount()%>" name="billA">

                </div>

            </div>

            <div style="display: flex; justify-content: center;" class="formsectionbtn">
                <button style="margin:1rem ;" type="submit">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    Pay Bill
                </button>

            </div>

        </form>
    </div>

</div>
</div>
<%
}else{
    httpSession.setAttribute("message1","No bill to be Paid");
%>
<%@include file="message.jsp"%>
<%
    }
%>
<script>
    document.querySelector('.card-number-input').oninput = () =>{
        document.querySelector('.card-number-box').innerText = document.querySelector('.card-number-input').value;
    }

    document.querySelector('.card-holder-input').oninput = () =>{
        document.querySelector('.card-holder-name').innerText = document.querySelector('.card-holder-input').value;
    }

    document.querySelector('.expiry-input').oninput = () =>{
        document.querySelector('.expiry-date').innerText = document.querySelector('.expiry-input').value;
    }

    document.querySelector('.cvv-input').onmouseenter = () =>{
        document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(-180deg)';
        document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(0deg)';
    }

    document.querySelector('.cvv-input').onmouseleave = () =>{
        document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(0deg)';
        document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(180deg)';
    }

    document.querySelector('.cvv-input').oninput = () =>{
        document.querySelector('.cvv-box').innerText = document.querySelector('.cvv-input').value;
    }
</script>
</body>
</html>
