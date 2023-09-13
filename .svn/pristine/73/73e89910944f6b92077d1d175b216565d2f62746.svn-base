<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
</head>
<body>
    <!-- 지도가 표시될 div -->
<div id="map" style="width:70%;height:600px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3753a3d65ef48f157bb218e0a2a4f142"></script>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.4439, 126.4555), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption);

//이미지 지도에 표시할 마커입니다

var positions = [
    {
        title: 'markerA', 
        content: '<div>A구역<br>현재현황 : 여유있음</div>',
        latlng: new kakao.maps.LatLng(37.4461, 126.4564)
    },
    {
        title: 'markerR', 
        content: '<div>R구역</div>',
        latlng: new kakao.maps.LatLng(37.4441, 126.4528)
    },
    {
        title: 'markerP',
        content: '<div>P구역</div>',
        latlng: new kakao.maps.LatLng(37.4449, 126.4578)
    },
    {
        title: 'markerT',
        content: '<div>T구역</div>',
        latlng: new kakao.maps.LatLng(37.442, 126.4527)
    }
]; 



// 마커에 마우스 올렸을 때 이름 뜨면서 주차 현황 보여주기
// kakao.maps.event.addListener(marker, 'mouseover', function() {

    // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
    // 마커의 이미지를 오버 이미지로 변경합니다
//     if (!selectedMarker || selectedMarker !== marker) {
//         marker.setImage(overImage);
//     }
// });




for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    
 // 클릭하면 주차장 신청폼으로 이동... 하기...?
    kakao.maps.event.addListener(marker, 'click', function(){
    	window.location.href = "http://localhost/Airport80/hr/parking/eplInsert.do";
    });
}

</script>
</body>
</html>