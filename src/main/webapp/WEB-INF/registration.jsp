<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Registration Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/regis.css" />
</head>

<body>
	<div class="container mt-5">
		<div class="row justify-content-center mb-5">
			<div class="col-lg-6 col-md-8 col-sm-10 ">
				<div class="text-center">
					<h1>Let's Create Your</h1>
					<h1>Profile Here</h1>
					<img src="img/Join2.png" alt="Welcome Image" class="img-fluid mt-1">
				</div>
			</div>
			<div
				class="signUp col-lg-6 col-md-8 col-sm-10 p-3 bg-body-tertiary rounded-4 form-right ">
				<div class="top-su p-0">
					<h1>Sign Up</h1>
					<img src="img/ABCLogo2.png" alt="ABCLogo" class="img-fluid">
				</div>
				<hr>
				<form action="registration" method="post" onsubmit="return validRes()" class=" needs-validation"
                    novalidate>
                    <div class="form-group mt-1">
                        <input type="email" class="form-control" placeholder="Email Address" name="email" maxlength="50"
                            required>
                        <div class="invalid-feedback">
                            Email address should be have @ and .
                        </div>
                    </div>
                    <div class="form-group mt-1">
                        <input type="text" class="form-control" placeholder="First Name" name="firstName" maxlength="50"
                            required>
                        <div class="invalid-feedback">
                            Please Enter Your First Name.
                        </div>
                    </div>
                    <div class="form-group mt-1">
                        <input type="text" class="form-control" placeholder="Last Name" name="lastName" maxlength="50"
                            required>
                        <div class="invalid-feedback">
                            Please Enter Your Last Name.
                        </div>
                    </div>
                    <div class="form-group mt-1">
                        <input type="text" class="form-control" placeholder="City" name="city" maxlength="50"
                            required>
                        <div class="invalid-feedback">
                            Please Enter Your City.
                        </div>
                    </div>
                    <div class="form-group mt-1">
                        <input type="password" class="form-control" id="password" placeholder="Password" name="password"
                            maxlength="15" required>
                        <div class="invalid-feedback">
                            Password required & must be match
                        </div>
                    </div>
                    <div class="form-group mt-1">
                        <input type="password" class="form-control" id="confPass" placeholder="Confirm Password"
                            name="confPass" maxlength="15" required>
                        <div class="invalid-feedback">
                            Password required & must be match
                        </div>
                    </div>
                    <p>By clicking Agree &amp; Join, you agree to the ABC Jobs User
                        Agreement, Privacy Policy, and Cookie Policy.</p>
                    <button type="submit" class="btn btn-primary btn-block rounded-5">Agree
                        and Join</button>
                    <p>
                        Already on ABC Jobs? <a href="login">Sign In</a>
                    </p>
                </form>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-12">
				<p class="text-center  text-muted">&copy; 2023 ABC Jobs Pte Ltd
					| All Rights Reserved.</p>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
	<script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (() => {
            'use strict'

            const forms = document.querySelectorAll('.needs-validation')

            // Loop over them and prevent submission
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
	<script>
		function validRes() {
			const newPass = document.getElementById("password").value;
			const newPassConf = document.getElementById("confPass").value;

			if (newPass !== newPassConf) {
				alert("Password Does not match");
				return false;
			}
		}
	</script>
</body>

</html>