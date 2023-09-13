<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">반입불가 물품관리</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">보안검색</a></li>
								<li class="breadcrumb-item active">반입불가 물품관리</li>
							</ol>
						</nav>
					</div>
					<!-- 게시판 헤더 영역 끝 -->
					
	<div class="info" style="width: 100%;">
		<p class="cofistooltip">
			<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
			<span>반입금지물품에 대한 간략한 설명</span>
		</p>
		<p class="reason" style="margin-bottom: 0;">객실내 반입금지 물품은 휴대할수 없고, 위탁할수 있습니다. 항공기의 안전을 위협하거나 심각한 상해를 입히는데 사용될수 있는 물질 및 장치는 휴대및 위탁 반입 금지 입니다. </p>
	</div>

	<!-- 갯수표시 -->
	<p class="d-flex align-items-end" style="margin-bottom: 5px;">
		총 <span class="totalcolor">174</span>개
	</p>
	
<table class="table table-bordered">
<thead class="table-primary">
	<th class="text-center">ID</th>
	<th class="text-center">구분</th>
	<th class="text-center">내용</th>
	<th class="wdth text-center">기내반입</th>
	<th class="wdth text-center">수화물반입</th>
</thead>
<tbody>
	<c:set var="confisList" value="${paging.dataList }" />
	<c:choose>
		<c:when test="${empty confisList }">
			<tr>
				<td colspan="5">조건에 맞는 게시글 없음.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${confisList }" var="confis">
				<c:url value="/safety/confisInfoView.do" var="viewURL">
					<c:param name="what" value="${confis.ciNo }" />
				</c:url>
				
				<tr onClick="location.href='${viewURL }'" class="text-center" style="cursor:pointer;">
					<td class="text-center">${confis.ciNo }</td>
					<td>${confis.ciGubun }</td>
					<td class="content">${confis.ciCarryBan }</td>
					<c:if test="${confis.ciCabin eq 'Y'}">
						<td class="text-center"><i class="bi bi-circle"></i></td>
					</c:if>
					
					<c:if test="${confis.ciCabin eq 'N'}">
						<td class="text-center"><i class="bi bi-x-lg"></i> </td>
					</c:if>
					
					<c:if test="${confis.ciTrust eq 'Y'}">
						<td class="text-center"><i class="bi bi-circle"></i></td>
					</c:if>
					<c:if test="${confis.ciTrust eq 'N'}">
						<td class="text-center"><i class="bi bi-x-lg"></i> </td>
					</c:if>				
					
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</tbody>
</table>


				<div class="d-flex justify-content-center mb-3">
				<span style="margin: 0 auto; padding-left: 53px;">${paging.pagingHTML }</span>
			    <a href="<c:url value='/safety/confisInfoInsert.do'/>" class="btn btn-primary" style="height: 39px;">등록</a>
				</div>
				
				<div id="searchUI" class="d-flex justify-content-center">
					<div style="margin-right:5px;">
						<form:select path="simpleCondition.searchType" class="form-select">
							<form:option value="" label="전체" />
							<form:option value="writer" label="구분" />
							<form:option value="title" label="내용" />
							<form:option value="content" label="ID" />
						</form:select>
					</div>
					<div style="margin-right:5px;">
						<form:input path="simpleCondition.searchWord" class="form-control"/>
					</div>
					<div>
						<input type="button" value="검색" id="searchBtn" class="btn btn-secondary gray_btn"/>
						<a class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">액체류 정의</a>
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


<!-- Modal Dialog Scrollable -->
<div class="modal fade" id="modalDialogScrollable" tabindex="-1">
  <div class="modal-dialog modal-dialog-scrollable" >
    <div class="modal-content" style="width: 130%; margin-left: -15%;">
      <div class="modal-header">
        <h5 class="modal-title"><i class="bi bi-droplet"></i>액체류 정의</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
     <!-- 액체류 조회 출력 --> 
		<table class="table table-bordered">
		<thead class="table-light">
			<th class="text-center">액체종류</th>
			<th class="text-center">액체예시</th>
		</thead>
		<tbody>
			<c:if test="${empty liquidList }">
				<tr>
					<td colspan="4"> 액체종류 없음.</td>
				</tr>
			</c:if>
			<c:if test="${not empty liquidList }">
				<c:forEach items="${liquidList}" var="lqd">
					<tr>
						<td>${lqd.liquid}</td>
						<td>${lqd.liquidKind}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		</table>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div><!-- End Modal Dialog Scrollable-->
              
              
              
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
	$(document).ready(function(){
	$(".content").each(function() {
        var content = $(this).text();
        if (content.length > 30) {
           var truncatedContent = content.substring(0, 25) + "...";
           $(this).text(truncatedContent);
        }
     });
	});
</script>




