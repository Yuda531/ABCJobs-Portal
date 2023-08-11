<jsp:include page="headeradmin.jsp">
    <jsp:param value="Admin Dashboard" name="HTMLtitle" />
</jsp:include>


<section class="profile pt-5 pb-5" style="background-color: #eee;">
	<div class="container">
		<div class="row">
			<div
				class="alert alert-success alert-dismissible fade show my-3 ${ message == null ? "
				d-none" : "d-block" }" role="alert">
				${ message }
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<div class="row">
				<div class="col-lg-3 mb-3">
				    <div class="d-flex flex-column border  rounded-3 pb-4 bg-white shadow">
				        <div class="col-12 border border-light rounded-3 text-center fs-1 d-flex align-items-center justify-content-center bg-danger bg-gradient text-white"
				            style="height: 17vh; margin: 0 auto;">
				        </div>
				        <div class="px-4 py-3 text-center">
				            <h2>${adminName}</h2>
				        </div>
				    </div>
				</div>


				<!-- welcome Section -->
				<div class="col-lg-9">
					<h1>Welcome Home, ${adminName}</h1>
					  <a href="send-bulk" class="btn btn-outline-primary">Send bulk email</a>
					  <a href="all-users" class="btn btn-outline-primary">Show All Users</a>
				</div>

				
			</div>
		</div>
	</div>
</section>

<%@ include file="../footer1.jsp"%>