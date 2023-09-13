<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
#divA {
	width: 100%;
	transition: 0.2s;
}

#contentDiv {
	margin-left: 10%;
}

#fsContent {
	width: 0%;
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



<!-- ======= Hero Section ======= -->
<section id="hero" class="hero">
	<div class="info d-flex align-items-center">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6 text-center">
					<a href="${pageContext.request.contextPath}/in">
						<img data-aos="fade-down" alt="" 
						src="${pageContext.request.contextPath}/resources/open/assets/img/LogoWY2.png"
					 	style="width: 60%; height: auto;">
					</a>
					<h2 data-aos="fade-down">AIRPORT:80</h2>
					<p>공항, 그 한계를 뛰어넘다</p>
					<a data-aos="fade-up" data-aos-delay="200" href="#get-started" class="btn-get-started">항공편 검색하러 가기</a>
				</div>
			</div>
		</div>
	</div>

	<div id="hero-carousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">

		<div class="carousel-item active" style="background-image: url(resources/open/assets/img/hero-carousel/airport3.jpg)"></div>
		<div class="carousel-item" style="background-image: url(resources/open/assets/img/hero-carousel/airport2.jpg)"></div>
		<div class="carousel-item" style="background-image: url(resources/open/assets/img/hero-carousel/airport4.jpg)"></div>
		<a class="carousel-control-prev" href="#hero-carousel" role="button" data-bs-slide="prev"> <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
		</a> <a class="carousel-control-next" href="#hero-carousel" role="button" data-bs-slide="next"> <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
		</a>

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

</section>
<!-- ======= Get Started Section ======= -->
<section id="get-started" class="get-started section-bg">
	<div class="container">

		<div class="d-flex">

			<div class="d-flex" id="divA">
				<div class="col-lg-5 searchArea" data-aos="fade">
					<h3>
						<i class="bi bi-airplane"></i>항공편 검색
					</h3>
					<select id="soa" class="form-select form-select-lg mb-3" aria-label="select">
						<option selected>선택</option>
						<option value="start">출발</option>
						<option value="end">도착</option>
					</select>
					<div class="row gy-3">
						<div class="col-md-12">
							<input id="hname" type="text" name="name" class="form-control" placeholder="항공편명/도시를 입력하세요." required>
						</div>
						<div class="col-md-12 text-center">
							<button class="btn btn-warning" onclick="fn_search()" id="searchbtn">검색하기</button>
						</div>
					</div>
				</div>

				<div id="contentDiv" class="col-lg-6 d-flex align-items-center" data-aos="fade-up">
					<div class="content" style="width: 84%;">
						<h3>AIRPORT:80와 추억을 만들어가요</h3>
						<p>여행은 새로운 이야기의 시작입니다. 여기서부터는 새로운 경험과 추억의 문이 열립니다. 함께 여행하는 동안 최고의 이야기를 만들어보세요.</p>
						<p>떠나는 순간, 당신은 특별합니다. 공항은 당신의 모험을 위한 무한한 기회를 제공합니다. 이곳에서 시작하세요.</p>
						<p>여행은 이곳에서 시작됩니다. 당신의 모든 꿈과 계획을 실현하기 위해, 우리는 여기에 있습니다.</p>
					</div>
				</div>
			</div>


			<div class="content" id="fsContent"></div>
		</div>
	</div>
