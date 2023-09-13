<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<div
	class="container-fluid container-xl d-flex align-items-center justify-content-between">

	<a href="${pageContext.request.contextPath }" class="logo d-flex align-items-center"> <!-- Uncomment the line below if you also wish to use an image logo -->
		<!-- <img src="assets/img/logo.png" alt=""> -->
		<h1>
			AIRPORT:80<span>.</span>
		</h1>
	</a> <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i> <i
		class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
	<nav id="navbar" class="navbar">
		<ul>
			<li class="dropdown"><a href="#"><span>출발 도착</span> <i
					class="bi bi-chevron-down dropdown-indicator"></i></a>
				<ul>
					<li><i class="bx bxs-plane-take-off" style="font-size:23px; margin-top: 8px; margin-left: 9px; margin-right: -8px;">
					</i><a href="/Airport80/flights/flightDepartures" style="display: inline-block; width: 100%;">출발시간</a></li>
					<li><i class="bx bxs-plane-land" style="font-size:23px; margin-top: 8px; margin-left: 9px; margin-right: -8px;">
					</i><a href="/Airport80/flights/flightArrivals" style="display: inline-block; width: 100%;">도착시간</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#"><span>교통</span> <i
					class="bi bi-chevron-down dropdown-indicator"></i></a>
				<ul>
					<li><a href="/Airport80/open/operate/brList.do">셔틀버스</a></li>

				</ul>
			</li>
			<li class="dropdown"><a href="#"><span>쇼핑 식당</span> <i
					class="bi bi-chevron-down dropdown-indicator"></i></a>
				<ul>
					<li><a href="/Airport80/open/hr/vendorCos.do">면세점 쇼핑</a></li>
					<li><a href="#">일반 쇼핑</a></li>
					<li><a href="#">식당</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#"><span>게시판</span> <i
					class="bi bi-chevron-down dropdown-indicator"></i></a>
				<ul>
					<li><a href="/Airport80/open/operate/cnbList.do">전체게시판</a></li>
					<li><a href="/Airport80/open/operate/lostItemList.do">분실물</a></li>
				</ul>
			</li>
			<li><a href="/Airport80/open/operate/bnList.do">모집공고</a></li>
			<li><a href="javascript:;fn_chatbot()">챗봇<i class="bi bi-chat-dots"></i></a></li>
		</ul>
	</nav>
	
</div>
<script type="text/javascript">
function fn_chatbot() {
    var url = "${pageContext.request.contextPath}/chatbot";
    var width = 600;
    var height = 580;

    // 화면 가운데 위치 계산
    var left = (window.innerWidth - width) / 2;
    var top = (window.innerHeight - height) / 2;

    // 팝업 창 열기
    var popupWindow = window.open(url, "chatbot", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
}
</script>