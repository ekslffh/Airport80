<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
/* 기본 폼 스타일 */
.update-form {
	margin-top: 20px;
    padding: 20px;
    border: 1px solid #ccc;
    background-color: #f9f9f9;
    border-radius: 5px;
    height: 120px; 
}

/* 입력 필드 스타일 */
.input-field {
	margin-top: 10px;
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 16px;
}

/* 제출 버튼 스타일 */
.submit-button {
    background-color: #3498db; /* 파란색과 하늘색 중간 */
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px; /* 둥근 모서리 */
    cursor: pointer;
    font-size: 16px;
    float: right; /* 추가된 스타일: 우측 정렬을 위한 플로트 */
}



.submit-button:hover {
    background-color: #0056b3;
}
</style>


<%-- 개별 업데이트를 위한 양식 --%>
<c:if test="${not empty salaryVO}">
    <form:form action="${pageContext.request.contextPath}/accounting/salary/salaryStatusUpdate.do" method="post" modelAttribute="salaryVO">
        <input type="hidden" name="salId" value="${salaryVO.salId}">
         

        <label for="salMemo">메모 및 사유:</label>
        <input type="text" name="salMemo" id="salMemo" class="input-field" placeholder="메모 및 사유를 입력하세요" />
        <button type="submit" class="submit-button" onclick="return confirmAndClosePopup()">승인</button>
        <br>
    </form:form>
</c:if>


<%-- 전체 업데이트를 위한 양식 --%>
<c:if test="${empty salaryVO}">
    <form:form action="${pageContext.request.contextPath}/accounting/salary/salaryStatusUpdateAll.do" method="post" modelAttribute="salaryList" class="update-form">
        <label for="salMemo">메모 및 사유:</label>
        <input type="text" name="salMemo" id="salMemo" class="input-field" placeholder="메모 및 사유를 입력하세요" />
        <button type="submit" class="submit-button" onclick="return confirmAndClosePopup()">승인</button>
        <br>
    </form:form>
</c:if>
<!-- SweetAlert2 라이브러리를 추가합니다. -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
    // 팝업 창 닫기 및 부모 페이지 새로 고침 함수
    function closePopupAndRefreshParent() {
  	 	 setTimeout(function() {
     	 	  alert("일괄 승인이 완료되었습니다");
     	 	  window.opener.location.reload(); // 부모 페이지 새로고침
     	 	  window.close();
    		}, 100);
		}

    // SweetAlert2를 사용한 승인 확인 함수
    function confirmAndClosePopup() {
        Swal.fire({
            icon: 'question',
            title: '확인',
            text: '정말 일괄 승인합니까?',
            showCancelButton: true,
            confirmButtonText: '예',
            cancelButtonText: '아니요',
        }).then((result) => {
            if (result.isConfirmed) { // 사용자가 "예"를 선택한 경우
                Swal.fire({
                    icon: 'success',
                    title: '처리 중...',
                    text: '해당 월 급여를 일괄 승인합니다..',
                    showConfirmButton: false, // 확인 버튼 숨기기
                });
                setTimeout(function() {
                	document.querySelector('form').submit(); // 폼 제출
                    closePopupAndRefreshParent(); 
                }, 1500); // 1.5초 지연
               
            }
        });
        return false; // 기본 폼 제출 방지
    }
</script>
