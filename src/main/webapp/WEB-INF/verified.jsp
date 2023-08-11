<jsp:include page="header2.jsp">
    <jsp:param value="Verify your Email" name="HTMLtitle" />
</jsp:include>
    <div class="container text-center shadow">
        <div class="row ">
            <div class="col-lg-7 p-3 mt-3 ">
                <img src="img/Login.png" alt="Welcome" width="100%" class="img-fluid">
            </div>
            <div class="col-lg-5 p-3 mt-5">
                <h1 class="lh-base">Verified</h1><br>
                <h3 class="lh-base">Welcome to Community Portal <br> Your account has been verified</h3>
                <span>Please click below to Continue</span><br>
                <a href="login" class="btn btn-outline-primary mt-3 py-3 px-5">Log in</a>
            </div>
        </div>
    </div>
<%@ include file="footer2.jsp" %>