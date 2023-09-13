<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <script defer src="./index.js"></script> -->
<script
  defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3TxNhdSbVkt8TyxZKh2tFRspf_nmOqs&callback=initMap"
></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script type="module" src="${pageContext.request.contextPath }/resources/js/app/map/flight.js"></script>

<script>
window.initMap = function () {
  const map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.4692, lng: 126.4505 },
    zoom: 10,
  });
};
</script>

<div id="map" style="height: 600px;"></div>