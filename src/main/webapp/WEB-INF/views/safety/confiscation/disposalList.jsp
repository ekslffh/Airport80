<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}" >
					<h5 class="card-tit">압수품폐기 관리</h5>
				    <nav>
				      <ol class="breadcrumb">
				        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
				        <li class="breadcrumb-item"><a href="#">보안검색</a></li>
				        <li class="breadcrumb-item active">압수품폐기 관리</li>
				      </ol>
				    </nav>
					</div>
					<!-- 게시판 헤더 영역 끝 -->
					
				    <!-- 갯수표시 -->
					<p class="d-flex align-items-end" style="margin-bottom: 5px;">
						총 <span class="totalcolor"> ${totalCount }</span>개
					</p>
					<!-- 갯수표시 끝 -->
					
<table class="table table-hover">
<thead class="table-primary">
	<th class="text-center">번호</th>
	<th class="text-center">압수품ID</th>
	<th class="text-center" style="width: 339px;">품목</th>
	<th class="text-center">물품명</th>
	<th class="text-center">수량</th>
	<th class="text-center">폐기일시</th>
	<th class="text-center">작성자</th>
	<th class="text-center">압수품 상태</th>
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
			
				<tr> 
				<c:url value="/safety/disposal/view.do" var="viewURL">
					<c:param name="what" value="${confis.csId}" />
				</c:url>
					<td class="text-center" onClick="location.href='${viewURL }'" style="cursor: pointer;">${confis.rnum }</td>
					<td class="text-center" onClick="location.href='${viewURL }'" style="cursor: pointer;">${confis.csId }</td>
					<td class="text-center" onClick="location.href='${viewURL }'" style="cursor: pointer;">${confis.csCtgr}</td>
					<td class="text-center" onClick="location.href='${viewURL }'" style="cursor: pointer;">${confis.csNm }</td>
					<td class="text-center" onClick="location.href='${viewURL }'" style="cursor: pointer;">${confis.csQtt }</td>
					<td class="text-center" onClick="location.href='${viewURL }'" style="cursor: pointer;">${confis.csDispoTs.toString().replace('T', ' ')}</td>
					<td class="text-center" onClick="location.href='${viewURL }'" style="cursor: pointer;">${confis.employee.empNm}</td>
					<c:if test="${confis.common.codeNm eq '폐기'}">
					<c:url value="/safety/disposalView.do" var="disviewURL">
						<c:param name="what" value="${confis.csId }" />
					</c:url>
					<td class="text-center"><span class="btn btn-dark" style="font-size:14px; padding: 3px 10px;">${confis.common.codeNm}</span></td>
					</c:if>
					
					<c:if test="${confis.common.codeNm ne '폐기'}">
					<td class="text-center">
					<span class="btn btn-light graybd confis-button">${confis.common.codeNm}</span></td>
					</c:if>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</tbody>
</table>

				<div class="d-flex justify-content-center">
				${paging.pagingHTML }
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
						<form:input path="simpleCondition.searchWord" class="form-control"/>
					</div>
					<div>
						<input type="button" value="검색" id="searchBtn" class="btn btn-secondary gray_btn"/>
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
 	
 	const buttons = document.querySelectorAll('.confis-button');
 	buttons.forEach(button => {
 		button.addEventListener('click',function(){
 			selectCsId = this.getAttribute('data-csid');
 			$('#csidValue').val(selectCsId);
 		});
 	});
	
	
</script>

