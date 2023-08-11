<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header1.jsp">
    <jsp:param value="Forgot Password" name="HTMLtitle" />
</jsp:include>
<%-- <%@ include file="header1.jsp" %> --%>
    <div class="container box-aja">
        <div class="row justify-content-center">
            <div class="col-md-6">
             <div class="alert alert-danger alert-dismissible fade show my-3 ${ message == null ? "d-none" : "d-block" }" role="alert">
			  		${ message }
			  		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
                <div class="card mt-5 px-5 pt-3 rounded-3 shadow-lg">
                    <h3 class="text-center mb-3">Reset Your Password</h3>
                    <p>Enter your email and we'll send you a link to reset your password</p>
                    <form action="forgotpass" method="post">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control border-3" id="floatingInput"
                                placeholder="name@example.com" name="email" required>
                            <label for="floatingInput">Email address</label>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-block my-4 rounded-5">Reset your password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<%@ include file="footer3.jsp" %>