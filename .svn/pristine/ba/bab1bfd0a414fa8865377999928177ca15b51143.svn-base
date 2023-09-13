<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<security:authentication property="principal.realUser" var="authMember" />
<script src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<form:form method="post" modelAttribute="lostItem" enctype="multipart/form-data"> 
	<form:hidden path="atchFileId" value="${atchFileId }" />
	<form:hidden path="liId" value="${liId }" />
<style>
	.liid{
		color: red;
	}
</style>
	
	<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
	
				<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<h5 class="card-tit">분실물정보 수정</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">고객</a></li>
					        <li class="breadcrumb-item ">분실물관리</li>
					        <li class="breadcrumb-item active">분실물 정보수정(<span class="liid">${lostItem.liId}</span>)</li>
					      </ol>
					    </nav>	
					</div>
					
					 <div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							등록된 분실물의 정보를 수정할 수 있습니다.</span>
						</p>
					</div>						
	
		
	<table class="table table-border">
		
		
		<tr>
			<th>분실물이름</th>
			<td><form:input path="liNm" class="form-control" /> <form:errors
					path="liNm" class="error" /></td>
		</tr>
		<tr>
			<th>분실물종류</th>

			<td>
				<form:select path="liCtgr" class="form-select">
					<form:option value="" label="" />
					<form:options items="${commonList }" itemLabel="codeNm" itemValue="codeNm"/>
				</form:select>
				<form:errors path="liCtgr" class="error" />
			</td>
		</tr>
		
		<tr>
			<th>습득일시</th>
			<td>
			<form:input path="liFndTs" class="form-control" type="date"/> 
			<form:errors path="liFndTs" class="error" />
			</td>
		</tr>
		<tr>
			<th>습득장소</th>
			<td>
				<form:select path="liLoc" class="form-select">
					<form:option value="" label="" />
					<form:options items="${zoneList }" itemLabel="zoneCd" itemValue="zoneCd"/>
				</form:select>
				<form:errors path="liLoc" class="error" />
			</td>
		</tr>
		<tr>
			<th>분실자명</th>
			<td><form:input path="liPsNm" class="form-control" /> <form:errors
					path="liPsNm" class="error" /></td>
		</tr>
		
		<tr>
			<th>상태</th>
			<td>
				<form:select path="liStatus" class="form-select">
					<form:option value="" label="" />
					<form:options items="${statusList }" itemLabel="codeNm" itemValue="codeNm"/>
				</form:select>
				<form:errors path="liStatus" class="error" />
			</td>
		</tr>
		
		<tr>
		<th>분실물 이미지</th>
		<td>
			<input type="file" name="liFiles" multiple />
		</td>
		</tr>
	</table>
	
					</div>
			</div>
		</div>
	</div>
</section>
		
			<div style="text-align: right; margin-top: 10px;">
				<input class="btn btn-primary" type="submit" value="저장" /> 
				<a href="<c:url value="/lostItem/lostItemList.do" />" class="btn btn-secondary">취소</a>
			</div>
</form:form>

