<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
				
						
						<div class="card-header"
							style="padding-bottom: 5px; margin-bottom: 15px;">
							<h5 class="card-tit">청소관리 일정/현황</h5>
							<nav>
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html"><i
											class="bi bi-house-door"></i></a></li>
									<li class="breadcrumb-item"><a href="#">일정현황</a></li>
									<li class="breadcrumb-item active">청소관리 일정/현황</li>
								</ol>
							</nav>
						</div>
						
						
		<div class="col-lg-12">
			<div class="card" style="height:800px; overflow-y:scroll;">
				<div class="card-body req-body">
					<table>
					<tbody>
						<tr>
								<td colspan="5">
									<div class="d-flex justify-content-center mb-5">
										${paging.pagingHTML }
										<!-- a태그 동작 -->
									</div>
									
									<div id="searchUI" class="row justify-content-center">
										<div class="col-auto">
											<form:select path="simpleCondition.searchType"
												class="form-select">
											
											<form:option value="" label="전체" />
												<form:option value="id" label="요청ID" />
												<form:option value="zone" label="위치" />
												<form:option value="content" label="상태" />
												<form:option value="type" label="내용" />
											</form:select>

										</div>
										
										<div class="col-auto">
											<form:input path="simpleCondition.searchWord"
												class="form-control" />
										</div>
										<div class="col-auto">
											<input type="button" value="검색" id="searchBtn"
												class="btn btn-success" /> <a class="btn btn-secondary"
												href="<c:url value='/infra/recRegistraction.do'/>">일정등록</a>
										</div>
									</div>
								</td>
							</tr>
					</tbody>
					</table>
					<table class="table Default Table">
						<thead class="table-light">
							<tr>
								<th class="text-center">일정ID</th>
								<th class="text-center">위치</th>
								<th class="text-center">제목</th>
								<th class="text-center">진행일시</th>
								<th class="text-center">담당자</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="table1" >
							<c:set var="schedule" value="${schList }" />
							<c:if test="${empty schedule }">
								<tr>
									<td colspan="10">등록된 일정 없음.</td>
								</tr>
							</c:if>
							<c:if test="${not empty schedule}">
								<c:forEach items="${schedule }" var="schedule">
<%-- 										<input type="hidden" value="${rncReq.rrType}"/> --%>
									<tr  class="clickable-row" data-rsid="${schedule.rsId}">
										<td class="text-center">${schedule.rsId }</td>
										<td class="text-center">${schedule.zone.zoneFloor }층 ${schedule.zone.zoneCtgr }</td>
										<td class="content">${schedule.rsContent }</td>
										<td class="text-center">${schedule.rsCrtTs.toString().split(':')[0].replace('T', ' ')}:${schedule.rsCrtTs.toString().split(':')[1]}</td>
										<td class="text-center">${schedule.employee.empNm }</td>
										<td class="text-center">
											<button class="btn btn-success">처리완료</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<form:form id="searchForm" modelAttribute="simpleCondition"
						method="get">
						<!--  데이터 전송 용도  -->
						<form:hidden path="searchType" />
						<form:hidden path="searchWord" />
						<input type="hidden" name="mode" value="${param.mode }" />
						<input type="hidden" name="page" />
					</form:form>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</section>

<!-- 유지보수일정 상세내역 모달 -->
<div class="modal fade" id="largeModal" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">청소 일정 상세</h5>
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


<script>
//searchUI에서 입력을 받은 데이터를 searchForm으로 옮겨야함
	function fn_paging(page) {
		searchForm.page.value = page;
		$(searchForm).submit();
		//     searchForm.requestSubmit();
	}

	// searchUI에서 입력을 받은 데이터를 searchForm으로 옮겨야함
	$(searchBtn).on("click", function(event) {
		//     $ find : children을 찾겠다. name속성을 가지고 있는 input태그 중에서 모든 input태그
		$(searchUI).find(":input[name]").each(function(idx, input) { //셀렉트/ input
			let name = input.name; //하나의 input태그의 name속성
			let value = $(input).val();
			$(searchForm).find(`[name=\${name}]`).val(value);
		});
		$(searchForm).submit();
	});

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
	$(document).ready(function() {
    $(".clickable-row").click(function() {
    	let rsId = $(this).data('rsid');
		console.log('rsId:',rsId);
        // 모달 본문에 데이터를 채우는 코드 추가
        let $modalBody = $('#largeModal .modal-body');
        $modalBody.html('<p>Loading...</p>'); // 로딩 메시지

        // AJAX를 사용하여 클릭된 행의 세부 정보 가져오기
        $.ajax({
            url:"${pageContext.request.contextPath }/infra/scheduleView.do", // 실제 URL로 변경
            method: "GET",
            data: { rsId: rsId },
            success: function(response) {
                $modalBody.html(response); // 세부 정보로 모달 본문 업데이트
            },
            error: function() {
                $modalBody.html('<p>Error loading details.</p>'); // 오류 메시지
            }
        });

        // 모달 열기
        $('#largeModal').modal('show');
    });

    // ... 기타 document.ready 코드 ...
});
</script>