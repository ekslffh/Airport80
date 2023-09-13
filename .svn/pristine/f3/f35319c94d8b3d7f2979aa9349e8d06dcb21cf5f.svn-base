<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

						<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">청소 일정/현황</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">일정현황</a></li>
								<li class="breadcrumb-item active">청소 일정/현황</li>
							</ol>
						</nav>
					</div>
					<!-- 게시판 헤더 영역 끝 -->
					<!-- Pills Tabs -->
						<ul class="nav nav-pills mb-3" id="sttsNav" role="tablist">
						
							<li class="nav-item" role="presentation">
									<button
										class="nav-link  ${paging.simpleCondition.tab == 0 ? 'active show' : ''}"
										id="wtStts" data-bs-toggle="pill" data-bs-target="#pills-wt"
										type="button" role="tab" aria-controls="pills-wt"
										aria-selected="true">대기중</button>
								</li>
								
							<li class="nav-item" role="presentation">
									<button
										class="nav-link ${paging.simpleCondition.tab == 1 ? 'active show' : ''}"
										id="pgStts" data-bs-toggle="pill" data-bs-target="#pills-pg"
										type="button" role="tab" aria-controls="pills-pg"
										aria-selected="false">처리중</button>
								</li>
								
							<li class="nav-item" role="presentation">
									<button
										class="nav-link ${paging.simpleCondition.tab == 2 ? 'active show' : ''}"
										id="pcStts" data-bs-toggle="pill" data-bs-target="#pills-pc"
										type="button" role="tab" aria-controls="pills-pc"
										aria-selected="false">처리완료</button>
								</li>
						</ul>
						
						<!-- 검색하는 부분 -->
							<div class="searchUI row justify-content-end"
								data-target-form="#tab1Form" data-target-tbody="#table1">
								<div class="col-auto">
									<form:select path="simpleCondition.searchType"
										class="form-select">
										<form:option value="" label="전체" />
										<form:option value="id" label="요청ID" />
										<form:option value="loc" label="위치" />
										<form:option value="stts" label="상태" />
										<form:option value="content" label="내용" />
									</form:select>
								</div>
								<div class="col-auto">
									<form:input path="simpleCondition.searchWord"
										class="form-control" />
								</div>
								<div class="col-auto">
									<input type="button" value="검색"
										class="searchBtn btn btn-outline-dark gray_btn" /> <a
										class="btn btn-primary"
										href="<c:url value='/infra/recRegistraction.do'/>">일정등록</a>
								</div>
							</div>
							
				<div class="tab-content pt-2" id="pills-tab-content">

					<!-- 대기중 목록탭 -->
					<div class="tab-pane fade   ${paging.simpleCondition.tab == 0 ? 'active show' : ''}" id="pills-wt"
						role="tabpanel" aria-labelledby="home-tab">
						<table class="table Default Table">
							<thead class="table-light">
								<tr>
									<th>일정ID</th>
									<th>위치</th>
									<th >제목</th>
									<th >등록일시</th>
									<th>담당자</th>
									<th colspan="2"></th>
								</tr>
							</thead>
								<tbody id="table1">
									<c:set var="schList" value="${paging.dataList }" />
									<c:if test="${empty schList }">
										<tr>
											<td colspan="10">등록된 일정 없음.</td>
										</tr>
									</c:if>
									<c:if test="${not empty schList}">
										<c:forEach items="${schList }" var="wt">
											<%-- 										<input type="hidden" value="${rncReq.rrType}"/> --%>
											<tr class="clickable-row" data-rsid="${wt.rsId}">
												<td >${wt.rsId }</td>
												<td>${wt.zone.zoneFloor }층
													${wt.zone.zoneCtgr }</td>
												<td class="content">${wt.rsContent }</td>

												<td class="clickable-row" data-rs-id="${wt.rsId}"
													data-rs-end-date="${wt.rsEndTs}"
													>
													${wt.rsCrtTs.toString().split(':')[0].replace('T', ' ')}:${wt.rsCrtTs.toString().split(':')[1]}
												</td>

												<td>${wt.employee.empNm }</td>
												<td>
													<button class="btn btn-primary">처리완료</button>
												</td>
											</tr>
										</c:forEach>
									</c:if>

								</tbody>
							</table>
								<div class="d-flex justify-content-center mb-5 pagingArea"
									data-target-form="#tab1Form">
									${paging.pagingHTML }
									<!-- a태그 동작 -->
								</div>
							</div>
					<!-- 대기중 목록 탭 끝 -->

					<!-- 처리중 목록탭 -->
					<div class="tab-pane fade   ${paging.simpleCondition.tab == 1 ? 'active show' : ''}" id="pills-pg"
						role="tabpanel" aria-labelledby="home-tab">
						<table class="table Default Table">
							<thead class="table-light">
								<tr>
									<th >일정ID</th>
									<th >위치</th>
									<th >제목</th>
									<th >등록일시</th>
									<th >담당자</th>
									<th></th>
								</tr>
							</thead>
								<tbody id="table2">
									<c:set var="pgList" value="${paging.dataList }" />
									<c:if test="${empty pgList }">
										<tr>
											<td colspan="10">등록된 일정 없음.</td>
										</tr>
									</c:if>
									<c:if test="${not empty pgList}">
										<c:forEach items="${pgList }" var="pg">
											<%-- 										<input type="hidden" value="${rncReq.rrType}"/> --%>
											<tr class="clickable-row" data-rsid="${pg.rsId}">
												<td >${pg.rsId }</td>
												<td >${pg.zone.zoneFloor }층
													${pg.zone.zoneCtgr }</td>
												<td class="content">${pg.rsContent }</td>

												<td class="clickable-row" data-rs-id="${pg.rsId}"
													data-rs-end-date="${pg.rsEndTs}"
													>
													${pg.rsCrtTs.toString().split(':')[0].replace('T', ' ')}:${pg.rsCrtTs.toString().split(':')[1]}
												</td>
												<td >${pg.employee.empNm }</td>
												<td >
													<button class="btn btn-primary">처리완료</button>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
								<div class="d-flex justify-content-center mb-5 pagingArea"
									data-target-form="#tab1Form">
									${paging.pagingHTML }
									<!-- a태그 동작 -->
								</div>
							</div>
					<!-- 처리중 목록 탭 끝 -->
					<!-- 처리완료 목록탭 -->
					<div class="tab-pane fade  ${paging.simpleCondition.tab == 2 ? 'active show' : ''}" id="pills-pc"
						role="tabpanel" aria-labelledby="home-tab">
						<table class="table Default Table">
							<thead class="table-light">
								<tr>
									<th >일정ID</th>
									<th >위치</th>
									<th >제목</th>
									<th >등록일시</th>
									<th >담당자</th>
									<th></th>
								</tr>
							</thead>
								<tbody id="table3">
									<c:set var="pcList" value="${paging.dataList }" />
									<c:if test="${empty pcList }">
										<tr>
											<td colspan="10">등록된 일정 없음.</td>
										</tr>
									</c:if>
									<c:if test="${not empty pcList}">
										<c:forEach items="${pcList }" var="pc">
											<%-- 										<input type="hidden" value="${rncReq.rrType}"/> --%>
											<tr class="clickable-row" data-rsid="${pc.rsId}">
												<td >${pc.rsId }</td>
												<td >${pc.zone.zoneFloor }층
													${pc.zone.zoneCtgr }</td>
												<td class="content">${pc.rsContent }</td>

												<td class="clickable-row" data-rs-id="${pc.rsId}"
													data-rs-end-date="${pc.rsEndTs}"
													>
													${pc.rsCrtTs.toString().split(':')[0].replace('T', ' ')}:${pc.rsCrtTs.toString().split(':')[1]}
												</td>

												<td >${pc.employee.empNm }</td>
												<td >
													<button class="btn btn-outline-dark deletebtn">상세보기</button>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
								<div class="d-flex justify-content-center mb-5 pagingArea"
									data-target-form="#tab1Form">
									${paging.pagingHTML }
									<!-- a태그 동작 -->
								</div>
							</div>
							<!-- 처리완료 목록 끝 -->
								<form:form class="searchForm" modelAttribute="simpleCondition"
									id="tab1Form" method="get">
									<!--  데이터 전송 용도  -->
									<form:hidden path="tab" />
									<form:hidden path="searchType" />
									<form:hidden path="searchWord" />
									<input type="hidden" name="page" />
								</form:form>
						</div>
					</div>
