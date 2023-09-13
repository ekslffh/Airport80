<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
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
			<h5 class="card-title" style="font-weight: 600;">보안지원 요청</h5>



			<!-- Horizontal Form -->
			<form:form method="post" modelAttribute="secReq" id="popupForm">
<%-- 				<form:hidden path="srId" /> --%>
				<form:hidden path="srReqMem" value="${authMember.empNo }" />

				<div class="row mb-3">
					<label for="inputEmail3" class="col-sm-3 col-form-label">카테고리</label>
					<div class="col-sm-8" style="margin-bottom: 10px;">
						<form:select path="srCa" class="form-select" type="text">
							<form:option value="" label="카테고리 선택" />
							<form:options items="${commonList}" itemLabel="codeNm"
								itemValue="codeId" />
						</form:select>

					</div>
				</div> 
				<div class="row mb-3" style="margin-bottom: 10px;">
					<label for="inputEmail3" class="col-sm-3 col-form-label">위치정보</label>
					<div class="col-sm-8">
						<select class="form-select" id="floorSelect">
					   <option value="" label="층수선택"/>
						<c:set var="previousFloor" value="" />
						<c:forEach items="${zoneList}" var="zone">
						    <c:if test="${zone.zoneFloor != previousFloor}">
						        <option value="${zone.zoneFloor}" label="${zone.zoneFloor}" />
						        <c:set var="previousFloor" value="${zone.zoneFloor}" />
						    </c:if>
						</c:forEach>
						</select>

						<form:select class="form-select" type="text" path="srLoc" 
							id="zoneSelect" >
							<form:option value="" label="구역선택" />
							<c:forEach items="${zoneList}" var="zone">
								<form:option value="${zone.zoneCd }" class="${zone.zoneFloor}"
									label="${zone.zoneCtgr }" />
							</c:forEach>
						</form:select>
						<form:errors path="srLoc" class="error" />

					</div>
				</div>
				<div class="row mb-3" >
					<label for="inputPassword3" class="col-sm-3 col-form-label">상황설명</label>
					<div class="col-sm-8">
						<form:textarea path="srContent"  class="form-control"/>
					</div>
				</div>
				<div class="text-center">
					<button class="btn btn-dark" id="test" type="button"><i class="bi bi-folder"></i></button>
					<button id="submitButton" type="button" class="btn btn-primary">요청</button>
					<button type="reset" class="btn btn-secondary">취소</button>
				</div>
			</form:form>
			<!-- End Horizontal Form -->

		</div>
	</div>
	
	
	<script>
		//메인 창에서 넘어온 소켓 객체 사용
		var socket = window.opener.socket;
		
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
    
    
    //요청 
    $(document).ready(function() {
        $("#submitButton").on("click", function(event) {
        	event.preventDefault();
        	
        	 const $popupForm = $('#popupForm');
        	 console.log(popupForm);

           	var srCa = document.getElementById('srCa').value;
	        var srLoc = document.getElementById('zoneSelect').value;
	        var srContent = document.getElementById('srContent').value;
	        
	        if (srCa === '' || srLoc === '' || srContent ==='') {
	            alert('모든 필수 입력 필드를 채워주세요.');
	            return false; // submit을 막음
	        }
	        
	        let viewURL = "${pageContext.request.contextPath }/safety/secReqInsert.do";

	        $.ajax({
	        	url: viewURL,
	        	method: "POST",
	        	data : JSON.stringify($popupForm.serializeObject()),
	            contentType: "application/json;charset=UTF-8", // 클라이언트에서 보내는 데이터의 형식
	        	dataType:"json",
	        	success: function(resp){
	        	alert(resp.result);

					// 부모 창의 URL return 해주는 컨트롤러로 보냄  
              			window.opener.location.href = "${pageContext.request.contextPath}/common/requestList.do";	
	                
	                // 팝업 창을 닫습니다.
	                window.close();
	        		
	        	}, 
	        	error: function(xhr,status,error){
	        		console.error("보안요청 에러",error);
	        		alert(resp.result);
	        	}
	        });
	        
	        
			// 보안부서에게 실시간 보안요청 보내기
 	    	var msgData = {
 	    			type : "SECURITY_REQ",
 	    			msg : "보안요청이 도착했습니다. : " + srContent
 	    		};
 	    	var jsonData = JSON.stringify(msgData);
 	    	socket.send(jsonData);

          // 예시: console.log로 데이터 출력
          console.log("카테고리:", srCa);
          console.log("위치정보:", srLoc);
          console.log("상황설명:", srContent);
        
        });
    });
    
    
    // 시연용 등록버튼 값 넣기 
    $("#test").on("click", function(event){
        let srCa = $("#srCa");
        let floorSelect = $("#floorSelect");
        let srLoc = $("#zoneSelect");
        let srContent = $("#srContent");
        
        let srCaValue = 'CRO';
        let floorValue = '1';
        let srLocValue = '1F2';
        let cntValue = '게이트 입구 혼잡으로 승객 이동이 원활하지 않습니다.'; // 값을 변수에 할당하고
        
        // srContent 요소에 값을 설정
        srCa.val(srCaValue);
        floorSelect.val(floorValue);
        srLoc.val(srLocValue);
        srContent.val(cntValue);
    });



</script>



