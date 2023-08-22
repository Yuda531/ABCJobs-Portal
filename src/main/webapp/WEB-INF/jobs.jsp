<jsp:include page="header3.jsp">
	<jsp:param value="Jobs" name="HTMLtitle" />
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.abc.utils.TimeAgoFormatter"%>

<section class="profile pt-5 pb-5" style="background-color: #eee;">
	<div class="container">
		<div class="row">
			<!-- Profile section -->
			<div class="col-lg-3 mb-3">
				<div
					class="d-flex flex-column border rounded-3 pb-4 bg-white shadow sticky-custom">
					<div
						class="col-12 border border-light rounded-3 text-center fs-1 d-flex align-items-center justify-content-center bg-primary bg-gradient text-white"
						style="height: 17vh; margin: 0 auto;">
						<span>${f}</span> <span>${l}</span>
					</div>
					<div class="px-4 py-3 text-center">
						<h2>${fullName}</h2>
						<p>${city}</p>
					</div>
					<a href="profile"
						class="btn btn-outline-primary mx-4 align-self-center">My
						Profile</a>
				</div>
			</div>

			<!-- Jobs section -->
			<div class="col-lg-6">
				<c:forEach var="jobs" items="${getJobs}">
					<div id="job-${jobs.jobsId}" class="border rounded-3 mb-3 px-3 bg-white shadow">
						<!-- Jobs header -->
						<div class="d-flex align-items-center gap-2 py-3">
							<span class="px-3 py-2 rounded-circle border bg-light">${jobs.getCompanyName().charAt(0)}</span>
							<a href="#" class="text-decoration-none fs-6 fw-bold">${jobs.companyName}</a>
							<small class="ms-auto text-secondary">${TimeAgoFormatter.format(jobs.getCreatedAt())}</small>
						</div>
						<!-- Jobs body -->
						<div class="row">
							<div class="col-2">
								<c:if test="${not empty jobs.imageCompany}">
									<img
										src="data:image/jpeg;base64,${jobs.getPostImageDataBase64()}"
										alt="Company Logo" style="max-width: 130%; height: 90%;">
								</c:if>
							</div>
							<div class="col-10 ps-3">
								<p class="fs-4 fw-bold text-primary">${jobs.jobsRole}</p>
								<small class="text-secondary">${jobs.jobsLocation}</small>
							</div>
						</div>
						<hr>
						<div class="d-flex align-items-center gap-2 pb-3">
							<a href="#" onclick="openJobModal(${jobs.jobsId})"
								class="d-flex align-items-center gap-2 btn btn-primary"
								style="border: none;"> Apply Jobs <i
								class='bx bx-right-top-arrow-circle bx-md'></i>
							</a>
						</div>
						<!-- Modal Details-->
						<div class="modal fade" id="jobModal${jobs.jobsId}" tabindex="-1"
                             aria-labelledby="jobModalLabel${jobs.jobsId}" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content one">
									<div class="modal-header">
										<h5 class="modal-title" id="jobModalLabel${jobs.jobsId}">${jobs.jobsRole}</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<p class="text-justify align-items-center"></p>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item"><strong>Company
                                                    Name:</strong> ${jobs.companyName}</li>
                                            <li class="list-group-item"><strong>Jobs
                                                    Location:</strong> ${jobs.jobsLocation}</li>
                                            <li class="list-group-item"><strong>Jobs Role:</strong>
                                                ${jobs.jobsRole}</li>
                                            <li class="list-group-item"><strong>Posted At:</strong>
                                                ${TimeAgoFormatter.format(jobs.createdAt)}</li>
                                            <li class="list-group-item"><strong>Details: </strong>
                                                ${jobs.details}</li>
									    </ul>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">
											Close</button>

										<!-- Input hidden -->
                                            <input type="hidden" name="jobId" value="${jobs.jobsId}" id="jobInput${jobs.jobsId}"/>
                                            <button id="applyButton" type="submit" class="btn btn-primary" onclick="applyJob(${jobs.jobsId})">Apply</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- Suggestion to follow -->
			<div class="col-lg-3">
				<div
					class="py-1 px-1 rounded-3 border bg-white shadow sticky-custom">
					<div>
						<h5 class="text-center mt-3">Suggestions to follow</h5>
						<hr>
					</div>
					<div class="card mb-3 border-0">
						<div class="col-lg-12">
							<div class="card-body d-flex justify-content-around">
								<div class="col-lg-9">
									<h4 class="card-title small">Carl Johnson</h4>
									<span class="card-text small">Junior Front-End Dev</span>
								</div>
								<div
									class="col-lg-3 d-flex align-items-center justify-content-end">
									<button
										class="btn btn-outline-primary btn-sm follow-btn rounded-pill"
										type="button">Follow</button>
								</div>
							</div>
							<div class="card-body d-flex justify-content-around">
								<div class="col-lg-9">
									<h4 class="card-title small">Mark Steven</h4>
									<span class="card-text small">Spring Boot Specialist</span>
								</div>
								<div
									class="col-lg-3 d-flex align-items-center justify-content-end">
									<button
										class="btn btn-outline-primary btn-sm follow-btn rounded-pill"
										type="button">Follow</button>
								</div>
							</div>
							<div class="card-body d-flex justify-content-around">
								<div class="col-lg-9">
									<h4 class="card-title small">Sakura Murai</h4>
									<span class="card-text small">UI/UX Specialist <span>
								</div>
								<div
									class="col-lg-3 d-flex align-items-center justify-content-end">
									<button
										class="btn btn-outline-primary btn-sm follow-btn rounded-pill"
										type="button">Follow</button>
								</div>
							</div>
						</div>
					</div>

					<!-- Cards for other suggestions... -->

				</div>
			</div>
		</div>
	</div>
</section>




<%@ include file="footer1.jsp"%>