</section>
<script type="text/javascript">
	// $(searchbtn).on("click", function(event){

	// });

	function formatDate(inputDate) {
		var year = inputDate.substr(0, 4);
		var month = inputDate.substr(4, 2);
		var day = inputDate.substr(6, 2);
		var hour = inputDate.substr(8, 2);
		var minute = inputDate.substr(10, 2);

		return year + '.' + month + '.' + day + '  ' + hour + ':' + minute;
	}

	function formatRemark(remark) {

		var resp;

		if (remark == '도착' || remark == '탑승준비' || remark == '탑승중') {
			resp = '<span class="badge text-bg-success rounded-pill">' + remark
					+ '</span>';
		} else if (remark == '결항' || remark == '회항') {
			resp = '<span class="badge text-bg-dark rounded-pill">' + remark
					+ '</span>';
		} else if (remark == '착륙' || remark == '출발') {
			resp = '<span class="badge text-bg-primary rounded-pill">' + remark
					+ '</span>';
		} else if (remark == '지연' || remark == '탑승마감') {
			resp = '<span class="badge text-bg-danger rounded-pill">' + remark
					+ '</span>';
		} else if (remark == '마감예정') {
			resp = '<span class="badge text-bg-warning rounded-pill">' + remark
					+ '</span>';
		} else {
			resp = "";
		}

		return resp;
	}

	function fn_search() {
		const aod = $("#soa").val();
		const name = $("#hname").val();

		if (aod == "선택") {
			Swal.fire({
			  		icon: 'warning',
			  		title: '출발/도착 타입을 선택해주세요.'
				})
		} else if (name.trim() == "") {
			Swal.fire({
		  		icon: 'question',
		  		title: '항공편명/도착지를 입력하세요.'
			})
		} else {
			$("#divA").css({
				"width" : "50%"
			});
			$("#contentDiv").remove();
			// $(".content").css("display", "none");
			$("#fsContent").css({
				"width" : "50%",
				"transform" : "translateX(-20%)",
				"transition" : "transform 0.5s ease, width 0.5s ease"
			});
			var req = "simple";
			var reqhtml = "/simpleFS";

			$
					.ajax({
						url : '<c:url value="/simpleFS"/>',
						type : "GET",
						data : {
							req : req,
							name : name,
							aod : aod

						},
						dataType : "json",
						success : function(response) {
							// 서버 응답 데이터를 처리하는 로직 작성
							console.log("Ajax Response:", response);

							// 표 생성
							var table = $('<table class="table table-bordered table-secondary"></table>');
							var tbody = $('<tbody></tbody>');

							var airport;
							if (aod == "start") { // 출발
								// 테이블 바디 생성
								for (var i = 0; i < response.length; i++) {
									var flight = response[i];

									var mark = flight.remark;
									if (mark == null) {
										mark = ""
									}

									mark = formatRemark(mark);

									var row = $('<tr></tr>');
									row.append('<td>' + flight.airline + ' | '
											+ flight.flightId + '</td>');
									row.append('<td>' + flight.airport
											+ '</td>');
									row
											.append('<td>'
													+ formatDate(flight.scheduleDateTime)
													+ '</td>');
									row.append('<td>' + mark + '</td>');
									tbody.append(row);
									airport = "/flights/flightDepartures";

								}

							} else { //도착
								// 테이블 바디 생성
								for (var i = 0; i < response.length; i++) {
									var flight = response[i];

									var mark = flight.remark;
									if (mark == null) {
										mark = ""
									}

									mark = formatRemark(mark);

									var row = $('<tr></tr>');
									row.append('<td>' + flight.airline + ' | '
											+ flight.flightId + '</td>');
									row.append('<td>' + flight.airport
											+ '</td>');
									row
											.append('<td>'
													+ formatDate(flight.scheduleDateTime)
													+ '</td>');
									row.append('<td>' + mark + '</td>');
									tbody.append(row);
									airport = "/flights/flightArrivals";
								}
							}

							// 테이블에 헤더와 바디 추가
							table.append(tbody);

							// 링크 생성
							var link = $('<a class="btn btn-outline-warning" href="${pageContext.request.contextPath }' + airport + '">더보기 <i class="bi bi-arrow-bar-right"></i></a>');

							// 표 아래에 링크 추가
							$('#fsContent').empty().append(table).append(link);

						},
						error : function(error) {
							console.log("Ajax Error:", error);
						}
					});
		}
	}
</script>