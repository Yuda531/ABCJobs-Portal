<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header3.jsp">
    <jsp:param value="Profile Page" name="HTMLtitle" />
</jsp:include>

	<section class="profile pt-5 pb-5" style="background-color: #eee;">
        <div class="container">
            <div class="row">
                <div class="alert alert-success alert-dismissible fade show my-3 ${ message == null ? " d-none"
                    : "d-block" }" role="alert">
                    ${ message }
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="profile col-lg-12">
                    <div class="card">
                        <div class="img-fluid rounded-3 text-light d-flex flex-row" style="background-image: url(img/backprofile.png); background-repeat: no-repeat; background-size: cover;">
                            <div class="col-2 border border-light rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-secondary bg-gradient text-white" style="width: 150px; height: 150px; margin-top: 195px; margin-left: 25px; z-index: 1; position: relative; top: 50px;">
                                <span>${f}</span>
                                <span>${l}</span>
                            </div>
                        </div>

                        <div class="p-4 text-black bg-light rounded-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="myName " style="margin-left: 165px;">
                                    <h2 class="fw-bold">${fullName}</h2>
                                    <h5>${city}</h5>
                                </div>
                                <div>
                                    <button class="btn btn-primary h5 rounded-pill px-5 py-2 " data-bs-toggle="modal"
                                        data-bs-target="#editProfileModal">Edit
                                        Profile</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12  d-flex mt-5 bg-light rounded-3">
                        <div class="col-lg-5">
                            <div class="container">
                                <div class="row">
                                    <h1>Status</h1>
                                    <div class="col-lg-12">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-sm-12">      
                                                    	<div class="d-flex justify-content-between align-items-start">
                                                    		 <h5 class="text-white bg-dark p-2" style="width:max-content;"> <i class="fa fa-university"></i> Education</h5> 
                                                    		 <button class="btn btn-warning border border-0"  
                                                    		 	data-bs-toggle="modal"
                                        						data-bs-target="#addEducation"><i class="fa fa-plus text-white"></i></button>
                                                    	</div>                                               
                                                       
                                                    </div>
                                                    <div class="col-sm-12">

                                                        <ul>
                                                         <c:forEach var="ed" items="${education}">
                                                         
                                                         	<li class="mb-2">
                                                        		<h6>${ed.getUniversity()}</h6>
                                                        		<p class="p-0 m-0">${ed.getMajored()}</p>
                                                        		<p class="p-0 m-0">${ed.getEd_start_date()} - ${ed.getEd_end_date()}</p>
                                                        	</li>
                                                         
                                                         </c:forEach>
                                                        	
                                                        </ul>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-12">
	                                                    <div class="d-flex justify-content-between align-items-start">
	                                                    	<h5 class="text-white bg-dark p-2" style="width:max-content;"> <i class='fa fa-building'></i> Experience</h5> 
	                                                    	  <button class="btn btn-warning border border-0"  
                                                    		 	data-bs-toggle="modal"
                                        						data-bs-target="#addExperience"><i class="fa fa-plus text-white"></i></button>
	                                                    </div>
                                                        
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <ul>
                                                         <c:forEach var="ex" items="${experiences}">
                                                         	
                                                         	<li class="mb-2">
                                                        		<h6>${ex.getTitle()}</h6>
                                                        		<p class="p-0 m-0">${ex.getCompanyName()}</p>
                                                        		<p class="p-0 m-0">${ex.getEx_start_date()} - ${ex.getEx_end_date()}</p>
                                                        	</li>
                                                         	
                                                         </c:forEach>                                                      
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="container">
                                <div class="row">
                                    <h1>Biodata</h1>
                                    <div class="col-lg-12">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-sm-5">
                                                        <p class="mb-0">First Name : </p>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <p class="text-muted mb-0">${firstName}</p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-5">
                                                        <p class="mb-0">Last Name : </p>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <p class="text-muted mb-0">${lastName}</p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-5">
                                                        <p class="mb-0">Email : </p>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <p class="text-muted mb-0">${email}</p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-5">
                                                        <p class="mb-0">Phone Number : </p>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <p class="text-muted mb-0">${phoneNumber}</p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-5">
                                                        <p class="mb-0">Address : </p>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <p class="text-muted mb-0">${city}</p>
                                                    </div>
                                                </div>
                                            </div>
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

    <!-- Modal -->
    <div class="modal fade" id="editProfileModal" tabindex="-1" aria-labelledby="editProfileModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProfileModalLabel">Edit
                        Profile</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="profile" method="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="name" class="form-label">First Name</label> <input type="text"
                                class="form-control" id="firstName" name="firstName" value="${firstName}" required>
                        </div>
                        <div class="mb-3">
                            <label for="name" class="form-label">Last Name</label> <input type="text"
                                class="form-control" id="lastName" name="lastName" value="${lastName}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="phoneNumber" class="form-label">Phone</label> <input type="text"
                                class="form-control" id="phoneNumber" name="phoneNumber" value="${phoneNumber}" required>
                        </div>
                        <div class="mb-3">
                            <label for="location" class="form-label">Location</label> <input type="text"
                                class="form-control" id="location" name="city" value="${city}" required>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save
                            changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    
    
    <!-- EDUCATION Modal -->
   <div class="modal fade" id="addEducation" tabindex="-1" aria-labelledby="addEducationlabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProfileModalLabel">Add Education</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="add_education" method="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="university" class="form-label">University</label> 
                            <input type="text" class="form-control" id="university" name="university" required>
                        </div>
                        <div class="mb-3">
                            <label for="majored" class="form-label">Majored In</label> 
                            <input type="text" class="form-control" id="majored" name="majored" required>
                        </div>
                        <div class="mb-3">
                            <label for="ed_start_date" class="form-label">Start Date</label> 
                            <input type="date"  class="form-control" id="ed_start_date" name="ed_start_date" required>
                        </div>
                        <div class="mb-3">
                            <label for="ed_end_date" class="form-label">End Date</label> 
                            <input type="date"  class="form-control" id="ed_end_date" name="ed_end_date" required>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save
                            changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    
    <!-- Experience Modal -->
   <div class="modal fade" id="addExperience" tabindex="-1" aria-labelledby="addExperiencelabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProfileModalLabel">Add Experience</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="add_experience" method="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="title" class="form-label">Title</label> 
                            <input type="text" class="form-control" id="title" name="title" required>
                        </div>
                        <div class="mb-3">
                            <label for="company" class="form-label">Company name</label> 
                            <input type="text" class="form-control" id="companyName" name="companyName" required>
                        </div>
                        <div class="mb-3">
                            <label for="ex_start_date" class="form-label">Start Date</label> 
                            <input type="date"  class="form-control" id="ex_start_date" name="ex_start_date" required>
                        </div>
                        <div class="mb-3">
                            <label for="ex_end_date" class="form-label">End Date</label> 
                            <input type="date"  class="form-control" id="ex_end_date" name="ex_end_date" required>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save
                            changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
	
	
	
<%@ include file="footer1.jsp" %>