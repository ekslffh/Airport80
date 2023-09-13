<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.leftth {
	width: 20%;
}

.timecless {
	width: 35%;
}
</style>
<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">공항 내 시설물 관리</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">시설관리</a></li>
								<li class="breadcrumb-item active">공항 내 시설물 관리</li>
							</ol>
						</nav>
					</div>

					<div class="d-flex">
						<div id="map" style="width: 100%; height: 450px;"></div>
					</div>
					<table style="margin-top: 15px; margin-bottom: 15px;">
						<tr>
							<th>카테고리</th>
							<td><select name="zoneSelect" id="zoneSelect" class="form-select zoneList" onchange="updateFacilityOptions()">
									<option value="">구역 선택</option>
									<c:forEach items="${zoneList}" var="zone">
										<option value="${zone.zoneCd}" class="${zone.zoneFloor}">${zone.zoneFloor}층${zone.zoneCtgr}</option>
									</c:forEach>
							</select></td>
							<td><select name="facilityList" id="facilitys" class="form-select facility" onchange="getFacilityInfo()">
									<option value="" label="시설물 선택" />
									<c:forEach items="${facilityList}" var="fl">
										<option value="${fl.fcCd}" class="${fl.zoneCd}">${fl.fcNm}</option>
									</c:forEach>
							</select></td>
						</tr>
					</table>
					<table class="table table-bordered">
						<tr>
							<th class="leftth">시설명</th>
							<td><input class="form-control" type="text" id="fcNm" /></td>
							<th class="leftth">시설코드</th>
							<td><input class="form-control" type="text" id="fcCd" readonly /></td>
						</tr>
						<tr>
							<th class="leftth">시설 위치</th>
							<td><input class="form-control" type="text" id="fcLoc" readonly /></td>
							<th class="leftth">시설 구분</th>
							<td><input class="form-control" type="text" id="fcCtgr" /></td>
						</tr>
						<tr>
							<th class="leftth">시설 상태</th>
							<td><select class="form-select" id="fcSt">
								<option value="">선택</option><!-- 기본값은 빈 값 -->
								<option value="ON">운영</option>
								<option value="OF">미운영</option>
							</select></td>
							<th class="leftth">시설 운영시간</th>
							<td style="display: flex;"><select class="form-control timecless" id="startTime" name="startTime">
									<option value="">선택</option><!-- 기본값은 빈 값 -->
									<c:forEach begin="0" end="23" var="hour">
										<option value="${String.format('%02d:00', hour)}">${hour}:00</option>
									</c:forEach>
							</select> 부터 <select class="form-control timecless" id="endTime" name="endTime">
									<option value="">선택</option><!-- 기본값은 빈 값 -->
									<c:forEach begin="0" end="23" var="hour">
										<option value="${String.format('%02d:59', hour)}">${hour}:59</option>
									</c:forEach>
							</select> 까지</td>
						</tr>
						<tr>
							<td colspan="4" class="text-center">
								<div class="info" style="width: 100%; text-align: left;">
									<p class="cofistooltip">
										<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> <span data-bs-toggle="tooltip" data-bs-placement="top" title="시설물과 편의시설의 조회 및 수정이 가능합니다.">시설물
											수정 안내</span>
									</p>
									<p class="reason">
										시설물은 시설명, 코드, 상태, 운영시간만 수정 가능합니다. 코드 수정시 3글자 중앙에 구역명 규칙을 지켜 주시기 바랍니다.
									</p>
								</div> <a class="btn btn-success" href="#">수정</a>
							</td>
						</tr>
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
        center: new kakao.maps.LatLng(37.44947191518925, 126.45042880434359), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption),
    customOverlay = new kakao.maps.CustomOverlay({}),
    infowindow = new kakao.maps.InfoWindow({
        removable: true
    });

// 도형 스타일을 변수로 설정합니다
var strokeColor = '#39f',
    fillColor = '#cce6ff',
    fillOpacity = 0.5,
    hintStrokeStyle = 'dash';

var areas = [];
var selectedArea = null;
var fc = '';
var displayedAreas = []; // 현재 표시된 지역을 저장할 배열

