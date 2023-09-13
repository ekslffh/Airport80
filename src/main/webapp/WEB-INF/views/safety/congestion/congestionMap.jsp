<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3753a3d65ef48f157bb218e0a2a4f142"></script>



<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">공항내 혼잡도 관리</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item active">공항 혼잡도</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->
				

					<div class="d-flex">
						<div id="map" style="width: 68%; height: 700px;"></div>
						<div id="result" class="card" style="width: 34%; margin-left: 20px; height: 700px;">
							<div class="card-header cftitle">
								공항 실시간 혼잡도 <span class="cftext">* 공공데이터API 5분마다 갱신</span>
							</div>
							<div class="card-body">

								<div class="date_area">
									<p id="uptime" class="mpexit"></p>
									<p id="date"></p>
								</div>


								<p class="cfsu" data-bs-toggle="modal" data-bs-target="#disablebackdrop">
									<span data-bs-toggle="tooltip" data-bs-placement="top" title="구역당 수용인원 확인가능">구역당 수용인원</span><i class="bi bi-exclamation-circle cficon"></i>
								</p>


								<div>
									<table class="table table-sm">
										<tbody class="table table-bordered border-primary">
											<tr class="table-primary">
												<td class="text-center">구역</td>
												<td class="text-center">상태</td>
											</tr>
										</tbody>
									</table>
								</div>

								<div class="thtble req-body">
									<table id="myTable" class="table table-sm">
										<tbody id="tbddy">
										</tbody>
									</table>
								</div>

								<ul class="d-flex conul">
									<li><span class="step1"><span></span>적음</span></li>
									<li><span class="step2"><span></span>원활</span></li>
									<li><span class="step3"><span></span>보통</span></li>
									<li class="listep4"><span class="step4"><span></span>약간혼잡</span></li>
									<li class="listep5"><span class="step5"><span></span>매우혼잡</span></li>
								</ul>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- Disabled Backdrop Modal -->
		<div class="modal fade" id="disablebackdrop" tabindex="-1" data-bs-backdrop="false" class="congmd">
			<div class="modal-dialog" style="margin-top: 187px; margin-right: 82px; width: 240px;">
				<div class="modal-content" style="">
					<div class="modal-header" style="border: 0;">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table table-sm">
							<thead class="table table-bordered border-primary">
								<tr class="table-light">
									<td class="text-center">구역</td>
									<td class="text-center">수용인원</td>
								</tr>
							</thead>
							<tbody id="modalcontent">

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- End Disabled Backdrop Modal-->

		<script>
	//갱신시간 지금시간
	var uptime; 

	
	//로딩 직후 api를 호출하여 congs에 실시간 혼잡도 데이터 호출
	$(document).ready(function(){
		getCongestions();
		
	
	});
		
	//혼잡도배열 0(적음) 1(원활),2(보통),3(약간혼잡),4(매우혼잡)
	var congs = []; 
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.44947191518925,
				126.45042880434359), // 지도의 중심좌표
		level : 4
	// 지도의 확대 레벨
	};

	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption)
	, customOverlay = new kakao.maps.CustomOverlay({})
	, infowindow = new kakao.maps.InfoWindow({
		removable : true
	});
	
	
	
	// 도형 스타일을 변수로 설정합니다
	var strokeColor = '#39f', fillColor = '#cce6ff', fillOpacity = 0.5, hintStrokeStyle = 'dash';
	
	//구역 0~19번까지 areas.name 구역이름
	var areas = [];
	var resp;
	var congcolor;
	var gre = "#09ff00";
	var yel = "#f2ff00";
	var org = "#ff6907";
	var red = "rgb(245 0 0)";
	var gra = "rgb(163 163 163)"

	
	function loadZoneAreas() {
        $.ajax({
            url: '<c:url value="/zone/zoneAreaList.do"/>',
            dataType: 'json',
            success: function(respData) {
            	areas = respData;
                for (var i = 0, len = areas.length; i < len; i++) {
                	var ctgr = areas[i].data.zoneCtgr;
                	var opac = 0.0;
                	if(ctgr.includes('게이트')){
                		opac = 0.8;
                	}
                	
                	var c = congs[i];
                	
                	if(c == 0){
                		congcolor = gra;
                	} else if(c == 1){
                		congcolor = gre;
                	}else if(c == 2){
                		congcolor = yel;
                	} else if(c == 3){
                		congcolor = org;
                	} else if(c == 4){
                		congcolor = red;
                	} else {
                		congcolor = "#ffffff"
                	}
                	
                    var lama = areas[i].path.map(p => new kakao.maps.LatLng(p.la, p.ma));
                    var area = { path: lama, name: areas[i].name, fillColor: congcolor, strokeOpacity : opac, data: areas[i].data };
                    displayArea(area);
                }
            	
            	 // 테이블과 테이블 바디 가져오기
                const table = document.getElementById("myTable");
                const tbody = table.querySelector("tbody")
                
                
//              	for(let i = 0, len = areas.length; i < len; i++){
//             		let ctgr = areas[i].data.zoneCtgr;
//             		let cong = congs[i];
//             		console.log("구역 =>",ctgr , " 혼잡도 : ",cong);	
            		
//             	}
             	
                let trTags = [];
                let modalTags = [];
                $.each(areas, function (index, area) {
                	 // areas와 congs 배열에서 데이터 가져오기
                	let ctgr = area.data.zoneCtgr;
                	let cong = congs[index];
                	let cpcy = area.data.zoneCapacity;
                	
                	let congestionStatus = '';
                	let congestionClass = '';

                	if (cong === 0) {
                	    congestionStatus = '적음';
                	    congestionClass = 'notconf';
                	} else if (cong === 1) {
                	    congestionStatus = '원활';
                	    congestionClass = 'goodconf';
                	} else if (cong === 2) {
                	    congestionStatus = '보통';
                	    congestionClass = 'soconf';
                	} else if (cong === 3) {
                	    congestionStatus = '약간혼잡';
                	    congestionClass = 'someconf';
                	} else if (cong === 4) {
                	    congestionStatus = '매우혼잡';
                	    congestionClass = 'manyconf';
                	}

                	let tr = $("<tr>").addClass("confsz").append(
                		$("<td>").addClass("text-center").addClass(congestionClass).text(ctgr),
                	    $("<td>").addClass("text-center").append($("<span>").addClass(congestionClass).text(congestionStatus))
                	);
                	
                	let modaltr =  $("<tr>").addClass("confsz").append(
                    		$("<td>").addClass("text-center").addClass(congestionClass).text(ctgr),
                    	    $("<td>").addClass("text-center").addClass("text-primary").text(cpcy+"명")
                    	);
                	
                	trTags.push(tr);
                	modalTags.push(modaltr);
                	
             		$("#tbddy").html(trTags); 
             		$("#modalcontent").html(modalTags);
                });
                	
                
                
                
            }
        });
    };
    
    
		function displayArea(area) {

			// 다각형을 생성합니다 
			 polygon = new kakao.maps.Polygon({
				map : map, // 다각형을 표시할 지도 객체
				path : area.path,
				strokeWeight : 3,
				strokeColor : '#000000',
				strokeOpacity : area.strokeOpacity,
				fillColor : area.fillColor,
				fillOpacity : 0.5
			});
		          
		};
	
	
		function getCongestions(){
			$.ajax({
				type : 'GET',
				url : 'https://api.odcloud.kr/api/getAPRTPsgrCongestion/v1/aprtPsgrCongestion%E2%80%8B?page=1&perPage=10&serviceKey=f5uTFtjYfPdUktXwtn3RIcH3UmdM0Csspo1cvvo9b4l3csZH3Q6lyrwdQXJ00RFSA%2FovqdnRfG9gLSbHhZBx3g%3D%3D',
				dataType : 'json',
				contentType : 'application/json; charset=utf-8',
			}).done(function(res) {
				uptime = res.data[0].PRC_HR;
				console.log("시간",uptime);
				$("#uptime").html(uptime);
				
				// 현재 날짜를 가져오기 위해 Date 객체를 생성
				var currentDate = new Date();
				
				// 연도, 월, 일 정보 가져오기
				var year = currentDate.getFullYear(); // 연도
				var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
				var day = currentDate.getDate().toString().padStart(2, '0');
				
				// 날짜를 원하는 형식으로 출력 (예: "2023년 8월 25일")
				var formattedDate = year + '-' + month + '-' + day;
				
				// 결과를 콘솔에 출력 또는 웹 페이지에 삽입
				console.log("오늘 날짜: " + formattedDate)
				
				$("#date").html(formattedDate);
				
				resp = res;
				
				var cnt = 0;
				for(i = 0; i < res.data.length; i++){
					congs[cnt] = res.data[i].CGDR_ALL_LVL;
					congs[cnt + 1] = res.data[i].CGDR_A_LVL;
					congs[cnt + 2] = res.data[i].CGDR_B_LVL;
					congs[cnt + 3] = res.data[i].CGDR_C_LVL;
					cnt = cnt + 4;
				}
				loadZoneAreas();
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		}
		
		
	</script>