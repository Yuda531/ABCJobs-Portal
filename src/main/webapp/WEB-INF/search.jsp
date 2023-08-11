<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header3.jsp">
    <jsp:param value="Search Page" name="HTMLtitle" />
</jsp:include>

<section class="profile pt-3 pb-3" style="background-color: #eee;">
	<div class="container my-5">
		<h1 class="text-center">Search in ABC Jobs Community Portal</h1>
		<div class="container-fluid my-5">
			<div>
				<form action="" method="get">
					<input class="form-control me-2 py-3" type="text"
						placeholder="Search" name="q"
						value="<%=request.getParameter("q") != null ? request.getParameter("q") : ""%>">
					<div id="searchNote" class="form-text">Press enter to search</div>
				</form>
			</div>
		</div>
	</div>
	<div class="container">
		<h1 class="text-center">${notFound == true ? "Not Found" : ""}</h1>
		<c:forEach var="s" items="${selected}">
			<div class="card col-lg-9 mb-3 border rounded-4">
				<div class="col-lg-12 ">
					<div class="card-body d-flex justify-content-around ">
						<div class="col-lg-9 p-3">
							<h2 class="card-title">${s.getFirstName()}
								${s.getLastName()}</h2>
							<p class="card-text">${s.getCity()}</p>
						</div>
						<div class="col-lg-3 p-3 d-flex align-items-center justify-content-end">
							<form action="result" method="post">
								<input type="hidden" name="uId" value="${s.getUserId()}">
								<button class="btn btn-outline-secondary" type="submit">View
									Profile</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>



</section>

<%@ include file="footer1.jsp"%>