<!-- 청소일정 상세내역 모달 -->
<div class="modal fade" id="largeModal" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">청소일정 상세</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 유지보수일정 상세내역 모달 -->
				</div>
			</div>
		</div>
</section>




<script>
//탭을 클릭했을 때 실행할 함수
function handleTabClick(tabId) {
	// 각 탭에 대한 작업을 수행합니다.
	switch (tabId) {
	case "wtStts":
		// 미등록 탭을 클릭했을 때 수행할 작업
		// 예: 미등록 데이터를 로드하거나 다른 동작 수행
		console.log("대기중 탭을 클릭했습니다.");
		$(tab1Form).find("[name=tab]").val(0);
		break;
	case "pgStts":
		// 반려 탭을 클릭했을 때 수행할 작업
		// 예: 반려 데이터를 로드하거나 다른 동작 수행
		console.log("처리중탭을 클릭했습니다.");
		$(tab1Form).find("[name=tab]").val(1);
		break;
	case "pcStts":
		// 전체조회 탭을 클릭했을 때 수행할 작업
		// 예: 전체 데이터를 로드하거나 다른 동작 수행
		console.log("처리완료 탭을 클릭했습니다.");
		$(tab1Form).find("[name=tab]").val(2);
		break;
	default:
		// 다른 탭을 클릭한 경우 기본 작업을 수행하거나 아무 작업도 하지 않습니다.
		console.log("알 수 없는 탭을 클릭했습니다.");
		break;
	}

	// form제출
	$(tab1Form).submit();
}
//각 탭 버튼에 클릭 이벤트 핸들러를 추가합니다.
document.getElementById("wtStts").addEventListener("click", function() {
	handleTabClick("wtStts");
});