function updateFacilityOptions() {
    var selectedZone = document.getElementById("zoneSelect").value;
    var facilitySelect = document.getElementsByName("facilityList")[0];
    var facilityOptions = facilitySelect.options;

    // 구역 값 가져오기
    for (var i = 0, len = displayedAreas.length; i < len; i++) {
        displayedAreas[i].setMap(null);
    }

    // 모든 시설물 옵션 숨기기
    for (var i = 0; i < facilityOptions.length; i++) {
        facilityOptions[i].style.display = "none";
    }

    if (selectedZone === "") {
        // 선택되지 않은 구역일 때 모든 시설물 옵션 표시
        for (var i = 0; i < facilityOptions.length; i++) {
            facilityOptions[i].style.display = "block";
        }
    } else {
        // 선택한 구역에 해당하는 시설물 옵션만 표시
        for (var i = 0; i < facilityOptions.length; i++) {
            var facility = facilityOptions[i];
            if (facility.classList.contains(selectedZone)) {
                facility.style.display = "block";
            }
        }
    }

    // AJAX 요청을 보내는 부분
    $.ajax({
        url: '<c:url value="/zone/zoneArea.do"/>',
        dataType: 'json',
        data: { zoneCd: selectedZone }, // 선택한 구역 값을 AJAX 데이터로 전달
        success: function (responseData) {
            areas = responseData;
            for (var i = 0, len = areas.length; i < len; i++) {
                var lama = areas[i].path.map(p => new kakao.maps.LatLng(p.la, p.ma));
                var fc = areas[i].data.zoneFloor == 1 ? '#02c926' : '#022ac9';
                var area = { path: lama, name: areas[i].name, strokeColor: fc, data: areas[i].data };
                displayArea(area);
                panTo(area);
                displayedAreas.push(polygon); // 현재 표시된 지역을 배열에 저장
            }
        }
    });
}

function getFacilityInfo() {
    var selectedFc = document.getElementById("facilitys").value;
    var startTimeSelect = document.getElementById("startTime");
    var endTimeSelect = document.getElementById("endTime");

    // AJAX 요청을 보내는 부분
    $.ajax({
        url: '<c:url value="/infra/getfacility.do"/>',
        dataType: 'json',
        data: { fcCd: selectedFc }, // 선택한 구역 값을 AJAX 데이터로 전달
        success: function (responseData) {
            fc = responseData;
            document.getElementById("fcNm").value = fc.fcNm; // 시설명
            document.getElementById("fcCd").value = fc.fcCd; // 시설코드
            document.getElementById("fcLoc").value = (fc.zone.zoneFloor + "층 " + fc.zone.zoneCtgr); // 시설 위치
            document.getElementById("fcCtgr").value = fc.fcCtgr; // 시설 구분
            // 시설 상태 선택
            document.getElementById("fcSt").value = fc.fcStatus;

            // 시작 시간을 설정
            for (var i = 0; i < startTimeSelect.options.length; i++) {
                if (startTimeSelect.options[i].value === fc.fcStartHours) {
                    startTimeSelect.selectedIndex = i;
                    break;
                }
            }

            // 종료 시간을 설정
            for (var i = 0; i < endTimeSelect.options.length; i++) {
                if (endTimeSelect.options[i].value === fc.fcEndHours) {
                    endTimeSelect.selectedIndex = i;
                    break;
                }
            }
        }
    });
}

// 수정 버튼 클릭 시
$(document).on("click", ".btn-success", function () {
	// 입력된 값 가져오기
    var fcCd = $("#fcCd").val();
    var fcNm = $("#fcNm").val();
    var fcSt = $("#fcSt").val();
    var startTime = $("#startTime").val();
    var endTime = $("#endTime").val();

    // AJAX 요청을 보내기 위한 데이터 생성
    var data = {
        fcCd: fcCd,
        fcNm: fcNm,
        fcStatus: fcSt,
        fcStartHours: startTime,
        fcEndHours: endTime
    };

    // AJAX 요청 보내기
    $.ajax({
        type: "POST", // 또는 "PUT" 등 HTTP 요청 메서드 지정
        url: '<c:url value="/infra/updatefacility.do"/>', // 수정할 기능을 처리하는 서버의 URL
        data: JSON.stringify(data), // 객체를 JSON 문자열로 변환
        contentType: 'application/json', // 요청 헤더에 JSON 데이터임을 명시
        dataType: 'json', // 응답 데이터 타입 지정 (JSON)
        success: function (response) {
            // 성공적으로 요청을 처리한 경우
            if (response > 0) {
                Swal.fire({
                    icon: 'success',
                    title: '성공',
                    text: '시설 정보가 업데이트되었습니다.',
                })
            } else {
            	Swal.fire({
                    icon: 'error',
                    title: '실패',
                    text: '업데이트 중 오류가 발생했습니다',
                });
            }
        },
        error: function (xhr, status, error) {
            Swal.fire({
                icon: 'error',
                title: '실패...',
                text: '업데이트 중 오류가 발생했습니다...',
            });
        }
    });
});


function panTo(area) {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(area.path[1].Ma, area.path[1].La);
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);
}

var polygon = '';

function displayArea(area) {
    // 다각형을 생성합니다 
    polygon = new kakao.maps.Polygon({
        map: map, // 다각형을 표시할 지도 객체
        path: area.path,
        strokeWeight: 3,
        strokeColor: area.strokeColor,
        strokeOpacity: 0.8,
        fillColor: '#0dff00',
        fillOpacity: 0.5
    });
};
</script>
</html>