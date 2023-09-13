<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />





<style>

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

</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
				<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">				
				 <h5 class="card-tit">셔틀버스</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">교통</a></li>
					        <li class="breadcrumb-item active">셔틀버스 노선</li>
					      </ol>
					    </nav>
				</div>
				
					 <div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							셔틀버스 노선은 비로그인 사용자들이 조회하고 운행정보를 확인할 수 있으며 각 노선의 시간표를 다운받을 수 있습니다.</span>
						</p>
					</div>					

<div class="card" style="display: flex; justify-content: center; width: 100%; height:100%;">
	<div class="card-body">
		<br>
		
		<ul class="nav nav-tabs d-flex" id="myTabjustified" role="tablist">
			<li class="nav-item flex-fill" role="presentation">
				<button class="nav-link w-100 active" id="route1-tab"
					data-bs-toggle="tab" data-bs-target="#route1" type="button"
					role="tab" aria-controls="route1"> AICC ⇿ T1⇿ T2 </button>
			</li>
			<li class="nav-item flex-fill" role="presentation">
				<button class="nav-link w-100" id="route2-tab" data-bs-toggle="tab"
					data-bs-target="#route2" type="button" role="tab"
					aria-controls="route2"> T1⇿ 장기주차장 </button>
			</li>
			<li class="nav-item flex-fill" role="presentation">
				<button class="nav-link w-100" id="route3-tab" data-bs-toggle="tab"
					data-bs-target="#route3" type="button" role="tab"
					aria-controls="route3"> T2 ⇿ 장기주차장 </button>
			</li>
			<li class="nav-item flex-fill" role="presentation">
				<button class="nav-link w-100" id="route4-tab" data-bs-toggle="tab"
					data-bs-target="#route4" type="button" role="tab"
					aria-controls="route4"> 물류단지 </button>
			</li>
		</ul>

		<div class="tab-content pt-2" id="myTabjustifiedContent">





			<!--노선1 내용  -->
			<div class="tab-pane fade show active" id="route1" role="tabpanel"
				aria-labelledby="route1-tab">



				<article class="article">

					<div class="center-image" id="image-container"
						style="text-align: center; padding-bottom: 10px; padding-top: 20px;">
						<img
							src="${path}/resources/images/busRoute/br1.png"
							alt="운행시간 이미지" >
					</div>
					
					<hr>


				<div style="display: flex; justify-content: center; padding-top:10px;">
					<table class="table hr writing" style="width: 75%;">
						<tbody>
							<tr>
								<th>운행시간</th>
								
								<td colspan="3" class="suttle-time">AICC → T2차고지 : 04:30 ~
									23:00 (자세한 내용 : 시간표 참고) <br> T2차고지 → AICC : 05:00 ~ 23:30

									(자세한 내용 : 시간표 참고) <!-- [끝]임시사용 -->
									
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
						style="text-align: center; padding-bottom: 10px; padding-top: 20px;">
						<img
							src="${path}/resources/images/busRoute/br2.png"
							alt="운행시간 이미지">
					</div>

					<hr>

				<div style="display: flex; justify-content: center;  padding-top: 10px;">
					<table class="table hr writing" style="width: 75%;">
						<tbody>
							<tr>
								<th>운행시간</th>
								
								<td colspan="3" class="suttle-time">T1 → 장기주차장 : 04:30 ~
									23:00 (자세한 내용 : 시간표 참고) <br> 장기주차장 → T1 : 04:50 ~ 23:20

									(자세한 내용 : 시간표 참고) <!-- [끝]임시사용 -->
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
						style="text-align: center; padding-bottom: 10px; padding-top: 20px;">
						<img
							src="${path}/resources/images/busRoute/br3.png"
							alt="운행시간 이미지">
					</div>
					
					<hr>


				<div style="display: flex; justify-content: center; padding-top: 10px;">
					<table class="table hr writing" style="width: 75%;">
						<tbody>
							<tr>
								<th>운행시간</th>
							
								<td colspan="3" class="suttle-time">T2 → 장기주차장 : 04:30 ~
									23:00 (자세한 내용 : 시간표 참고) <br> 장기주차장 → T2 : 04:50 ~ 23:20

									(자세한 내용 : 시간표 참고) <!-- [끝]임시사용 -->
								</td>
							</tr>
							<tr>
								<th>운행간격</th>
								<td id="intervalTime"> 30분</td>
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
						style="text-align: center; padding-bottom: 10px; padding-top: 20px;">
						<img
							src="${path}/resources/images/busRoute/br4.png"
							alt="운행시간 이미지">
					</div>
					
					<hr>


				<div style="display: flex; justify-content: center; padding-top: 10px;">
					<table class="table hr writing" style="width: 75%;">
						<tbody>
							<tr>
								<th>운행시간</th>
								
								<td colspan="3" class="suttle-time">물류단지 : 05:30 ~
									23:00 

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
	</div>
</section>




<script>
	CKEDITOR
			.replace(
					'brImg',
					{
						filebrowserImageUploadUrl : '${pageContext.request.contextPath }/uploadImage.do',
					});
</script>


