<jsp:include page="header2.jsp">
    <jsp:param value="Login" name="HTMLtitle" />
</jsp:include>
<%-- <%@ include file="header2.jsp" %> --%>
    <div class="container text-center content-side shadow">
        <div class="row d-flex align-items-center ">
            <div class="col-lg-7 p-3 mt-3 ">
                <img src="img/Welcomebg.png" alt="login" width="100%" class="img-fluid">
            </div>
            <div class="col-lg-5 p-3">
                <h1 class="mb-2">Sign In</h1>
                <div class="alert alert-danger alert-dismissible fade show my-3 ${ message == null ? "d-none" : "d-block" }" role="alert">
			  		${ message }
			  		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>			
				<div class="alert alert-success alert-dismissible fade show my-3 ${ scMessage == null ? "d-none" : "d-block" }" role="alert">
			  		${ scMessage }
			  		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
                <form action="login" method="post" class=" needs-validation"
                    novalidate>
                    <div class="form-group mt-3 px-3 py-1">
                        <input type="email" class="form-control" placeholder="Email Address" name="email" maxlength="50"
                            required>
                        <div class="invalid-feedback">
                            Email address should be have @ and .
                        </div>
                    </div>
                    <div class="form-group mt-3 px-3 py-1">
                        <input type="password" class="form-control" placeholder="Password" name="password"
                            maxlength="15" required>
                        <div class="invalid-feedback">
                            Password required & must be match
                        </div>
                    </div>
                    <div class="buttom text-left">
                        <button type="submit" class="btn btn-primary btn-block rounded-5">Sign In</button> <br>
                        <a href="forgotpass" class="mt-2 text-decoration-none">Forgot Password ?</a><br>
                        <p>New to ABC Jobs? <a href="registration" class="text-decoration-none">Join Now</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
<%@ include file="footer2.jsp" %>