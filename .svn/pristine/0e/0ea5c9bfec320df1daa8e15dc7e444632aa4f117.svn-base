<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


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

	<div class="card">
		<div class="card-body">
			<h5 class="card-title" style="font-weight: 600;">추가예산신청</h5>
			<form:form
				action="${pageContext.request.contextPath}/accounting/budgetrequest/insert.do"
				method="post" modelAttribute="budgetReq">

				<!--    이걸 따라하시오 -->
				<div class="row mb-3">
					<label for="bgRUseTs" class="col-sm-3 col-form-label">예산 사용 일정:</label>
					<div class="col-sm-8">
						<input type="datetime-local" id="bgRUseTsInput"
							onchange="setHiddenValue()" class="form-select" />
					</div>
				</div>
				<br>

				<!-- 숨겨진 필드 -->
				<form:input type="hidden" id="bgRUseTsWithoutT" path="bgRUseTs" />

				<!--     <label for="bgRAmt">예산 신청 금액(10,000 원 이상):</label> -->
				<%--     <form:input type="number" path="bgRAmt" required="true"/><br> --%>

				<div class="row mb-3">
					<label for="bgRAmt" class="col-sm-3 col-form-label">예산 신청
						금액:<br>(10,000 원 이상)
					</label>
					<div class="col-sm-8">
						<input type="text" class="form-select" id="money"
							placeholder="금액을 입력하세요" onkeyup="inputNumberFormat(this);"
							onchange="updateHiddenValue();" />
					</div>
				</div>
				<form:input type="hidden" path="bgRAmt" id="hiddenAmt"
					required="true" />
				<div class="row mb-3">
					<label for="acaId" class="col-sm-3 col-form-label">예산 신청
						항목:</label>
					<div class="col-sm-8">
						<form:select path="acaId" class="form-select">
							<form:options items="${accountCategories}" itemValue="acaId"
								itemLabel="acaNm" />
						</form:select>
					</div>
				</div>
				<div class="row mb-3">
					<label for="bgRRsn" class="col-sm-3 col-form-label">예산 신청
						사유:</label>
					<div class="col-sm-8">
						<form:textarea class="form-control" path="bgRRsn" rows="4"
							cols="50" />
						<br>
					</div>
				</div>
				<form:input type="hidden" path="empEmpNo" value="${empNo}"
					required="true" />
				<br>

				<div class="text-center">
					<button id="submitButton" type="submit" class="btn btn-primary">신청</button>
					<button type="reset" class="btn btn-secondary">지우기</button>
				</div>
			</form:form>

		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script>
		const input = document.querySelector('#money');
		input.addEventListener('keyup', function(e) {
			let value = e.target.value;
			value = Number(value.replaceAll(',', ''));
			if (isNaN(value)) { //NaN인지 판별
				input.value = 0;
			} else { //NaN이 아닌 경우
				const formatValue = value.toLocaleString('ko-KR');
				input.value = formatValue;
			}
		})

		function updateHiddenValue() {
			var moneyInput = document.getElementById('money');
			var hiddenInput = document.getElementById('hiddenAmt');
			var value = moneyInput.value.replace(/,/g, ''); // 포맷된 값을 쉼표 제거
			hiddenInput.value = value;
		}

		window.onload = function() {
			var urlParams = new URLSearchParams(window.location.search);
			var message = urlParams.get("message");

			if (message !== null && message !== "") {
				alert(message);
			}
		};

		function setHiddenValue() {
			var bgRUseTsInput = document.getElementById('bgRUseTsInput');
			var bgRUseTsWithoutT = document.getElementById('bgRUseTsWithoutT');

			// 입력 필드의 값 가져오기
			var inputValue = bgRUseTsInput.value;

			// "T"를 제외한 날짜-시간 문자열 추출
			var dateTimeWithoutT = inputValue.replace("T", " ");
			// 숫자만 남기도록 정규식을 사용하여 처리
			var numericValue = dateTimeWithoutT.replace(/\D/g, "");
			// 숨겨진 필드의 값 설정
			bgRUseTsWithoutT.value = dateTimeWithoutT;
		}

		// 창 닫기와 부모 페이지 갱신
		function closePopupAndRefreshParent() {
			window.opener.location.reload(); // 부모 페이지 새로고침
			setTimeout(function() {
				window.close();
			}, 50);
		}

		// 폼 제출 후 창 닫기와 부모 페이지 갱신 호출
		document
				.querySelector('form')
				.addEventListener(
						'submit',
						function(event) {
							event.preventDefault(); // 폼 제출 막기

							var form = this; // 폼 엘리먼트 참조

							// Ajax 요청을 사용하여 insert.do 호출
							var xhr = new XMLHttpRequest();
							xhr.open("POST", form.action, true);
							xhr
									.setRequestHeader("Content-Type",
											"application/x-www-form-urlencoded;charset=utf-8");

							xhr.onload = function() {
								if (xhr.status === 200) {
									var responseMessage = xhr.responseText;
									if (responseMessage === "success") {
										Swal.fire({
										    icon: 'success',
										    title: '예산 신청을 완료했습니다',
										    showLoaderOnConfirm: true, // 동작 중 로더 표시
										}).then((result) => {
										    // 여기에 폼 제출 또는 다른 동작을 처리하는 로직 추가
										    if (result.isConfirmed) {
										    	closePopupAndRefreshParent();
										    }
										});
										
									} else {
										Swal.fire({
											  icon: 'error',
											  title: '예산 신청 중 문제가 발생했습니다.',
											  text: '날짜와 항목, 사유를 선택하고 10,000 원 이상값을 입력해주세요',
											});
									}
								} else {
									Swal.fire({
										  icon: 'error',
										  title: '이 항목은 등록불가합니다.',
										  text: '날짜와 항목, 사유를 선택하고 10,000 원 이상값을 입력해주세요',
										});
								}
							};

							// FormData를 사용하여 폼 데이터 전송
							var formData = new FormData(form);
							// FormData 객체로부터 폼 필드의 값을 가져와서 문자열로 만들기
							var formDataString = new URLSearchParams(formData)
									.toString();
							xhr.send(formDataString); // 문자열로 만든 폼 데이터를 전송
						});
	</script>

</body>
</html>
