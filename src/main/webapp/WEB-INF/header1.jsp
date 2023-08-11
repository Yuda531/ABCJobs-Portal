<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ABC Job | <%= request.getParameter("HTMLtitle") !=null ? request.getParameter("HTMLtitle")
          : "Welcome" %></title>
    <link rel="stylesheet" href="css/homepage.css" />
    <link rel="stylesheet" href="css/reset.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-light p-2 shadow mb-5">
        <div class="container">
            <a class="navbar-brand" href="homepage">
                <img src="img/ABCLogo2.png" class="img-fluid d-inline-block align-top" alt="ABC Logo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav sm-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="btn btn-outline-primary mx-4 my-2 rounded-pill pe-5 ps-5" href="login">Sign
                            In</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-outline-secondary mx-4 my-2 rounded-pill pe-5 ps-5"
                            href="registration">Sign Up</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
