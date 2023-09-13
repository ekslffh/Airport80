<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- C3 css 추가 -->     
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
<!--d3 c3 js추가 -->
<script src="https://d3js.org/d3.v3.min.js"></script>     
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script src="<%=request.getContextPath() %>/resources/js/customLibs.js"></script>



<script>
    window.addEventListener('DOMContentLoaded', (event) => {
    	<c:if test="${not empty message}">
	    	swal.fire({
	            icon: 'warning',
	            title: '알림',
	            text: "${message}"
	        });
    	</c:if>
    });
</script>


<script>

	// 성공일때 알림창
	window.onload = function() {
	    var urlParams = new URLSearchParams(window.location.search);
	    var message = urlParams.get("message");
	
	    if (message !== null && message !== "") {
	        // 메시지를 표시
	        Swal.fire({
	            icon: 'success',
	            text: message,
	        });
	
	        // 메시지를 표시한 후, 쿼리 파라미터 'message'를 삭제
	        var newUrl = window.location.href.replace(/[?&]message=([^&#]*)/, '');
	        window.history.replaceState({}, document.title, newUrl);
	    }
	};

	
	
	
	$(document).on("ajaxError", function(jqXHR, settings, errorText){
		console.log("XMLHttpRequest : ", jqXHR);
		console.log("settings : ", settings);
		console.log("error : ", errorText);
	});
</script>

<script> 
// 페이지가 로드될 때 실행될 함수 이건 메뉴 선택 표시에 쓰임
window.addEventListener('load', function() {
    var sidebarState = localStorage.getItem('sidebarState');
    var currentURL = window.location.href; // 현재 페이지의 URL 가져오기
    
    if (sidebarState) {
        document.getElementById('sidebar-nav').innerHTML = sidebarState;
    }

    // 모든 'a' 태그 요소 가져오기
    var sidebarLinks = document.querySelectorAll('a');
    // 모든 'a' 태그에서 'active' 클래스 제거
    sidebarLinks.forEach(function(link) {
        link.classList.remove('active');
    });

    // 각 링크의 href 속성 가져오기
    sidebarLinks.forEach(function(link) {
        var linkURL = link.getAttribute('href');
        
        // 현재 URL과 링크 URL을 비교하여 'active' 클래스 추가
        if (currentURL.includes(linkURL)) {
            link.classList.add('active');
        }

        link.addEventListener('click', function(event) {      	
            localStorage.setItem('sidebarState', document.getElementById('sidebar-nav').innerHTML);
        });
    });
});
</script>