
<jsp:include page="header3.jsp">
	<jsp:param value="Dashboard" name="HTMLtitle" />
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.abc.utils.TimeAgoFormatter" %>

<section class="profile pt-5 pb-5" style="background-color: #eee;">
	<div class="container">
		<div class="row">
			<%
			if (session.getAttribute("isLogin") != null && session.getAttribute("roleId").toString().equals("1")) {
			%>
			<div class="row mb-5 p-3 rounded shadow bg-primary">
			  <div class="d-flex flex-lg-row justify-content-between align-items-center">
			    <h3 class="text-white">Welcome Back, ${fullName} !</h3>
			    <a href="admin" class="btn btn-success border-1 border-white" style="width: max-content;">Admin Home <i class="fa fa-arrow-circle-right ps-5" style="font-size: 20px"></i></a>
			  </div>
			</div>
			<%
			}
			%>
			<div class="row">
				<div class="col-lg-3 mb-3">
					<div
						class="d-flex flex-column border  rounded-3 pb-4 bg-white shadow">
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


				<!-- Post Section -->
				<div class="col-lg-6">
					<div class="border rounded-3 mb-3 px-3 bg-white shadow mb-3">
						<div class="d-flex align-items-center gap-2 py-3">
							<a href="profile"
								class="px-3 py-2 rounded-circle border border-primary bg-light text-decoration-none">${f}${l}</a>
							<input
                              type="text"
                              class="form-control rounded-pill border-2"
                              placeholder="Write a Post"
                              onclick="openPostModal()"
                            />
						</div>

                        <!-- Modal Post -->
                        <div class="modal fade" id="postModal" tabindex="-1" aria-labelledby="postModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="/create_thread" method="post" enctype="multipart/form-data">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="postModalLabel">Write a Thread</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="chooseImage" class="form-label">Choose Image</label>
                                                <input type="file" name="imageFile" class="form-control" id="chooseFile">
                                            </div>
                                            <div class="mb-3">
                                                <label for="postBody" class="form-label">Body</label>
                                                <textarea name="postBody" placeholder="What is Happening" class="form-control" id="postBody" rows="4"></textarea>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button id="postButton" type="submit" class="btn btn-primary">Post</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

					</div>

                    <c:forEach var="forumThread" items="${posts}">
                        <div class="border rounded-3 mb-3 px-3 bg-white shadow">
                            <div class="d-flex align-items-center gap-2 py-3">
                                    <span class="px-3 py-2 rounded-circle border bg-light">${forumThread.userDetails.getFirstName().charAt(0)}${forumThread.userDetails.getLastName().charAt(0)}</span>
                                    <a href="" class="text-decoration-none fs-5 fw-bold">${forumThread.userDetails.getFirstName()} ${forumThread.userDetails.getLastName()}</a>
                                    <small class="ms-auto text-secondary">${TimeAgoFormatter.format(forumThread.getCreatedAt())}</small>
                            </div>
                                <div class="">
                                       <p class="fs-5">${forumThread.getBody()}</p>
                                    <c:if test="${not empty forumThread.image}">
                                       <img src="data:image/jpeg;base64,${forumThread.getPostImageDataBase64()}" class="img-fluid">
                                    </c:if>
                                </div>
                            <div class="d-flex align-items-center gap-2 py-3">
                                <a href="" class="d-flex align-items-center gap-2 btn btn-outline-secondary btn-like">
                                    <i class='bx bx-like'></i> Like
                                </a>
                                <a href="" class="d-flex align-items-center gap-2 btn btn-outline-secondary btn-comment">
                                    <i class='bx bx-message-square-dots'></i> Comments
                                </a>
                            </div>
                        </div>
                    </c:forEach>
				</div>

				<!-- suggestion to follow -->
				<div class="col-lg-3">
					<div class="py-1 px-1 rounded-3 border bg-white shadow">
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