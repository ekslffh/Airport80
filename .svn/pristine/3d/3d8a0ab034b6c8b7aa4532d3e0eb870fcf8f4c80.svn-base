<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
  <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">보낸메일함</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/in"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">메일</a></li>
					        <li class="breadcrumb-item active">보낸메일함</li>
					      </ol>
					    </nav>
				    </div>
						   <div class="info" style="width: 100%; padding-bottom: 1px;">
						 <p class="cofistooltip">
							  <i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							       <span data-bs-toggle="tooltip" data-bs-placement="top">
							          항목을 누르면 상세보기가 표시됩니다.<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;우측 하단 삭제 버튼으로 삭제할 수 있습니다.
							       </span>
							   </p>
					  </div>
				    <!-- 게시판 헤더 영역 끝 -->
                            <form id="deleteForm" action="${pageContext.request.contextPath}/account/mail/outdelete.do" method="post">
                                <table class="table datatable table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col">순번</th>
                                           	<th><input type="checkbox" id="selectAllCheckbox" /></th>
                                            <th scope="col">받는 사람</th>
                                            <th scope="col">제목</th>
                                            <th scope="col">날짜</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									    <c:forEach items="${messagesList}" var="messageInfo" varStatus="status">
									        <c:set var="message" value="${messageInfo.message}" />
									        <c:set var="recipients" value="${messageInfo.recipients}" />
									        <tr>
									            <td>${status.index}</td>
									            <td><input type="checkbox" class="messageCheckbox" name="messageIndexes" value="${status.index}" /></td>
									            <td>
									                <a class="d-block bk" href='<c:url value="/account/mail/outdetail.do"/>?messageIndex=${status.index}'>
													<%--보낸 사람: ${message.sender}<br/> --%>									               
									                    <c:forEach items="${recipients}" var="recipient" varStatus="recipientStatus">
									                        <c:out value=" ${recipient}" />
									                        <c:if test="${!recipientStatus.last}">, </c:if>
									                    </c:forEach>
									                </a>
									            </td>
									            <td>
												    <a class="d-block bk" href='<c:url value="/account/mail/outdetail.do"/>?messageIndex=${status.index}'>
												        ${empty message.subject ? '(제목 없음)' : message.subject}
												    </a>
												</td>
									            <td>
									            	 <a class="d-block bk" href='<c:url value="/account/mail/outdetail.do"/>?messageIndex=${status.index}'>
									          			 <fmt:formatDate value="${message.sentDate}" pattern="yyyy-MM-dd" />
									          			 
									           		 </a>
									            </td>
									        </tr>
									    </c:forEach>
									</tbody>
                                </table>
                                <button type="button" id="deleteButton" class="btn btn-dark" style="float: right;">선택된 메일 삭제</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

<script>
	document.addEventListener('DOMContentLoaded',
			function() {
				// 전체선택 체크박스와 메일 체크박스를 관리하는 JavaScript 코드
				const selectAllCheckbox = document
						.getElementById('selectAllCheckbox'); // 전체선택
				var messageCheckboxes = document
						.querySelectorAll('.messageCheckbox'); // 하나선택
				const deleteButton = document.getElementById('deleteButton'); //삭제버튼
				const datatableSelector = document
						.querySelector('.datatable-selector'); // 테이블 페이지 단위 선택
				const paginationItems = document
						.querySelectorAll('.datatable-pagination-list-item'); // 페이징

				// 콘솔에 선택된 값 출력
				datatableSelector.addEventListener('change', function() {
					var selectedValue = datatableSelector.value;
					resetCheckboxes();
					console.log('Selected value:', selectedValue);
					setTimeout(function() {
						messageCheckboxes = document
								.querySelectorAll('.messageCheckbox');
						console.log('messageCheckboxes'
								+ messageCheckboxes.length);
					}, 0);
				});

				// "선택" 헤더 셀을 클릭하면 모든 체크박스가 선택 또는 해제되도록 처리
				selectAllCheckbox.addEventListener('click', function() {
					event.stopPropagation(); // 이벤트 전파 막기

					messageCheckboxes.forEach(function(checkbox) {
						checkbox.checked = selectAllCheckbox.checked;
					});
				});

				// 개별 메일 체크박스를 클릭하면 선택 상태를 토글합니다.
				messageCheckboxes.forEach(function(checkbox) {
					checkbox.addEventListener('click', function() {
						selectAllCheckbox.checked = false; // 개별 체크박스 선택 시 전체 선택 해제
					});
				});

				//삭제버튼
				deleteButton.addEventListener('click', function() {
					const checkedMessageIndexes = [];
					messageCheckboxes.forEach(function(checkbox, index) {
						if (checkbox.checked) {
							checkedMessageIndexes.push(index);
						}
					});

					if (checkedMessageIndexes.length > 0) {
						const input = document.createElement('input');
						input.type = 'hidden';
						input.name = 'messageIndexes';
						input.value = checkedMessageIndexes.join(',');

						const form = document.getElementById('deleteForm');
						form.appendChild(input);
						form.submit();
					}
				});

				//체크박스 초기화
				function resetCheckboxes() {
					messageCheckboxes.forEach(function(checkbox) {
						checkbox.checked = false;
					});
					selectAllCheckbox.checked = false;
				}

				paginationItems.forEach(function(item) { //페이지이동시
					item.addEventListener('click', function() {
						const page = this.querySelector(
								'.datatable-pagination-list-item-link')
								.getAttribute('data-page');
						resetCheckboxes();
						setTimeout(function() {
							messageCheckboxes = document
									.querySelectorAll('.messageCheckbox');
							console.log('messageCheckboxes'
									+ messageCheckboxes.length);
						}, 0);
					});
				});

			});
</script>
<script>
// 페이지가 로드될 때 실행되는 함수
window.addEventListener("load", function() {
    // 첫 번째 정렬 버튼에 대한 클릭 이벤트를 시뮬레이트
    simulateClickOnFirstSortButton();
    simulateClickOnFirstSortButton();
    // 두번해서 내림차순으로
});

// 첫 번째 정렬 버튼에 대한 클릭 이벤트를 시뮬레이트하는 함수
function simulateClickOnFirstSortButton() {
    var sortButtons = document.querySelectorAll(".datatable-sorter"); // 정렬 버튼의 클래스나 선택자를 확인하셔야 합니다.
    if (sortButtons.length > 0) {
        sortButtons[0].click(); // 첫 번째 정렬 버튼에 클릭 이벤트 시뮬레이트
    }
}

</script>



