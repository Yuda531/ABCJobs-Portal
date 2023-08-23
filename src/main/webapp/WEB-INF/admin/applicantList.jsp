<jsp:include page="headeradmin.jsp">
	<jsp:param value="Admin Jobs" name="HTMLtitle" />
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.abc.utils.TimeAgoFormatter"%>

<div class="container mt-4">
	<h1 class="text-center">Applicant List</h1>
</div>

<div class="container">
	<div class="table-responsive">
		<table class="table table-striped table-bordered table-hover mt-4">
			<thead>
				<tr>
					<th scope="col">No.</th>
					<th scope="col">Full Name</th>
					<th scope="col">Company Name</th>
					<th scope="col">Jobs Role</th>
					<th scope="col">Applied</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<% int i = 1; %>
				<c:forEach var="applyJob" items="${applicant}">
					<tr>
						<th scope="row"><%= i++ %></th>
						<td>${applyJob.userDetails.firstName}
							${applyJob.userDetails.lastName}</td>
						<td>${applyJob.jobs.companyName}</td>
						<td>${applyJob.jobs.jobsRole}</td>
						<td>${TimeAgoFormatter.format(applyJob.createdAt)}</td>
						<td>
							<div class="d-flex flex-wrap justify-content-between">
								<%-- <a href="#" class="text-decoration-none btn btn-outline-danger" onclick="showRejectModal('${user.getName()}', ${applyJob.applyJobId})"><i class="fa fa-trash" aria-hidden="true"></i>Reject User</a> --%>
								<a href="#" class="text-decoration-none btn btn-outline-primary"
									data-bs-toggle="modal"
									data-bs-target="#detailModal${applyJob.userDetails.userId}"><i
									class="fa fa-eye" aria-hidden="true"></i>Detail</a>
							</div>
						</td>
					</tr>
				</c:forEach>



				<!-- Modal Details -->
				<c:forEach var="applyJob" items="${applicant}">
					<div class="modal fade"
						id="detailModal${applyJob.userDetails.userId}" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Applicant
										Details</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<ul class="list-group list-group-flush">
										<li class="list-group-item"><strong>Full Name:</strong>
											${applyJob.userDetails.firstName}
											${applyJob.userDetails.lastName}</li>
										<li class="list-group-item"><strong>City:</strong>
											${applyJob.userDetails.city}</li>
										<li class="list-group-item"><strong>Email:</strong>
											${applyJob.userDetails.user.email}</li>
										<li class="list-group-item"><strong>Phone Number:</strong>
                                        	${applyJob.userDetails.phoneNumber}</li>
										<li class="list-group-item"><strong>Company
												Name:</strong> ${applyJob.jobs.companyName}</li>
										<li class="list-group-item"><strong>Jobs
												Location:</strong> ${applyJob.jobs.jobsLocation}</li>
										<li class="list-group-item"><strong>Jobs Role:</strong>
											${applyJob.jobs.jobsRole}</li>
										<li class="list-group-item"><strong>Applied At:</strong>
											${TimeAgoFormatter.format(applyJob.createdAt)}</li>
									</ul>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>




			</tbody>
		</table>
	</div>
</div>

<%@ include file="../footer1.jsp"%>