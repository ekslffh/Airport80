<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">편의시설</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">시설관리</a></li>
								<li class="breadcrumb-item active">편의시설</li>
							</ol>
						</nav>
					</div>

					<div class="d-flex">
						<div id="map" style="width: 100%; height: 450px;"></div>
					</div>
					<table class="table Default Table table-hover">
						<thead class="table-light">
							<tr>
								<th>편의시설</th>
								<th>위치</th>
								<th>운영상태</th>
								<th>운영시간</th>
							</tr>
						</thead>
						<tbody id="table1">
							<c:set var="convList" value="${convList }" />
							<c:if test="${empty convList }">
								<tr>
									<td colspan="4">요청내용 없음.</td>
								</tr>
							</c:if>
							<c:if test="${not empty convList}">
								<c:forEach items="${convList}" var="conv">
									<tr>
										<td>${conv.fcNm}<input type="hidden" name="zoneCd" value="${conv.zoneCd}"></td>
										<td>${conv.zone.zoneFloor}층 ${conv.zone.zoneCtgr}</td>
										<c:if test="${conv.fcStatus == 'ON'}">
											<td>운영</td>
										</c:if>
										<c:if test="${conv.fcStatus != 'ON'}">
											<td>미운영</td>
										</c:if>
										<td>${conv.fcStartHours}~ ${conv.fcEndHours}</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3753a3d65ef48f157bb218e0a2a4f142"></script>
<script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(37.44947191518925,
               126.45042880434359), // 지도의 중심좌표
         level : 3
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
      
      var areas = [];
      var selectedArea = null;
      var polygon = '';
      $(document).ready(function() {
          var displayedAreas = []; // 현재 표시된 지역을 저장할 배열
          
          // 각 행을 클릭할 때 Ajax 요청 보내기
          $('tr').click(function() {
        	  // 이전에 표시된 지역 제거
              for (var i = 0, len = displayedAreas.length; i < len; i++) {
                  displayedAreas[i].setMap(null);
              }
              var zoneCd = $(this).find('input[name="zoneCd"]').val();
              
              $.ajax({
                  url: '<c:url value="/zone/zoneArea.do"/>',
                  dataType: 'json',
                  data: { zoneCd: zoneCd },
                  success: function(responseData) {
                      // Ajax 요청 성공 시 동작
                      var fc = '#022ac9'; // 기본 색상
                      areas = responseData;
                      for (var i = 0, len = areas.length; i < len; i++) {
                          var lama = areas[i].path.map(p => new kakao.maps.LatLng(p.la, p.ma));
                          if (areas[i].data.zoneFloor == 1) {
                              fc = '#02c926';
                          }
                          var area = { path: lama, name: areas[i].name, strokeColor: fc, data: areas[i].data };
                          displayArea(area);
                          panTo(area);
                          displayedAreas.push(polygon); // 현재 표시된 지역을 배열에 저장
                      }
                  }
              });
          });
      });
       
       function panTo(area) {
           // 이동할 위도 경도 위치를 생성합니다 
          var moveLatLon = new kakao.maps.LatLng( area.path[1].Ma, area.path[1].La);
           // 지도 중심을 부드럽게 이동시킵니다
           // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
           map.panTo(moveLatLon);
       }       
    
       

      function displayArea(area) {

         // 다각형을 생성합니다 
          polygon = new kakao.maps.Polygon({
            map : map, // 다각형을 표시할 지도 객체
            path : area.path,
            strokeWeight : 3,
            strokeColor : area.strokeColor,
            strokeOpacity : 0.8,
            fillColor : '#0dff00',
            fillOpacity : 0.5
         });
      };
      
      </script>
</html>