<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="headeradmin.jsp">
    <jsp:param value="All Users Page" name="HTMLtitle" />
</jsp:include>
<body>

	<div class="container mt-4">
            <h1 class="text-center">List Software Programmers</h1>
    </div>
	<div class="container">
		<div class="table-responsive">
		  <table class="table table-striped table-bordered table-hover mt-4">
		    <thead>
		      <tr>
		        <th scope="col">No.</th>
		        <th scope="col">Full Name</th>
		        <th scope="col">Email</th>
		        <th scope="col">City</th>
		        <th scope="col">Phone Number</th>
		        <th scope="col">Action</th>
		      </tr>
		    </thead>
		    <tbody>
		      <% int i = 1; %>
		      <c:forEach var="user" items="${users}">
		        <tr>
		          <th scope="row"><%= i++ %></th>
		          <td>${user.getFirstName()} ${user.getLastName()}</td>
		          <td>${user.getUser().getEmail()}</td>
		          <td>${user.getCity()}</td>
		          <td>${user.getPhoneNumber()}</td>
		          <td>
		            <div class="d-flex flex-wrap justify-content-between">
		              <a href="user-profile/${user.getUserId()}" class="text-decoration-none btn btn-outline-secondary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>Edit</a>
		              <a href="" class="text-decoration-none btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteModal${user.getUserId()}"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a>
		              <a href="" class="text-decoration-none btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#detailModal${user.getUserId()}"><i class="fa fa-eye" aria-hidden="true"></i>Detail</a>
		            </div>
		          </td>
		        </tr>
			      
			      <!-- delete confirmation -->
					<div class="modal fade" id="deleteModal${user.getUserId()}" style="z-index: 2000;">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete ${user.getFirstName()}</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        You want to really delete this ${user.getUserId()}?
					      </div>
					      <div class="modal-footer">
					        <a href="delete/${user.getUserId()}" class="btn btn-outline-danger">Delete</a>
					      </div>
					    </div>
					  </div>
					</div>
					
					<!-- detail -->
					 <div class="modal fade" id="detailModal${user.getUserId()}" style="z-index: 2000;">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">Detail</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <ul class="list-group list-group-flush">
					          <li class="list-group-item">
					            <h4>First Name</h4>
					            <p>${user.getFirstName()}</p>
					          </li>
					          <li class="list-group-item">
					            <h4>Last Name</h4>
					            <p>${user.getLastName()}</p>
					          </li>
					          <li class="list-group-item">
					            <h4>City</h4>
					            <p>${user.getCity()}</p>
					          </li>
					          <li class="list-group-item">
					            <h4>Phone Number</h4>
					            <p>${user.getPhoneNumber()}</p>
					          </li>
					        </ul>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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