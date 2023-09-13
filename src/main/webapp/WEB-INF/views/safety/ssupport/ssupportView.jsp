<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<body>

	<section class="section">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">

						<!-- 게시판 헤더 영역 시작 -->
						<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;">
							<h5 class="card-tit">보안지원 접수</h5>
							<nav>
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
									<li class="breadcrumb-item active">보안지원 접수</li>
								</ol>
							</nav>
						</div>
						<!-- 게시판 헤더 영역 끝 -->


						<div class="d-flex">
							<div id="map" style="width: 50%; height: 700px;"></div>
							<div id="infoPanel" style="width: 50%; height: 700px;"></div>
						</div>
						<p id="result"></p>


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
      
      
      var polygon = '';
      // 도형 스타일을 변수로 설정합니다
      var strokeColor = '#39f', fillColor = '#cce6ff', fillOpacity = 0.5, hintStrokeStyle = 'dash';
      
      var areas = [];
      var selectedArea = null;
      
       $(document).on('click', '.secReqid', function(e) {
    	   if(polygon){
    	   polygon.setMap(null);
    	   }
          e.preventDefault();
              var zoneCd = $(this).data('where');
              var reqCa = $(this).data('ca');
              var fc = '#022ac9';
           $.ajax({
               url: '<c:url value="/zone/zoneArea.do"/>',
               dataType: 'json',
               data: { zoneCd: zoneCd },
               success: function(responseData) {
                   areas = responseData;
                   for (var i = 0, len = areas.length; i < len; i++) {
                       var lama = areas[i].path.map(p => new kakao.maps.LatLng(p.la, p.ma));
                       if(areas[i].data.zoneFloor == 1){
                          fc = '#02c926';
                       }
                       var area = { path: lama, name: areas[i].name, strokeColor: fc, fillColor: reqCa, data: areas[i].data };
                       displayArea(area);
                       panTo(area);
                   }
               }
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
            fillColor : area.fillColor,
            fillOpacity : 0.5
         });
                

          
//          var content = '<div class="info">'
//                   + '   <div class="title">' + area.data.zoneFloor+ " 층 " + area.data.zoneCtgr
//                   + '</div>' + '   <div class="size">구역코드 : '
//                   + area.name   + '</div>' + '</div>';

//          var position = new kakao.maps.LatLng( area.path[3].Ma, area.path[3].La);
         
//          infowindow.setContent(content);
//          infowindow.setPosition(position); 
//          infowindow.setMap(map);
      };

      
      
      
      // 페이지 들어오자마자 동작하는 레디 펑션 
      $(document).ready(function(){
         securityBoard();
      });
      
      
      // 보안요청게시판 불러오는 펑션
      function securityBoard(){
         $.ajax({
            url : '<c:url value="/safety/seBoardList.do"/>',
            method: 'get',
            dataType: 'html',
            success: function(data){
               $('#infoPanel').html(data);
            },
            error: function (jqXHR, status, error){
                  console.log(jqXHR);
                  console.log(status);
                  console.log(error);
            }
         });
         
         // 지도에서 구역 표시 끄는 명령
         $(document).on('click', '.poff', function() {
            polygon.setMap(null);infowindow.setMap(null);
         });
         
         
      }
      
      
   </script>
</body>
</html>