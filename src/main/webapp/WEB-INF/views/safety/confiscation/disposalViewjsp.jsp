<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

<style>
.dispoArea{
    width: 350px;
    height: 350px;
}

.dispoArea img {
	width: 100%;
	height: 100%;
	border-radius: 5px;
}
</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					

				<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">폐기관리(압수품)</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">보안검색</a></li>
					        <li class="breadcrumb-item"><a href="#">폐기관리(압수품)</a></li>
					        <li class="breadcrumb-item active">폐기관리(압수품) 상세</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->
					
					
<table class="table Default Table">
	<tr>
		<th style="width: 180px;">압수품ID</th>
		<td>${confis.csId }</td>
	</tr>
	<tr>
		<th>물품명</th>
		<td>${confis.csNm }</td>
	</tr>
	<tr>
		<th>압수품 품목</th>
		<td>${confis.csCtgr }</td>
	</tr>
	<tr>
		<th>압수품 수량</th>
		<td>${confis.csQtt }</td>
	</tr>
	
	<tr>
		<th>압수자 이름</th>
		<td>${confis.csPsName }</td>
	</tr>
	<tr>
		<th>압수자 여권번호</th>
		<td>${confis.csPno }</td>
	</tr>
	
	<tr>
		<th>압수일시</th>
		<td>${confis.csTs.toString().replace('T', ' ') }</td>
	</tr>
	<tr>
		<th>압수사유</th>
		<td>${confis.csRsn }</td>
	</tr>
	<tr>
		<th>압수장소</th>
		<td>${confis.zone.zoneFloor }층 ${confis.zone.zoneCtgr } </td>
	</tr>
	
	<c:if test="${empty confis.slogId}">
	
	</c:if>
	
	<c:if test="${not empty confis.slogId}">
	<tr>
		<th>보안일지ID</th>
		<td>${confis.slogId }</td>
	</tr>
	</c:if>
	
	<tr>
		<th>압수품 상태</th>
		<td>${confis.common.codeNm}</td>
	</tr>
	
	<tr>
		<th>압수품 폐기 사진</th>
		<td>
			<div class="dispoArea">
				<img src="${pageContext.request.contextPath }/resources/images/disposal/${confis.fileGroup.detailList[0].fiNm}" alt="첨부이미지" />
			</div>
		</td>
	</tr>
</table>	

		<div class="d-flex justify-content-end">
			<c:url value="/safety/confisUpdate.do" var="updateURL">
				<c:param name="what" value="${confis.csId}"/>
			</c:url>
			<a class="btn btn-primary" href="${updateURL}" style="margin-right:4px;">수정</a>
			<a class="btn btn-secondary gray_btn" href="<c:url value='/safety/disposal/list.do' />">목록으로</a>
		</div>

				</div>
			</div>
		</div>
	</div>
</section>		
					
					