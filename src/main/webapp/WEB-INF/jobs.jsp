<jsp:include page="header3.jsp">
	<jsp:param value="Jobs" name="HTMLtitle" />
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.abc.utils.TimeAgoFormatter"%>

<section class="profile pt-5 pb-5" style="background-color: #eee;">
	<div class="container">
		<div class="row">
			<%
			if (session.getAttribute("isLogin") != null && session.getAttribute("roleId").toString().equals("1")) {
			%>
			<div class="row mb-5 p-3 rounded shadow bg-primary">
				<div
					class="d-flex flex-lg-row justify-content-between align-items-center">
					<h3 class="text-white">Welcome Back, ${fullName} !</h3>
					<a href="admin" class="btn btn-success border-1 border-white"
						style="width: max-content;">Admin Home <i
						class="fa fa-arrow-circle-right ps-5" style="font-size: 20px"></i></a>
				</div>
			</div>
			<%
			}
			%>
			<div class="row">
				<div class="col-lg-3 mb-3">
					<div
						class="d-flex flex-column border  rounded-3 pb-4 bg-white shadow sticky-custom">
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


				<!-- Jobs Section -->
				<div class="col-lg-6">
					<div class="border rounded-3 mb-3 px-3 bg-white shadow mb-3">
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
						<!-- Apply Jobs buttons -->
						<div class="d-flex align-items-center gap-2 pb-3">
							<a href=""
								class="d-flex align-items-center gap-2 btn btn-primary"
								style="border: none;"> Apply Jobs <i
								class='bx bx-right-top-arrow-circle bx-md'></i>
							</a>
						</div>
					</div>



				</div>

				<!-- suggestion to follow -->
				<div class="col-lg-3">
					<div
						class="py-1 px-1 rounded-3 border bg-white shadow sticky-custom">
						<div>
							<h5 class="text-center mt-3">Suggestions to follow</h5>
							<hr>
						</div>
						<div class="card mb-3 border-0">
							<div class="col-lg-12 ">
								<div class="card-body d-flex justify-content-around ">
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
							</div>
						</div>

						<div class="card mb-3 border-0">
							<div class="col-lg-12 ">
								<div class="card-body d-flex justify-content-around ">
									<div class="col-lg-9">
										<h4 class="card-title small">Demarcus Louren</h4>
										<span class="card-text small">IT Security Specialist</span>
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

						<div class="card mb-3 border-0">
							<div class="col-lg-12 ">
								<div class="card-body d-flex justify-content-around ">
									<div class="col-lg-9">
										<h4 class="card-title small">Haruka Nakata</h4>
										<span class="card-text small">UI/UX Specialist</span>
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
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



<%@ include file="footer1.jsp"%>