<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.stsbtn {
	padding: 3px 11px;
	font-size: 14px;
}

.btnsty {
	background: #a0b2d2;
	border: 0
}

.reason {
	margin-left: auto;
	font-size: 14px;
	margin-bottom: 0;
}

.mg {
	margin-top: -7px;
	margin-bottom: -10px;
}
</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">압수품 관리</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">보안검색</a></li>
								<li class="breadcrumb-item active">압수품 관리</li>
							</ol>
						</nav>
					</div>
					<!-- 게시판 헤더 영역 끝 -->


						<div class="info" style="width: 100%;">
							<p class="cofistooltip">
								<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
								<span>압수품 폐기 절차 안내 </span>
							</p>
							<p class="reason">3개월뒤 자동 '폐기' 상태가 됩니다. 이후 폐기 인증을 위해 인증 사진을 첨부 후 '완료'처리 바랍니다.  폐기'상태 압수품을 자동으로 우선 정렬하여 표시합니다.</p>
						</div>

					<!-- 갯수표시 -->
					<p class="d-flex align-items-end" style="margin-bottom: 5px;">
						총 <span class="totalcolor"> ${totalCount }</span>개
					</p>
					<!-- 갯수표시 끝 -->

					<table class="table Default Table">
						<thead class="table-primary">
							<tr>
								<th class="text-center">번호</th>
								<th class="text-center">압수품ID</th>
								<th class="text-center" style="width: 339px;">품목</th>
								<th class="text-center">물품명</th>
								<th class="text-center">수량</th>
								<th class="text-center">압수일시</th>
								<th class="text-center">작성자</th>
								<th class="text-center">압수품 상태</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="confisList" value="${paging.dataList }" />
							<c:choose>
								<c:when test="${empty confisList }">
									<tr>
										<td colspan="8">조건에 맞는 게시글 없음.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${confisList }" var="confis">
										<c:url value="/safety/confisView.do" var="viewURL">
											<c:param name="what" value="${confis.csId }" />
										</c:url>
										<tr <c:if test="${confis.common.codeNm eq '폐기'}">class="table-light"</c:if>>
											<td onClick="location.href='${viewURL }'" class="text-center" style="cursor: pointer;">${confis.rnum }</td>
											<td onClick="location.href='${viewURL }'" class="text-center" style="cursor: pointer;">${confis.csId }</td>
											<td onClick="location.href='${viewURL }'" class="text-center" style="cursor: pointer;">${confis.csCtgr}</td>
											<td onClick="location.href='${viewURL }'" class="text-center" style="cursor: pointer;">${confis.csNm }</td>
											<td onClick="location.href='${viewURL }'" class="text-center" style="cursor: pointer;">${confis.csQtt }</td>
											<td onClick="location.href='${viewURL }'" class="text-center" style="cursor: pointer;">${confis.csTs.toString().replace('T', ' ')}</td>
											<td onClick="location.href='${viewURL }'" class="text-center" style="cursor: pointer;">${confis.employee.empNm}</td>

											<!-- 폐기상태 시작 -->
											<c:if test="${confis.common.codeNm eq '폐기'}">
												<c:url value="/safety/confisdisposal.do" var="disviewURL">
													<c:param name="what" value="${confis.csId }" />
												</c:url>
												<td class="text-center"><a href="${disviewURL}" class="btn btn-dark stsbtn">${confis.common.codeNm}</a></td>
											</c:if>
											<!-- 폐기상태 끝-->


											<!-- 상태변경 버튼 시작 -->
											<c:if test="${confis.common.codeNm eq '등록'}">
												<td class="text-center"><a href="#" class="confis-button" style="color: black;" data-bs-toggle="modal" data-bs-target="#verticalycentered" data-csid="${confis.csId}">${confis.common.codeNm}</a></td>

											</c:if>

											<c:if test="${confis.common.codeNm eq '경찰서이관'}">
												<td class="text-center"><a href="#" class="confis-button" style="color: #0000ab;" data-bs-toggle="modal" data-bs-target="#verticalycentered" data-csid="${confis.csId}">${confis.common.codeNm}</a></td>
											</c:if>

											<c:if test="${confis.common.codeNm eq '국가환수'}">
												<td class="text-center"><a href="#" class="confis-button" style="color: #03b362;" data-bs-toggle="modal" data-bs-target="#verticalycentered" data-csid="${confis.csId}">${confis.common.codeNm}</a></td>
											</c:if>
											
											<c:if test="${confis.common.codeNm eq '반환'}">
												<td class="text-center"><a href="#" class="confis-button" style="color: #d00000;" data-bs-toggle="modal" data-bs-target="#verticalycentered" data-csid="${confis.csId}">${confis.common.codeNm}</a></td>
											</c:if>

											<c:if test="${confis.common.codeNm ne '폐기' and confis.common.codeNm ne '등록' and confis.common.codeNm ne '경찰서이관' and confis.common.codeNm ne '국가환수' and confis.common.codeNm ne '반환'}">
												<td class="text-center"><a href="#" class="confis-button" style="color: black;" modal" data-bs-target="#verticalycentered" data-csid="${confis.csId}">${confis.common.codeNm}</a></td>
											</c:if>
											<!-- 상태변경 버튼 끝 -->

										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					
					<div class="d-flex justify-content-center mb-3">
					<span style="margin: 0 auto; padding-left: 53px;">${paging.pagingHTML }</span> 
					<a href="<c:url value='/safety/confisInsert.do'/>" class="btn btn-primary" style="height: 39px;">등록</a>
					</div>
					
					<div id="searchUI" class="d-flex justify-content-center">
						<div style="margin-right:5px;">
							<form:select path="simpleCondition.searchType" class="form-select">
								<form:option value="" label="전체" />
								<form:option value="writer" label="물품명" />
								<form:option value="title" label="품목" />
								<form:option value="content" label="처분방법" />
							</form:select>
						</div>

						<div style="margin-right:5px;">
							<form:input path="simpleCondition.searchWord" class="form-control" />
						</div>
						<div>
							<input type="button" value="검색" id="searchBtn" class="btn btn-secondary gray_btn" /> 
						</div>
					</div>

					<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
						<form:hidden path="searchType" />
						<form:hidden path="searchWord" />
						<input type="hidden" name="page" />
					</form:form>
				</div>
			</div>
		</div>
	</div>
