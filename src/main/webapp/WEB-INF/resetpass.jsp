<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header1.jsp">
    <jsp:param value="Reset Password" name="HTMLtitle" />
</jsp:include>
    <div class="container box-aja">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card mt-5 px-5 pt-3 rounded-3 shadow-lg">
                    <h3 class="text-center mb-3">Reset Your Password</h3>
                    <form action="resetpass" method="post" onsubmit="return validateForm()">
					  <div class="mb-3">
					    <label for="password" class="form-label"><strong>New Password</strong></label>
					    <input type="password" class="form-control" id="password" name="password" required>
					  </div>
					  <div class="mb-3">
					    <label for="passwordConfirmation" class="form-label"><strong>New Password Confirmation</strong></label>
					    <input type="password" class="form-control" id="confpass" required>
					  </div>
					  <div class="text-center">
					    <button type="submit" class="btn btn-primary rounded-5 my-4 px-5 py-2">Update Password</button>
					  </div>
					</form>
                </div>
            </div>
        </div>
    </div>

   

<%@ include file="footer3.jsp" %>