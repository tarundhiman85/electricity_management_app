
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Help - Electricity Bill Management</title>
    <%@include file="common_css_js.jsp"%>
</head>
<body class="back">
<%@include file="navbar.jsp"%>
<div class="container row my-2">
    <div class="section col-md-7">

        <form class="row g-3">
            <h1>Hi, We can Help You?</h1>
            <div class="col-md-6 my-2 ">
                <%--@declare id="inputname"--%><label for="inputName" class="form-label">Name</label>
                <input type="name" class="form-control" placeholder="First name" aria-label="First name">
            </div>
            <div class="col-md-6">
                <%--@declare id="inputbillno"--%><label for="inputBillNo" class="form-label">Electricity Bill No.</label>

                <input type="billno" class="form-control" placeholder="Electricity Bill No"
                       aria-label="Electricity Bill No">
            </div>

            <div class="col-md-6 my-2">
                <label for="inputEmail4" class="form-label">Email</label>
                <input type="emailid" placeholder="Email" class="form-control" id="inputEmail4">
            </div>
            <div class="col-md-6">
                <%--@declare id="inputphone"--%><label for="inputPhone" class="form-label">Phone No.</label>
                <input type="phone" placeholder="Phone No." class="form-control" id="inputPhoneNo">
            </div>
            <div class="form-floating col-12 my-2">
                <%--@declare id="inputquery"--%><label for="inputQuery" class="form-label">Query</label>
                <textarea class="form-control" placeholder="Say Your Query Here" id="floatingTextarea2"
                          style="height: 100px"></textarea>

            </div>

            <div class="col-12 my-2">
                <button type="submit" class="btn btn-primary">Need Help</button>
            </div>
        </form>



    </div>
    <div class="section right col-md-5">
        <img src="./img/pngaaa.com-1119855.png" alt="" srcset="">
    </div>
</div>
<hr>
<div class="container">
    <h1>Frequently Asked Question (FAQ)</h1>

    <div class="top">
        <img src="./img/pngaaa.com-4809979.png" alt="FAQ" srcset="">

    </div>
</div>
<div class="container row">

    <div class="section faqnav col-md-5">
        <ul>
            <li>All</li>
            <li>New Connection</li>
            <li>Disconnection</li>
            <li>Electricity Bill Issue</li>
            <li>Payment</li>
            <li>Login/Logout Issue</li>
        </ul>
    </div>
    <div class="section col-md-7">

        <div id="accordion">
            <div class="card">
                <div class="card-header" id="headingOne">
                    <h5 class="mb-0">
                        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Collapsible Group Item #1
                        </button>
                    </h5>
                </div>

                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                    <div class="card-body ">
                        <p class="headi">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingTwo">
                    <h5 class="mb-0">
                        <button class="btn  btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Collapsible Group Item #2
                        </button>
                    </h5>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                    <div class="card-body">
                        <p class="headi">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingThree">
                    <h5 class="mb-0">
                        <button class="btn  btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            Collapsible Group Item #3
                        </button>
                    </h5>
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                    <div class="card-body">
                       <p class="headi">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>