<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<style>
.table-title {
	font-size: 20px;
	margin-bottom: 10px;
	color: white;
	text-align: center;
}

.btn-outline-dark {
	background-color: white;
	color: #black;
	border-color: #black;
}

.table.hr th {
	background-color: #F3F4F8;
	width: 130px;
}

.table.hr td {
	width: 600px;
}

.nav-tabs .nav-link:not(.active) {
	background-color: #F3F4F8;
}

.info {
	margin-top: 40px; /* 아래로 내리고자 하는 여백 크기를 지정하세요 */
}
</style>

<main>
	<section id="hero" class="hero">

		<div class="info d-flex align-items-center">
			<div class="container">
			<h5 class="card-tit"></h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="${path}/Airport80/"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">교통</a></li>
					        <li class="breadcrumb-item active" style="color:white;">셔틀버스 노선</li>
					      </ol>
					    </nav>
				<div class="card"
					style="display: flex; justify-content: center; width: 100%;">

					<div class="parent-container">

						<div class="card-body" style="height: 750px;">
							<!--           <h5 class="card-title">셔틀버스  </h5> -->
							<br>

							<ul class="nav nav-tabs d-flex" id="myTabjustified"
								role="tablist">
								<li class="nav-item flex-fill" role="presentation">
									<button class="nav-link w-100 active" id="route1-tab"
										data-bs-toggle="tab" data-bs-target="#route1" type="button"
										role="tab" aria-controls="route1">AICC ⇿ T1⇿ T2</button>
								</li>
								<li class="nav-item flex-fill" role="presentation">
									<button class="nav-link w-100" id="route2-tab"
										data-bs-toggle="tab" data-bs-target="#route2" type="button"
										role="tab" aria-controls="route2">T1⇿ 장기주차장</button>
								</li>
								<li class="nav-item flex-fill" role="presentation">
									<button class="nav-link w-100" id="route3-tab"
										data-bs-toggle="tab" data-bs-target="#route3" type="button"
										role="tab" aria-controls="route3">T2 ⇿ 장기주차장</button>
								</li>
								<li class="nav-item flex-fill" role="presentation">
									<button class="nav-link w-100" id="route4-tab"
										data-bs-toggle="tab" data-bs-target="#route4" type="button"
										role="tab" aria-controls="route4">물류단지</button>
								</li>
							</ul>

							<div class="tab-content pt-2" id="myTabjustifiedContent">





								<!--노선1 내용  -->
								<div class="tab-pane fade show active" id="route1"
									role="tabpanel" aria-labelledby="route1-tab">



									<article class="article">

										<div class="center-image" id="image-container"
											style="text-align: center;  padding-top: 20px;">
											<img
												src="${path}/resources/images/busRoute/br1.png"
												alt="운행시간 이미지">
										</div>

										<hr>


										<div style="display: flex; justify-content: center;">
											<table class="table hr writing" style="width: 70%;">
												<tbody>
													<tr>
														<th>운행시간</th>

														<td colspan="3" class="suttle-time">
															<div class="d-flex align-items-center">
																<div>
																	AICC → T2차고지 : 04:30 ~ 23:00 (자세한 내용 : 시간표 참고) <br>
																	T2차고지 → AICC : 05:00 ~ 23:30 (자세한 내용 : 시간표 참고)
																	<!-- [끝]임시사용 -->
																</div>
																<a href="${path}/resources/document/BR1.xlsx"
																	class="btn btn-outline-success"
																	style="margin-left: 180px;"> <i class="bi bi-folder"></i>
																	시간표 다운로드
																</a>
															</div>
														</td>

													</tr>
													<tr>
														<th>운행간격</th>
														<td>30분</td>
														<th>이용요금</th>
														<td>무료</td>
													</tr>



												</tbody>
											</table>
										</div>


									</article>

								</div>


								<!--노선2 내용  -->
								<div class="tab-pane fade" id="route2" role="tabpanel"
									aria-labelledby="route2-tab">

									<article class="article">

										<div class="center-image" id="image-container"
											style="text-align: center;  padding-top: 20px;">
											<img
												src="${path}/resources/images/busRoute/br2.png"
												alt="운행시간 이미지">
										</div>

										<hr>

										<div style="display: flex; justify-content: center;">
											<table class="table hr writing" style="width: 70%;">
												<tbody>
													<tr>
														<th>운행시간</th>

														<td colspan="3" class="suttle-time">
															<div class="d-flex align-items-center">
																<div>
																T1 → 장기주차장 : 04:30 ~ 23:00 (자세한 내용 : 시간표 참고) <br> 
																장기주차장 → T1 : 04:50 ~ 23:20 (자세한 내용 : 시간표 참고) 
																<!-- [끝]임시사용 -->
															</div>
																<a href="/Airport80/resources/document/BR2.xlsx"
																	class="btn btn-outline-success"
																	style="margin-left: 180px;"> <i class="bi bi-folder"></i>
																	시간표 다운로드
																</a>
															</div>
														</td>
													</tr>
													<tr>
														<th>운행간격</th>
														<td id="intervalTime">30분</td>
														<th>이용요금</th>
														<td>무료</td>
													</tr>


												</tbody>
											</table>
										</div>

									</article>


								</div>

								<!--노선3 내용  -->
								<div class="tab-pane fade" id="route3" role="tabpanel"
									aria-labelledby="route3-tab">
									<article class="article">

										<div class="center-image" id="image-container"
											style="text-align: center;  padding-top: 20px;">
											<img
												src="${path}/resources/images/busRoute/br3.png"
												alt="운행시간 이미지">
										</div>

										<hr>


										<div style="display: flex; justify-content: center;">
											<table class="table hr writing" style="width: 70%;">
												<tbody>
													<tr>
														<th>운행시간</th>

														<td colspan="3" class="suttle-time">
															<div class="d-flex align-items-center">
																<div>														
																T2 → 장기주차장 : 04:30 ~ 23:00 (자세한 내용 : 시간표 참고) <br> 
																장기주차장 → T2 : 04:50 ~ 23:20 (자세한 내용 : 시간표 참고) 
																<!-- [끝]임시사용 -->
															</div>
																<a href="/Airport80/resources/document/BR3.xlsx"
																	class="btn btn-outline-success"
																	style="margin-left: 180px;"> <i class="bi bi-folder"></i>
																	시간표 다운로드
																</a>
															</div>																
														</td>
													</tr>
													<tr>
														<th>운행간격</th>
														<td id="intervalTime">30분</td>
														<th>이용요금</th>
														<td>무료</td>
													</tr>


												</tbody>
											</table>
										</div>

									</article>

								</div>

								<!--노선4 내용  -->
								<div class="tab-pane fade" id="route4" role="tabpanel"
									aria-labelledby="route4-tab">
									<article class="article">

										<div class="center-image" id="image-container"
											style="text-align: center;  padding-top: 20px;">
											<img
												src="${path}/resources/images/busRoute/br4.png"
												alt="운행시간 이미지">
										</div>

										<hr>


										<div style="display: flex; justify-content: center;">
											<table class="table hr writing" style="width: 70%;">
												<tbody>
													<tr>
														<th style="white-space: nowrap;">운행시간</th>

														<td colspan="3" class="suttle-time">물류단지 : 05:30 ~
															23:00
															<a href="/Airport80/resources/document/BR4.xlsx"
																	class="btn btn-outline-success" style="margin-left: 400px;"> <i class="bi bi-folder"></i>
																	시간표 다운로드
																</a>
														</td>
													</tr>
													<tr>
														<th>운행간격</th>
														<td id="intervalTime">30분</td>
														<th>이용요금</th>
														<td>무료</td>
													</tr>

												</tbody>
											</table>
										</div>

									</article>

								</div>



							</div>

						</div>











					</div>



				</div>
			</div>
		</div>





		<div id="hero-carousel" class="carousel slide" data-bs-ride="carousel"
			data-bs-interval="5000">



			<div class="carousel-item active"
				style="background-image: url(resources/open/assets/img/hero-carousel/airport1.jpg)"></div>
		</div>




		<script>
			CKEDITOR
					.replace(
							'brImg',
							{
								filebrowserImageUploadUrl : '${pageContext.request.contextPath }/uploadImage.do',
							});
		</script>




	</section>


</main>






