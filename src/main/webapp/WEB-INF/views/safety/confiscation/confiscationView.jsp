
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
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">압수품 관리</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item">보안검색</li>
					        <li class="breadcrumb-item">압수품 관리</li>
					        <li class="breadcrumb-item active">압수품 상세보기</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->
					
<table class="table Default Table">
	<tr>
		<th style="width: 180px;" class="table-light">압수품ID</th>
		<td style="padding-left: 25px;">${confis.csId }</td>
	</tr>
	<tr>
		<th class="table-light">물품명</th>
		<td style="padding-left: 25px;">${confis.csNm }</td>
	</tr>
	<tr>
		<th class="table-light">압수품 품목</th>
		<td style="padding-left: 25px;">${confis.csCtgr }</td>
	</tr>
	<tr>
		<th class="table-light">압수품 수량</th>
		<td style="padding-left: 25px;">${confis.csQtt }</td>
	</tr>
	
	<tr>
		<th class="table-light">압수자 이름</th>
		<td style="padding-left: 25px;">${confis.csPsName }</td>
	</tr>
	<tr>
		<th class="table-light">압수자 여권번호</th>
		<td style="padding-left: 25px;">${confis.csPno }</td>
	</tr>
	
	<tr>
		<th class="table-light">압수일시</th>
		<td style="padding-left: 25px;">${confis.csTs.toString().replace('T', ' ') }</td>
	</tr>
	<tr>
		<th class="table-light">압수사유</th>
		<td style="padding-left: 25px;">${confis.csRsn }</td>
	</tr>
	<tr>
		<th class="table-light">압수장소</th>
		<td style="padding-left: 25px;">${confis.zone.zoneFloor }층 ${confis.zone.zoneCtgr } </td>
	</tr>
	
	<c:if test="${empty confis.slogId}">
	
	</c:if>
	
	<c:if test="${not empty confis.slogId}">
	<tr>
		<th class="table-light">보안일지ID</th>
		<td style="padding-left: 25px;">${confis.slogId }</td>
	</tr>
	</c:if>
	
	<tr>
		<th class="table-light">압수품 상태</th>
		<td style="padding-left: 25px;">${confis.common.codeNm}</td>
	</tr>
	
</table>	

	<div class="d-flex justify-content-end">
	<c:url value="/safety/confisUpdate.do" var="updateURL">
		<c:param name="what" value="${confis.csId}"/>
	</c:url>
		<a class="btn btn-primary" href="${updateURL}" style="margin-right:3px">수정</a>
		<a class="btn btn-dark" data-bs-toggle="modal"
			data-bs-target="#exampleModal" style="margin-right:3px" >삭제</a>
		<a class="btn btn-secondary gray_btn" href="<c:url value='/safety/confiscation.do' />">목록으로</a>
	</div>

<!-- Modal -->
<div class="modal fade" data-url="${viewURL }" id="exampleModal"
	tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">압수품 삭제</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form method="post"
				action="<c:url value='/safety/confisdelete.do'/>">
				<div class="modal-body">
					삭제하시겠습니까? 
					<input type="hidden" name="csId" value="${confis.csId}" /> 
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-dark">삭제</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>		

				</div>
			</div>
		</div>
	</div>
</section>		
					
					