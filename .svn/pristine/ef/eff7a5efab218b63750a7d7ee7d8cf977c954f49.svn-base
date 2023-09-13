<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Vendor JS Files -->
<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/chart.js/chart.umd.js"></script>
<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/echarts/echarts.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/quill/quill.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/in/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath }/resources/in/assets/js/main.js"></script>

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

<!-- <script src="/static/ap/js/lib/jquery-3.2.1.min.js"></script> -->
<!-- <script src="/static/ap/js/lib/jquery-ui.min.js"></script> -->
<!-- <script src="/static/ap/js/lib/jquery.fullpage.min.js"></script> -->
<!-- <script src="/static/ap/js/lib/jquery.bxslider.js"></script> -->
<!-- <script src="/static/ap/js/base_function.debug.js"></script> -->
<!-- <script src="/static/app/js/ap/ajax.mapping.js" ></script> -->