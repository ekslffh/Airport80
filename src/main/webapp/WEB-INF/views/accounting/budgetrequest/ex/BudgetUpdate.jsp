<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="description">
<meta content="" name="keywords">

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/customLibs.js"></script>
<script>
	<c:if test="${not empty message }">
	alert("${message}");
	</c:if>

	$(document).on("ajaxError", function(jqXHR, settings, errorText) {
		console.log("XMLHttpRequest : ", jqXHR);
		console.log("settings : ", settings);
		console.log("error : ", errorText);
	});
</script>
<!-- Vendor JS Files -->
<script
	src="${pageContext.request.contextPath }/resources/in/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/in/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/in/assets/vendor/chart.js/chart.umd.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/in/assets/vendor/echarts/echarts.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/in/assets/vendor/quill/quill.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/in/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/in/assets/vendor/tinymce/tinymce.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/in/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script
	src="${pageContext.request.contextPath }/resources/in/assets/js/main.js"></script>
<!-- Favicons -->
<link
	href="${pageContext.request.contextPath }/resources/in/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath }/resources/in/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath }/resources/in/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/in/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/in/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/in/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/in/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/in/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/in/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link
	href="${pageContext.request.contextPath }/resources/in/assets/css/style.css"
	rel="stylesheet">
</head>
<security:authentication property="principal.realUser" var="authMember" />

<body>

	<div class="card">
		<div class="card-body">
			<h5 class="card-title">예산 신청 처리</h5>
			<form:form
				action="${pageContext.request.contextPath }/accounting/budgetrequest/update.do"
				method="post" modelAttribute="budgetDetail">

				<div class="row mb-3">
					<label for="bgRUseTs" class="col-sm-3 col-form-label">처리
						여부:</label>
					<div class="col-sm-8">
						<form:select path="bgRStatus" class="form-select">
							<form:option value="승인대기">승인대기</form:option>
							<form:option value="승인완료">승인완료</form:option>
							<form:option value="반려">반려</form:option>
							<form:option value="기타">기타</form:option>
						</form:select>
					</div>
				</div>

				<div class="row mb-3">
					<label for="bgRUseTs" class="col-sm-3 col-form-label">처리
						사유:</label>
					<div class="col-sm-8">
						<form:textarea class="form-control" path="bgRResRsn" rows="4"
							cols="50" />
						<br>
					</div>
				</div>

				<form:hidden path="bgRId" />

				<div class="text-center">
					<button id="submitButton" type="submit" class="btn btn-primary">처리하기</button>
					<button type="reset" class="btn btn-secondary">지우기</button>
				</div>

			</form:form>

		</div>
	</div>
	<!-- SweetAlert2  추가 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9/dist/sweetalert2.all.min.js"></script>
	
	<script>
		// 창 닫기와 부모 페이지 갱신
		function closePopupAndRefreshParent() {
			setTimeout(function() {
				window.opener.location.reload(); // 부모 페이지 새로고침
				window.close();
			}, 20);
		}
		// 폼 제출 후 창 닫기와 부모 페이지 갱신 호출
		document.querySelector('form').addEventListener('submit', function(event) {
		    event.preventDefault(); // 폼 제출 막기
		    Swal.fire({
		        title: '처리 완료 하시겠습니까?',
		        icon: 'warning',
		        showCancelButton: true,
		        confirmButtonColor: '#3085d6',
		        cancelButtonColor: '#d33',
		        confirmButtonText: '예',
		        cancelButtonText: '아니오',
		        showLoaderOnConfirm: true // 동작 중 로더 표시
		    }).then((result) => {
		        if (result.isConfirmed) {
		            // SweetAlert2로 다시 확인창을 띄워서 OK 버튼을 누르면 처리
		            Swal.fire({
		                icon: 'success',
		                title: '처리 완료!',
		                text: '처리 완료 되었습니다.',
		                showConfirmButton: true, // OK 버튼 표시
		            }).then(() => {
		                // OK 버튼을 누르면 처리
		                this.submit(); // 폼 제출
		                closePopupAndRefreshParent(); // 창 닫기와 부모 페이지 갱신 호출
		            });
		        }
		    });

		});

	</script>