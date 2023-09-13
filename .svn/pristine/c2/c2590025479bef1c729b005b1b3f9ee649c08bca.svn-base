<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="description">
<meta content="" name="keywords">

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/customLibs.js"></script>
<script>
	<c:if test="${not empty message }">
		alert("${message}");
	</c:if>

	$(document).on("ajaxError", function(jqXHR, settings, errorText){
		console.log("XMLHttpRequest : ", jqXHR);
		console.log("settings : ", settings);
		console.log("error : ", errorText);
	});
</script>
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
<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/in/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/in/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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


</head>

<security:authentication property="principal.realUser" var="authMember" />


<body>

	<div class="card">
		<div class="card-body">
			<h5 class="card-title" style="font-weight: 600;">보안지원요청 수정</h5>



			<!-- Horizontal Form -->
			<form:form method="post" modelAttribute="secReq" id="popupForm">
				<%-- 				<form:hidden path="srId" /> --%>
				<form:hidden path="srReqMem" value="${authMember.empNo }" />

				<div class="row mb-3">
					<label for="inputEmail3" class="col-sm-3 col-form-label">카테고리</label>
					<div class="col-sm-8" style="margin-bottom: 10px;">
						<form:select path="srCa" class="form-select" type="text">
							<form:option value="" label="카테고리 선택" />
							<form:options items="${commonList}" itemLabel="codeNm" itemValue="codeId" />
						</form:select>

					</div>
				</div>
				<div class="row mb-3" style="margin-bottom: 10px;">
					<label for="inputEmail3" class="col-sm-3 col-form-label">위치정보</label>
					<div class="col-sm-8">


						<select class="form-select" id="floorSelect">

							<option value="" label="층수선택" />
							<c:set var="previousFloor" value="" />
							<c:forEach items="${zoneList}" var="zone">
								<c:if test="${zone.zoneFloor != previousFloor}">
									<option value="${zone.zoneFloor}" label="${zone.zoneFloor}" />
									<c:set var="previousFloor" value="${zone.zoneFloor}" />
								</c:if>
							</c:forEach>
						</select>

						<form:select class="form-select" type="text" path="srLoc" id="zoneSelect">
							<form:option value="" label="구역선택" />
							<c:forEach items="${zoneList}" var="zone">
								<form:option value="${zone.zoneCd }" class="${zone.zoneFloor}" label="${zone.zoneCtgr }" />
							</c:forEach>
						</form:select>
						<form:errors path="srLoc" class="error" />

					</div>
				</div>
				<div class="row mb-3">
					<label for="inputPassword3" class="col-sm-3 col-form-label">상황설명</label>
					<div class="col-sm-8">
						<form:textarea path="srContent" class="form-control" />
					</div>
				</div>
				<div class="text-center">
					<button id="submitButton" type="button" class="btn btn-primary" onclick="fn_();">수정</button>
					<button type="reset" class="btn btn-secondary" id="cancelButton">취소</button>
				</div>
			</form:form>
			<!-- End Horizontal Form -->

		</div>
	</div>


<script>

  const floorSelect = document.getElementById("floorSelect");
  const zoneSelect = document.getElementById("zoneSelect");


  floorSelect.addEventListener("change", function() {
      const selectedFloor = floorSelect.value;

      // 기존 구역 옵션들 숨김
      for (const option of zoneSelect.options) {
          option.style.display = "none";
      }
	
      // 선택된 층에 해당하는 구역 옵션들 표시
      for (const option of zoneSelect.options) {
          if (option.classList.contains(selectedFloor)) {
              option.style.display = "block";
          }
      }
  });

  zoneSelect.addEventListener("change", function() {
      const selectedZoneCode = zoneSelect.value;
      // 선택된 구역 코드를 이용하여 다른 처리 수행 (예: 값 저장 등)
  });
  

  </script>
    
</body>
</html>
