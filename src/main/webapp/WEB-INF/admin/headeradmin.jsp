<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="search.css">
<title>Admin Dashboard | <%= request.getParameter("HTMLtitle") !=null ? request.getParameter("HTMLtitle")
          : "Welcome" %></title>
</head>

<body>
	<nav
		class="navbar navbar-expand-lg bg-light p-0 shadow mb-1 sticky-top">
		<div class="container">
			<a class="navbar-brand" href="/admin"> <img
				src="img/ABCLogo2.png" class="img-fluid d-inline-block align-top"
				alt="ABC Logo">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav sm-auto mb-2 mb-lg-0">
                                <c:choose>
                                    <c:when test="${roleId == 1}">
                                        <li class="nav-item"><a class="btn btn-outline-primary mx-1 rounded-pill pe-4 ps-4" href="admin"><i class="fa fa-home fa-lg" aria-hidden="true"></i></a></li>
                                        <li class="nav-item"><a class="btn btn-outline-primary mx-1 rounded-pill pe-4 ps-4" href="search"><i class="fa fa-search fa-lg"></i></a></li>
                                        <li class="nav-item"><a class="btn btn-outline-primary mx-1 rounded-pill pe-4 ps-4" href="adminJobs"><i class="fa fa-briefcase fa-lg"></i></a></li>
                                    </c:when>
                                    <c:when test="${roleId == 2}">
                                        <li class="nav-item"><a class="btn btn-outline-primary mx-1 rounded-pill pe-4 ps-4" href="dashboard"><i class="fa fa-home fa-lg" aria-hidden="true"></i></a></li>
                                        <li class="nav-item"><a class="btn btn-outline-primary mx-1 rounded-pill pe-4 ps-4" href="jobs"><i class="fa fa-briefcase fa-lg"></i></a></li>
                                        <li class="nav-item"><a class="btn btn-outline-primary mx-1 rounded-pill pe-4 ps-4" href="profile"><i class="fa fa-user fa-lg" aria-hidden="true"></i></a></li>
                                        <li class="nav-item"><a class="btn btn-outline-primary mx-1 rounded-pill pe-4 ps-4" href="search"><i class="fa fa-search fa-lg"></i> </a></li>
                                    </c:when>
                                </c:choose>
                                <li class="nav-item"><a class="btn btn-outline-danger mx-1 rounded-pill pe-4 ps-4" href="logout"><i class="fa fa-sign-out fa-lg"></i> </a></li>
                            </ul>
			</div>
		</div>
	</nav>