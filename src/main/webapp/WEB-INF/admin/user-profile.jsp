<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="headmin.jsp">
    <jsp:param value="User Profile" name="HTMLtitle" />
</jsp:include>

<section class="profile pt-5 pb-5" style="background-color: #eee;">
        <div class="container">
        <form:form modelAttribute="profile" action="editprofile" method="post">
        <input type="hidden" name="userDetailsId" value="${id}">
            <div class="row">
                <div class="alert alert-success alert-dismissible fade show my-3 ${ message == null ? " d-none"
                    : "d-block" }" role="alert">
                    ${ message }
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="profile col-lg-12">
                    <div class="card">
                        <div class="img-fluid rounded-3 text-light d-flex flex-row"
                            style="height: 200px; background-image: url(img/bg.jpg); background-repeat: no-repeat; background-size: cover;">
                            <div class="col-2 border border-light rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-primary bg-gradient text-white" style="width: 150px; height: 150px; margin-top: 145px; margin-left:25px; z-index: 1;">
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
                                    <button type="submit" class="btn btn-outline-primary h5 rounded-pill px-5 py-2">Save Changes</button>
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
                                                         <c:forEach var="e" items="${ed}">
                                                         
                                                         	<li class="mb-2">
                                                        		<h6>${e.getUniversity()}</h6>
                                                        		<p class="p-0 m-0">${e.getMajored()}</p>
                                                        		<p class="p-0 m-0">(${e.getEd_start_date().split("-")[0]} - ${e.getEd_end_date().split("-")[0]})</p>
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
                                                         <c:forEach var="e" items="${ex}">
                                                         	
                                                         	<li class="mb-2">
                                                        		<h6>${e.getTitle()}</h6>
                                                        		<p class="p-0 m-0">${e.getCompanyName()}</p>
                                                        		<p class="p-0 m-0">(${e.getEx_start_date().split("-")[0]} - ${e.getEx_end_date().split("-")[0]})</p>
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
										                    <input type="text" class="form-control" id="firstName" name="firstName" value="${firstName}"
										                        required>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-5">
                                                        <p class="mb-0">Last Name : </p>
                                                    </div>
                                                    <div class="col-sm-6">
										                    <input type="text" class="form-control" id="lastName" name="lastName" value="${lastName}"
										                        required>
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
                                                        <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${phoneNumber}">
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-5">
                                                        <p class="mb-0">Address : </p>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <input type="text" class="form-control" id="city" name="city" value="${city}">
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
        </form:form>
        </div>
    </section>
    
    


<%@ include file="foot.jsp"%>