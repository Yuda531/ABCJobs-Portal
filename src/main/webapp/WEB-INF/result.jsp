<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header3.jsp">
    <jsp:param value="Other Profile" name="HTMLtitle" />
</jsp:include>

	
	<section class="profile pt-5 pb-5" style="background-color: #eee;">
        <div class="container">
            <div class="row">
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
									<button class="btn btn-outline-primary h5 rounded-pill px-5 py-2 follow ">Follow</button>
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
                                                    <div class="col-sm-4">
                                                        <p class="text-muted mb-0">${firstName}</p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-5">
                                                        <p class="mb-0">Last Name : </p>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <p class="text-muted mb-0">${lastName}</p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-5">
                                                        <p class="mb-0">Phone Number : </p>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <p class="text-muted mb-0">${phoneNumber}</p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-5">
                                                        <p class="mb-0">Address : </p>
                                                    </div>
                                                    <div class="col-sm-4">
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

   
	
	
	
	
	<%@ include file="footer1.jsp" %>

