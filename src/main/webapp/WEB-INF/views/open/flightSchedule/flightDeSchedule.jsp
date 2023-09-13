<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
.table-title {
	font-size: 30px;
	margin-bottom: 10px;
	color: white;
}

.btn-outline-dark {
	background-color: white;
	color: #000;
	border-color: #000;
}

.sdt {
	font-size: small;
	text-decoration: line-through;
	color: gray;
}

.table-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 20px 0;
}

.table {
	width: 100%;
	margin-bottom: 10px;
}

.table th, .table td {
	vertical-align: middle;
	text-align: center;
	padding: 8px; /* 셀 안의 컨텐츠와 셀 경계 사이의 간격 설정 (선택사항) */
}

/* 각 열의 넓이를 조정 */
.table th:nth-child(1), .table td:nth-child(1) {
	width: 5%;
}

.table th:nth-child(2), .table td:nth-child(2) {
	width: 10%;
}

.table th:nth-child(3), .table td:nth-child(3) {
	width: 15%;
}

.table th:nth-child(4), .table td:nth-child(4) {
	width: 25%;
}

.table th:nth-child(5), .table td:nth-child(5) {
	width: 15%;
}

.table th:nth-child(6), .table td:nth-child(6) {
	width: 10%;
}

.table th:nth-child(7), .table td:nth-child(7) {
	width: 10%;
}

.table th:nth-child(8), .table td:nth-child(8) {
	width: 10%;
}

.flight-logo{
  width: 100px;
  height: 40px;
}

.flight-logo img {
  width: 100%;
  height: 100%;
}

#quick {
	width: 96px;
	position: fixed;
	top: 37%;
	right: 0;
	z-index: 999;
}

.quick_list {
	background: #272936;
	border-top-left-radius: 7px;
	border-bottom-left-radius: 7px;
	overflow: hidden;
	margin-left: -3px;
	
	padding-top: 10px;
	padding-bottom: 10px;
	text-align: center;
	padding-left: 0;
}

.quick_icon {
	font-size: 20px;
}

.quick_list li {
	list-style: none;
	margin-bottom: 10px;
}

.quick_list li a {
	color: white;
	font-size: 14px;
}

</style>

