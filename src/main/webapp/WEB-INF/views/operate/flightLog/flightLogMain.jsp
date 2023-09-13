<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    


					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
     					<h5 class="card-tit">실시간 운항</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item active"><a href="#">관제</a></li>
					      </ol>
					    </nav>
					    
<!-- 					    <div class="desc"> -->
<!-- 						    <p>AirLabs 데이터 API를 이용한 인천공항으로 향하는 비행기 실시간 조회</p> -->
<!-- 						    <p>현재 비행기의 출발 및 도착 정보를 실시간으로 확인할 수 있습니다.</p> -->
<!-- 						    <p>출발 시간, 도착 시간, 게이트 정보 등을 확인하실 수 있습니다.</p> -->
<!-- 						    <p>또한, 항공사 정보 및 항공편 번호도 제공되어 비행 상태를 확인할 수 있습니다.</p> -->
<!-- 						    <p>자세한 정보는 AirLabs 데이터 API를 통해 제공됩니다.</p> -->
<!-- 						</div> -->
    
		<div>
			<jsp:include page="/WEB-INF/views/operate/flightLog/flightLive.jsp" />
		</div>
		
		<div>
			<button type="button"  class="btn btn-outline-secondary btn-lg" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-controls="flush-collapseOne" 
					style="background-color: transparent; border: none;" id="toggleButton"><i class="bi bi-plus-circle" id="icon"></i>
		    운항일지 등록
			</button>
		<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
			<div class="accordion-body">
			<jsp:include
				page="/WEB-INF/views/operate/flightLog/flightLogForm.jsp" />
		</div>
	</div>
	
				</div>
			</div>
		</div>
	</div>
	</div>
	
</section>

	<div class="row">
		<div id="flightInfo" class="col">
		</div>
		</div>

<c:url value="/operate/flightlog/insert.do" var="insertURL" />

<script>
	function fn_paging(page) {
		location.href = "?page=" + page;
	}
	
	document.getElementById('toggleButton').addEventListener('click', function () {
	    var icon = document.getElementById('icon');
	    
	    // 폼이 열려있을 때와 닫혀있을 때의 아이콘을 토글합니다.
	    if (icon.classList.contains('bi-plus-circle')) {
	        icon.classList.remove('bi-plus-circle');
	        icon.classList.add('bi-dash-circle');
	    } else {
	        icon.classList.remove('bi-dash-circle');
	        icon.classList.add('bi-plus-circle');
	    }
	});
</script>