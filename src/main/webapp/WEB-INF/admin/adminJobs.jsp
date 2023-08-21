<jsp:include page="../header3.jsp">
	<jsp:param value="Admin Jobs" name="HTMLtitle" />
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.abc.utils.TimeAgoFormatter"%>


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
					<div
						class="d-flex flex-column border  rounded-3 pb-4 bg-white shadow">
						<div
							class="col-12 border border-light rounded-3 text-center fs-1 d-flex align-items-center justify-content-center bg-danger bg-gradient text-white"
							style="height: 17vh; margin: 0 auto;"></div>
						<div class="px-4 py-3 text-center">
							<h2>${adminName}</h2>
						</div>
					</div>
				</div>


				<!-- Jobs Section -->
				<div class="col-lg-6">
					<div class="border rounded-3 mb-3 px-3 bg-white shadow mb-3">
						<div class="d-flex align-items-center gap-2 py-3">
							<input type="text" class="form-control rounded-pill border-2"
								placeholder="Post a Job" onclick="openPostModal()" />
						</div>

<!-- Modal Post -->
<div class="modal fade" id="postModal" tabindex="-1" aria-labelledby="postModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content one">
            <form action="/post-job" method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title" id="postModalLabel">Post a Job</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="companyName" class="form-label">Company Name</label>
                        <input type="text" class="form-control" id="companyName" name="companyName" />
                    </div>
                    <div class="mb-3">
                        <label for="jobsRole" class="form-label">Job Role</label>
                        <input type="text" class="form-control" id="jobsRole" name="jobsRole" />
                    </div>
                    <div class="mb-3">
                        <label for="jobsLocation" class="form-label">Job Location</label>
                        <input type="text" class="form-control" id="jobsLocation" name="jobsLocation" />
                    </div>
                    <div class="mb-3">
                        <label for="postDetails" class="form-label">Job Details</label>
                        <textarea placeholder="Job Details" class="form-control" id="postDetails" name="details" rows="4"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="chooseImage" class="form-label">Choose Image</label>
                        <input type="file" class="form-control" id="chooseImage" name="imageFile" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="postButton" type="submit" class="btn btn-primary">Post Job</button>
                </div>
            </form>
        </div>
    </div>
</div>


					</div>

                <c:forEach var="jobs" items="${getJobs}">
                    <div class="border rounded-3 mb-3 px-3 bg-white shadow">
                        <!-- Jobs header -->
                        <div class="d-flex align-items-center gap-2 py-3">
                            <span class="px-3 py-2 rounded-circle border bg-light">${jobs.getCompanyName().charAt(0)}</span>
                            <a href="#" class="text-decoration-none fs-5 fw-bold">${jobs.companyName}</a>
                            <small class="ms-auto text-secondary">${TimeAgoFormatter.format(jobs.getCreatedAt())}</small>
                        </div>
                        <!-- Jobs body -->
                        <div class="row">
                            <div class="col-2">
                                <c:if test="${not empty jobs.imageCompany}">
                                    <img src="data:image/jpeg;base64,${jobs.getPostImageDataBase64()}" alt="Company Logo" class="img-fluid pt-3">
                                </c:if>
                            </div>
                            <div class="col-10">
                                <p class="fs-3 fw-bold text-primary">${jobs.jobsRole}</p>
                                <small class="text-secondary">${jobs.jobsLocation}</small>
                            </div>
                        </div>
                        <hr>
                        <div class="d-flex align-items-center gap-2 pb-3">
                            <a href="#" class="d-flex align-items-center gap-2 btn btn-primary" style="border: none;">
                                Apply Jobs <i class='bx bx-right-top-arrow-circle bx-md'></i>
                            </a>
                        </div>
                    </div>
                </c:forEach>


			</div>
		</div>
	</div>
</section>

<%@ include file="../footer1.jsp"%>