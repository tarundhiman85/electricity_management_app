<%--login modal--%>
<div class="modal fade" id="loginExample" tabindex="-1" role="dialog" aria-labelledby="loginExampleTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card mt-3">
<%--                <div class="card-header custom-bg">--%>
<%--                    <h3>Login Here</h3>--%>
<%--                </div>--%>
                <div class="card-body">
                    <form action="LoginServlet" method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                        </div>
                        <a href="register.jsp" class="text-center d-block mb-2 link">If Not Registered Click Here</a>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
                            <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        </div>
</div>

