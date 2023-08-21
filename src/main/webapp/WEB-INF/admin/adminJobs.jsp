<jsp:include page="../header3.jsp">
	<jsp:param value="Admin Jobs" name="HTMLtitle" />
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
								placeholder="Write a Post" onclick="openPostModal()" />
						</div>

						<!-- Modal Post -->
						<div class="modal fade" id="postModal" tabindex="-1"
							aria-labelledby="postModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content one">
									<form action="/create_thread" method="post"
										enctype="multipart/form-data">
										<div class="modal-header">
											<h5 class="modal-title" id="postModalLabel">Write a
												Thread</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<div class="mb-3">
												<label for="chooseImage" class="form-label">Choose
													Image</label> <input type="file" class="form-control"
													id="chooseFile" />
											</div>
											<div class="mb-3">
												<label for="postBody" class="form-label">Body</label>
												<textarea placeholder="What is Happening"
													class="form-control" id="postBody" rows="4"></textarea>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button id="postButton" type="submit" class="btn btn-primary">
												Post</button>
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>

					<!-- Jobs section -->
					<div class="border rounded-3 mb-3 px-3 bg-white shadow">
						<!-- Jobs header -->
						<div class="d-flex align-items-center gap-2 py-3">
							<span class="px-3 py-2 rounded-circle border bg-light">HZ</span>
							<a href="" class="text-decoration-none fs-5 fw-bold">Hazard
								Company</a> <small class="ms-auto text-secondary">berapa jam
								lalu</small>
						</div>
						<!-- Jobs body -->
						<div class="row">
							<div class="col-3">
								<img src="logo-hazard-company.png" alt="Hazard Company Logo"
									class="img-fluid rounded-circle" style="max-width: 60px;">
							</div>
							<div class="col-9">
								<p class="fs-3 fw-bold text-primary">Posisi Pekerjaan</p>
								<small class="text-secondary">Lokasi</small>
							</div>
						</div>
						<hr>
						<div class="d-flex align-items-center gap-2 pb-3">
                        	<a href=""
                        		class="d-flex align-items-center gap-2 btn btn-primary"
                        		style="border: none;"> Apply Jobs <i
                        		class='bx bx-right-top-arrow-circle bx-md'></i>
                        	</a>
                        /div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../footer1.jsp"%>