<main>
	<section id="hero" class="hero">

		<div class="info d-flex align-items-center">
			<div class="container">
				<div class="table-title">출발 항공편 조회</div>
				<div class="container mt-4" style="margin-bottom: 20px;">
					<form id="searchForm" action="${path}/flights/flightDepartures" method="post">
						<div class="row">
							<div class="col-md-2">
								<input type="date" class="form-control" id="startDate" name="startDate" value="${startDate}">
							</div>
							<div class="col-md-1">
								<select class="form-control" id="startTime" name="startTime">
									<c:forEach begin="0" end="23" var="hour">
										<option value="${String.format('%02d00', hour)}" <c:if test="${String.format('%02d00', hour) eq startTime}">selected</c:if>>${hour}:00</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-1">
								<select class="form-control" id="endTime" name="endTime">
									<c:forEach begin="0" end="23" var="hour">
										<option value="${String.format('%02d59', hour)}" <c:if test="${String.format('%02d59', hour) eq endTime}">selected</c:if>>${hour}:59</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-2">
								<select class="form-control" name="selectAp">
									<option value="" label="공항 선택" />
									<c:forEach items="${airport}" var="airport">
										<option value="${airport.apCd}" <c:if test="${airport.apCd eq selectAp}">selected</c:if> label="${airport.apNm}" />
									</c:forEach>
								</select>
							</div>
							<div class="col-md-2">
								<select class="form-control" name="selectAl">
									<option value="" label="항공사 선택" />
									<c:forEach items="${airline}" var="airline">
										<option value="${airline.alCd}" <c:if test="${airline.alCd eq selectAl}">selected</c:if> label="${airline.alKnm}" />
									</c:forEach>
								</select>
							</div>
							<div class="col-md-2">
								<input type="text" class="form-control" id="searchKeyword" name="skey" value="${skey}">
							</div>
							<div class="col-md-1">
								<button class="btn btn-warning" id="searchBtn">
									<i class="bi bi-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>

				<div class="parent-container">

					<div class="table-container">
						<table class="table table-warning">
							<tbody>
								<tr>
									<th scope="col">#</th>
									<th scope="col">출발시간</th>
									<th scope="col">도착지</th>
									<th scope="col">항공사/운항편명</th>
									<th scope="col">체크인카운터</th>
									<th scope="col">탑승구</th>
									<th scope="col">탑승터미널</th>
									<th scope="col">도착현황</th>
								</tr>
							</tbody>
						</table>
					</div>

					<div style="height: 500px; overflow-y: auto;" class="table-container">
						<table class="table">
							<tbody>
								<c:set value="${flights}" var="flightList" />
								<c:if test="${empty flightList}">
									<tr>
										<td colspan="8">조건에 맞는 항공 일정이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not empty flights}">
									<c:forEach items="${flightList}" var="flight">
										<tr>
											<th scope="row"><i class="bx bxs-plane-take-off"></i></th>
											<c:choose>
												<c:when test="${not empty flight.estimatedDateTime}">
													<td>${flight.estimatedDateTime}<br>
														<div class="sdt">${flight.scheduleDateTime }</div></td>
												</c:when>
												<c:otherwise>
													<td>${flight.scheduleDateTime }</td>
												</c:otherwise>
											</c:choose>
											<td>${flight.airport}</td>
											<td>
											<div class="d-flex justify-content-center">
												<div class="flight-logo" style=" margin-right: 10px;">
													<img src="${flight.logo}" alt="AirLine Logo">
												</div> 
												<div style="margin-top: 8px;">${flight.airline}/${flight.flightId}</div>
											</div>
											</td>
											<td>${flight.chkinrange}</td>
											<td>${flight.gatenumber}</td>
											<td>${flight.terminalid}</td>
											<td>${flight.remark}</td>
										</tr>
									</c:forEach>
								</c:if>

							</tbody>
						</table>

					</div>
				</div>


			</div>
		</div>


		<div id="hero-carousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
			<div class="carousel-item active" style="background-image: url(resources/open/assets/img/hero-carousel/airport1.jpg)"></div>
		</div>

	<nav id="quick">
		<ul class="quick_list">
			<li><i class="bi bi-airplane text-white quick_icon"></i><a href="/Airport80/flights/flightDepartures" class="d-block">출발시간</a></li>
			<li><a href="/Airport80/flights/flightArrivals" class="d-block">도착시간</a></li>
			<li><i class="bi bi-bus-front text-white quick_icon"></i><a href="/Airport80/open/operate/brList.do" class="d-block">셔틀버스</a></li>
			<li><i class="bi bi-bag text-white quick_icon"></i><a href="/Airport80/open/hr/vendorCos.do" class="d-block">면세점</a></li>
			<li><a href="#" class="d-block">일반쇼핑</a></li>
			<li><a href="#" class="d-block">식당</a></li>
			<li><i class="bi bi-clipboard text-white quick_icon"><a href="/Airport80/open/operate/cnbList.do" class="d-block"></i>전체게시판</a></li>
			<li><a href="/Airport80/open/operate/lostItemList.do" class="d-block"></i>분실물</a></li>
			<li><i class="bi bi-journal-check text-white quick_icon"><a href="/Airport80/open/operate/bnList.do" class="d-block"></i>모집공고</a></li>
			<li><i class="bi bi-chat-dots text-white quick_icon"><a href="" class="d-block"></i>AIRBOT</a></li>
		</ul>
	</nav>


		<script>
			$(document).ready(function() {
				$("#searchBtn").click(function() {
					$("#searchForm").submit(); // 폼 제출
				});
			});
		</script>

	</section>


</main>






