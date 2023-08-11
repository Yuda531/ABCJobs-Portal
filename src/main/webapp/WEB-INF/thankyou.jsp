<jsp:include page="header2.jsp">
    <jsp:param value="Thank You" name="HTMLtitle" />
</jsp:include>

	<div class="content ">
		<div class="container">
			<div class="row my-4">
				<div class="col-md-12 text-center py-1">
					<img src="img/checklist.png" alt="checklist" class="img-fluid" />
				</div>
				<div class="col-md-12 text-center py-1 ">
					<h1 class="lh-base">Thank You</h1>
					<span class="fw-bold">${email}</span>
					<h2 class="lh-base">Your registration has been received and we
						appreciate your time.</h2>
				</div>
			</div>
		</div>
	</div>
	<div class="continue text-center my-3 ">
		<button class="btn btn-primary btn-lg" data-bs-toggle="modal"
			data-bs-target="#ver">Get Confirmation</button>
	</div>


	<!-- Modal -->
	<div class="modal fade text-center" id="ver" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<i class='bx bxs-envelope fs-2'></i>
					<h2>Successful</h2>
					<p>The link has been sent it to your email</p>
					<a href="verified" class="btn btn-secondary">Continue</a>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="footer2.jsp" %>