</section>


<!-- 압수품 상태변경 모달창 시작  -->
<div class="modal fade" id="verticalycentered" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">압수품 상태변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<form:form method="post" action="${pageContext.request.contextPath }/safety/confisMthdUpdate.do" modelAttribute="confis">

					<form:hidden path="csId" value="" id="csidValue" />

					<span>상태</span>
					<form:select class="form-select" type="text" path="csDispoMthd" style="display:inline; width:70%; margin-left: 40px;">
						<form:option value="" label="상태변경" />
						<form:option value="NTZ" label="국가환수" />
						<form:option value="IPL" label="경찰서이관" />
						<form:option value="DIS" label="폐기" />
						<form:option value="REG" label="등록" />
						<form:option value="RET" label="반환" />
					</form:select>
					<form:errors path="csDispoMthd" class="error" />
					<br>
					<span>사유</span>
					<form:textarea path="csDispoRsn" placeholder="사유를 입력해주세요." class="form-control" style="display:inline; width:70%; margin-top: 11px; margin-left: 40px;" />
					<form:errors class="error" path="csDispoRsn" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button type="submit" class="btn btn-primary">변경</button>
			</div>

			</form:form>

		</div>
	</div>
</div>
<!-- 압수품 상태변경 모달창 끝  -->


<script>
	function fn_paging(page){
		searchForm.page.value = page;
		searchForm.requestSubmit();
	}
	
	$(searchBtn).on("click", function(event){
		$(searchUI).find(":input[name]").each(function(idx, input){
			let name = input.name;
			let value = $(input).val();
			$(searchForm).find(`[name=\${name}]`).val(value);
		});
		$(searchForm).submit();
	});
	
	
	
 	let selectCsId; // 클릭한 버튼 csId값을 저장할 변수 
 	
	// 상태변경 할때 hidden form에 csId value에 넣어주기 
 	const buttons = document.querySelectorAll('.confis-button');
 	buttons.forEach(button => {
 		button.addEventListener('click',function(){
 			selectCsId = this.getAttribute('data-csid');
 			$('#csidValue').val(selectCsId);
 		});
 	});
	
 	
 	

 	
	
</script>

