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
						<h5 class="card-tit">점검 일정/일지</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">일정현황</a></li>
								<li class="breadcrumb-item active">점검 일정/일지</li>
							</ol>
						</nav>
					</div>

					<div class="d-flex">
						<div id="map" class="col-lg-6" style="height: 500px;"></div>
						<div class="col-lg-6">
							<div id="pieChart" style="height: 250px;"></div>
							<div id="barChart" style="height: 250px;"></div>
						</div>
					</div>

					<table class="table table-bordered">
						<tr>
							<th>점검번호</th>
							<td>${rep.rlNo}</td>
							<th>점검명</th>
							<td>${rep.rlIt}</td>
						</tr>
						<tr>
							<th>점검일자</th>
							<td>${rep.rlDt}</td>
							<th>위치</th>
							<td>${rep.zone.zoneFloor}층${rep.zone.zoneCtgr}${rep.facility.fcNm}</td>
						</tr>
						<tr>
							<th>점검 내용</th>
							<td colspan="3">${rep.rlContent}</td>
						</tr>
						<tr>
							<th>점검주기</th>
							<td>${rep.rlIc}</td>
							<th>상태 (결과)</th>
							<td>${rep.common.codeNm1}(${rep.common.codeNm2})</td>
						</tr>
						
					</table>
					
					<div class="d-flex justify-content-end">
								<a class="btn btn-primary" href="#" style="margin-right:4px;">정상</a>
								<a class="btn btn-danger" href="#" style="margin-right:4px;">미흡</a>
								<a class="btn btn-dark" href="#" style="margin-right:4px;">일정취소</a>
								<c:url	value='/infra/replog/replogUpdate.do' var="updateURL">
									<c:param name="what" value="${rep.rlNo}" />
								</c:url> <a class="btn btn-secondary" href="<c:url value='/infra/repLogList.do'/>">목록</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3753a3d65ef48f157bb218e0a2a4f142"></script>
<script>
//${rep.common.codeNm2} 값을 JavaScript 변수로 가져오기
var rlStatus = "${rep.rlIr}";

// 버튼 제어 함수
function controlButtons() {
    if (rlStatus == "WT") {
        // WT 일때는 모든 버튼을 보여줍니다.
        $(".btn-primary").show();
        $(".btn-danger").show();
        $(".btn-dark").show();
    } else if (rlStatus == "NN") {
        // NN 일때는 정상 버튼만 보이게 하고 나머지 버튼은 숨깁니다.
        $(".btn-primary").show();
        $(".btn-danger").hide();
        $(".btn-dark").hide();
    } else if (rlStatus == "SS") {
        // SS 일때는 미흡 버튼만 보이게 하고 나머지 버튼은 숨깁니다.
        $(".btn-primary").hide();
        $(".btn-danger").show();
        $(".btn-dark").hide();
    } else if (rlStatus == "CAN") {
        // CAN 일때는 일정취소 버튼만 보이게 하고 나머지 버튼은 숨깁니다.
        $(".btn-primary").hide();
        $(".btn-danger").hide();
        $(".btn-dark").show();
    }
}


var rlNo;

// 정상 버튼 클릭 시
$(document).on("click", ".btn-primary", function() {
    rlNo = "${rep.rlNo}";
    sendUpdateRequest(rlNo, "SS");
});

// 미흡 버튼 클릭 시
$(document).on("click", ".btn-danger", function() {
    rlNo = "${rep.rlNo}";
    sendUpdateRequest(rlNo, "NN");
});

// 일정취소 버튼 클릭 시
$(document).on("click", ".btn-dark", function() {
    rlNo = "${rep.rlNo}";
    sendUpdateRequest(rlNo, "CAN");
});

function sendUpdateRequest(rlNo, status) {
    $.ajax({
        type: "GET",
        url: "<c:url value='/infra/replog/replogUpdate.do'/>",
        data: { what: rlNo, status: status },
        dataType: 'json',
        success: function(data) {
        	var req = data;
            if (req > 0) {
                Swal.fire({
                    icon: 'success',
                    title: '성공',
                    text: '점검 일정 상태가 변경되었습니다.',
                    footer: '<a href="<c:url value="/infra/repLogList.do"/>">목록으로 돌아가기</a>',
                }).then((result) => {
                    if (result.isConfirmed) {
                        // 확인 버튼을 눌렀을 때 페이지를 새로 고침
                        location.reload();
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: '실패',
                    text: '업데이트 중 오류가 발생했습니다!',
                    footer: '<a href="<c:url value="/infra/repLogList.do"/>">목록으로 돌아가기</a>'
                })
            }
        },
        error: function(xhr, status, error) {
            Swal.fire({
                icon: 'error',
                title: '실패...',
                text: '업데이트 중 오류가 발생했습니다...',
                footer: '<a href="<c:url value="/infra/repLogList.do"/>">목록으로 돌아가기</a>'
            })
        }
    });
}

 
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
      
    	// 페이지 로드 시 버튼 제어 함수 호출
      $(document).ready(function() {
    	   controlButtons();
           var zoneCd = '${rep.rlSection}';
           var fc = '#022ac9';
           console.log(zoneCd);
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
                       var area = { path: lama, name: areas[i].name, strokeColor: fc, data: areas[i].data };
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
    
       var polygon = '';

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
      
      document.addEventListener("DOMContentLoaded", () => {
    	  var rlFc = '${rep.rlFc}';
    	  var ssall; var nnall; var wtall; var fss; var fnn; var fwt;
    	  $.ajax({
              url: '<c:url value="/infra/replog/replogCharts.do"/>',
              dataType: 'json',
              data: { rlFc: rlFc },
              success: function(responseData) {
              	ssall = responseData[0].repCharnm;
              	nnall = responseData[1].repCharnm;
              	wtall = responseData[2].repCharnm;
              	fss = responseData[3].repCharnm;
              	fnn = responseData[4].repCharnm;
              	fwt = responseData[5].repCharnm;
              	drowChart();
              }
    	  });
    	function drowChart(){
        new ApexCharts(document.querySelector("#pieChart"), {
          series: [ssall, nnall, wtall],
          chart: {
            height: 250,
            type: 'pie',
            toolbar: {
              show: true
            }
          },
          labels: ['정상', '미흡', '대기']
        }).render();
        
        var options = {
                series: [{
                name: '정상',
                data: [fss]
              }, {
                name: '미흡',
                data: [fnn]
              }, {
                name: '대기',
                data: [fwt]
              }],
                chart: {
                type: 'bar',
                height: 250,
                stacked: true,
                stackType: '100%'
              },
              plotOptions: {
                bar: {
                  horizontal: true,
                },
              },
              stroke: {
                width: 1,
                colors: ['#fff']
              },
              title: {
                text: '* 위 : 전체 시설물 점검 이력 / 아래 : ${rep.zone.zoneFloor}층${rep.zone.zoneCtgr}${rep.facility.fcNm} 점검 이력'
              },
              colors: ['#33b2df', '#546E7A', '#d4526e'],
              xaxis: {
                  categories: ['점검 이력']
                },
              tooltip: {
                y: {
                  formatter: function (val) {
                    return val + "K"
                  }
                }
              },
              fill: {
                opacity: 1
              
              },
              legend: {
                position: 'top',
                horizontalAlign: 'left',
                offsetX: 40
              }
              };

              var chart = new ApexCharts(document.querySelector("#barChart"), options);
              chart.render();
    	}
      });
      
      </script>
</html>