document.getElementById("pgStts").addEventListener("click", function() {
	handleTabClick("pgStts");
});

document.getElementById("pcStts").addEventListener("click", function() {
	handleTabClick("pcStts");
});
function fn_paging(page) {
	return false;
}
//페이징, 검색
$(".pagingArea").on("click", "a.page-link", function(event) {
	let page = $(this).data("page");
	let pagingArea = $(this).parents(".pagingArea");
	let searchFormId = $(pagingArea).data("targetForm");
	$(searchFormId).find("[name=page]").val(page);
	$(searchFormId).submit();

});

// searchUI에서 입력을 받은 데이터를 searchForm으로 옮겨야함
$(".searchUI").on("click", ".searchBtn", function(event) {
	let searchUI = $(this).parents(".searchUI");
	let searchFormId = $(searchUI).data("targetForm");

	$(searchUI).find(":input[name]").each(function(idx, input) { //셀렉트/ input
		let name = input.name; //하나의 input태그의 name속성
		let value = $(input).val();
		$(searchFormId).find(`[name=\${name}]`).val(value);
	});
	$(searchFormId).submit();
});
// 	var selectedTab = "pills-wt"; // 초기 탭 설정

// 	//탭을 클릭할 때 선택된 탭 정보를 저장
// 	$(".nav-link").on("click", function() {
// 		selectedTab = $(this).attr("data-bs-target").substring(1); // "pills-wt"에서 "pills-"를 제거
// 	});
// 	//searchUI에서 입력을 받은 데이터를 searchForm으로 옮겨야함	
// 	function fn_paging(page) {
// 		searchForm.page.value = page;
// 		// 선택된 탭 정보를 함께 서버로 전송
// 		searchForm.selectedTab.value = selectedTab;
// 		$(searchForm).submit();
// 	}

