<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.stream.Stream"%>
<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Pages / Login - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${pageContext.request.contextPath }/in/assets/img/airportLogo2.png" rel="icon">
<link href="${pageContext.request.contextPath }/in/assets/img/airportLogo2.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet"
>

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath }/resources/in/assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Jul 27 2023 with Bootstrap v5.3.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

<style>
.bglogo{
	z-index: -2;
    opacity: 0.15;
    position: absolute;
    top: 8%;
    right: 2%;
    max-height: 816px!important;
}
</style>
</head>

<body>

	<main>
		<div class="container">

			<section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

							<div class="d-flex justify-content-center py-4">
								<a href="${pageContext.request.contextPath }" class="logo d-flex align-items-center w-auto"> <img src="${pageContext.request.contextPath }/resources/in/assets/img/airportLogo2.png" class="bglogo" alt=""> 
						<div style="margin-top: 5px;">
						<span style="display: block;">Airport:80</span>
						<span style="font-size: 12px; display: block; font-weight: 100; text-align: center;">airport Operations</span>
						</div>
								</a>
							</div>
							<!-- End Logo -->

							<div class="card mb-3">

								<div class="card-body">

									<div class="pt-4 pb-2">
										<h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
										<p class="text-center small">Enter your username & password to login</p>
									</div>

									<form action="${pageContext.request.contextPath }/login/loginProcess" method="post" class="row g-3 needs-validation" novalidate>

										<div class="col-12">
											<label for="yourUsername" class="form-label">Username</label>
											<div class="input-group has-validation">
												<span class="input-group-text" id="inputGroupPrepend">@</span> <input type="text" name="username" class="form-control" id="yourUsername" required>
												<div class="invalid-feedback">Please enter your username.</div>
											</div>
										</div>

										<div class="col-12">
											<label for="yourPassword" class="form-label">Password</label> <input type="password" name="password" class="form-control" id="yourPassword" required>
											<div class="invalid-feedback">Please enter your password!</div>
										</div>

										<div class="col-12">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe"> <label class="form-check-label" for="remember">Remember me</label>
											</div>
										</div>
										<div class="col-12">
											<button class="btn btn-primary w-100" type="submit">Login</button>
										</div>
									</form>

								</div>
							</div>
							<div class="d-flex" style="justify-content: space-between; width: 270px;">
								<form action="${pageContext.request.contextPath }/login/loginProcess" method="post" class="row g-3 needs-validation" novalidate>
									<input type="hidden" name="username" value="12020003"> <input type="hidden" name="password" value="java"> <input type="submit" value="운영">
								</form>
								<form action="${pageContext.request.contextPath }/login/loginProcess" method="post" class="row g-3 needs-validation" novalidate>
									<input type="hidden" name="username" value="12030004"> <input type="hidden" name="password" value="java"> <input type="submit" value="보안">
								</form>
								<form action="${pageContext.request.contextPath }/login/loginProcess" method="post" class="row g-3 needs-validation" novalidate>
									<input type="hidden" name="username" value="12040005"> <input type="hidden" name="password" value="java"> <input type="submit" value="인프라">
								</form>
								<form action="${pageContext.request.contextPath }/login/loginProcess" method="post" class="row g-3 needs-validation" novalidate>
									<input type="hidden" name="username" value="12010001"> <input type="hidden" name="password" value="java"> <input type="submit" value="인사">
								</form>
								<form action="${pageContext.request.contextPath }/login/loginProcess" method="post" class="row g-3 needs-validation" novalidate>
									<input type="hidden" name="username" value="12010002"> <input type="hidden" name="password" value="java"> <input type="submit" value="회계">
								</form>
								
							</div>

						</div>
					</div>
				</div>

			</section>

		</div>
	</main>
	<!-- End #main -->

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/chart.js/chart.umd.js"></script>
	<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/echarts/echarts.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/quill/quill.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath }/resources/in/assets/js/main.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
       document.addEventListener('submit', function (event) {
            // 로컬 스토리지 데이터 삭제
            localStorage.removeItem('sidebarState');
        });
    });
</script>



</body>

</html>