// 	// searchUI에서 입력을 받은 데이터를 searchForm으로 옮겨야함
// 	$(searchBtn).on("click", function(event) {
// 		//     $ find : children을 찾겠다. name속성을 가지고 있는 input태그 중에서 모든 input태그
// 		$(searchUI).find(":input[name]").each(function(idx, input) { //셀렉트/ input
// 			let name = input.name; //하나의 input태그의 name속성
// 			let value = $(input).val();
// 			$(searchForm).find(`[name=\${name}]`).val(value);
// 		});
// 		$(searchForm).submit();
// 	});

	// $(document).ready(function() {
	//     // 각 탭 버튼 클릭 이벤트 핸들러
	//     $('.nav-link').click(function() {
	//         var tabId = $(this).data('bs-target'); // 클릭한 탭의 대상 (예: "#pills-wt")
	//         var paginationId = '#pagination-' + tabId.replace('#', ''); // 해당 탭의 페이징 UI ID

	//         // AJAX 요청을 통해 해당 탭의 데이터를 서버에서 로드
	//         $.ajax({
	//             url: '/infra/rncScheduleList.do', // 데이터를 로드할 서버 엔드포인트
	//             method: 'GET',
	//             data: { tabId: tabId }, // 탭 ID 정보 전달
	//             success: function(response) {
	//                 // 성공적으로 데이터를 받았을 때 처리
	//                 // 받은 데이터를 표에 채우고 페이징 처리를 할 수 있습니다.
	//                 // 페이지 내에서 페이징 처리를 구현하세요.

	//                 // 예시: 받은 데이터를 사용하여 테이블 데이터 업데이트
	//                 var tableId = tabId + ' table.Default.Table';
	//                 var paginationContainer = $(paginationId);

	//                 // 테이블 데이터 업데이트 및 페이징 UI 설정
	//                 $(tableId + ' tbody').html(response.tableData); // 받은 데이터로 테이블 업데이트
	//                 paginationContainer.html(response.paginationHTML); // 받은 페이징 UI로 업데이트

	//                 // 페이징 버튼 클릭 이벤트 핸들러 추가
	//                 paginationContainer.find('a').click(function() {
	//                     var page = $(this).data('page'); // 클릭한 페이지 번호
	//                     // AJAX 요청을 통해 해당 페이지의 데이터를 서버에서 로드
	//                     $.ajax({
	//                         url: '/your-data-endpoint-url',
	//                         method: 'GET',
	//                         data: { tabId: tabId, page: page }, // 탭 ID와 페이지 정보 전달
	//                         success: function(response) {
	//                             // 페이지 데이터 업데이트
	//                             $(tableId + ' tbody').html(response.tableData);
	//                         },
	//                         error: function(xhr, status, error) {
	//                             // 에러 처리
	//                             console.error('데이터 로딩 오류: ' + error);
	//                         }
	//                     });
	//                 });
	//             },
	//             error: function(xhr, status, error) {
	//                 // 에러 처리
	//                 console.error('데이터 로딩 오류: ' + error);
	//             }
	//         });
	//     });

	//     // 초기 페이지 로딩 시 첫 번째 탭 데이터 로드
	//     $('#pills-wt-tab').click(); // 대기중 탭 클릭
	// });

	$(document).ready(function() {
		if ("${simpleCondition.searchType }" == "stts") {
			$("#dept1").val("${simpleCondition.searchWord }");
		}

		$(".content").each(function() {
			var content = $(this).text();
			if (content.length > 15) {
				var truncatedContent = content.substring(0, 15) + "...";
				$(this).text(truncatedContent);
			}
		});
	});

	//유지보수일정 상세정보 모달로 열기
	$(document)
			.ready(
					function() {
						$(".clickable-row")
								.click(
										function() {
											let rsId = $(this).data('rsid');
											console.log('rsId:', rsId);
											// 모달 본문에 데이터를 채우는 코드 추가
											let $modalBody = $('#largeModal .modal-body');
											$modalBody
													.html('<p>Loading...</p>'); // 로딩 메시지

											// AJAX를 사용하여 클릭된 행의 세부 정보 가져오기
											$
													.ajax({
														url : "${pageContext.request.contextPath }/infra/recScheduleView.do", // 실제 URL로 변경
														method : "GET",
														data : {
															rsId : rsId,
														},
														success : function(
																response) {
															$modalBody
																	.html(response); // 세부 정보로 모달 본문 업데이트
														},
														error : function() {
															$modalBody
																	.html('<p>Error loading details.</p>'); // 오류 메시지
														}
													});

											// 모달 열기
											$('#largeModal').modal('show');
										});

						// 오늘 날짜를 가져오는 함수
						function getTodayDate() {
							var today = new Date();
							var year = today.getFullYear();
							var month = String(today.getMonth() + 1).padStart(
									2, '0'); // 월은 0부터 시작하므로 +1 필요
							var day = String(today.getDate()).padStart(2, '0');
							return year + '-' + month + '-' + day;
						}

						// 						// td 요소 검사 및 처리
						// 						var tdElements = document
						// 								.querySelectorAll('.clickable-row');

						// 						for (var i = 0; i < tdElements.length; i++) {
						// 							var td = tdElements[i];
						// 							var rsEndTs = td.getAttribute('data-rs-end-date');
						// 							var currentDate = getTodayDate();

						// 							if (rsEndTs < currentDate) {
						// 								// 해당 td를 가지고 있는 tr 요소에 'table-danger' 클래스 추가
						// 								var tr = td.parentElement;
						// 								tr.classList.add('table-danger');
						// 							}
						// 						}
					});
</script>