<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<script src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<form:form method="post" modelAttribute="cnb" enctype="multipart/form-data">
<form:hidden path="cnbNo"/>
<form:hidden path="atchFileId" value="${atchFileId }" />
<style>
	.cnbno{
		color: red;
	}
</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

				<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<h5 class="card-tit">공지내용 수정</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">고객</a></li>
					        <li class="breadcrumb-item ">공지게시판 관리</li>
					        <li class="breadcrumb-item active">공지내용 수정(<span class="cnbno">${cnb.cnbNo }</span>)</li>
					      </ol>
					    </nav>
				</div>
					 <div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							고객 공지게시판의 글을 수정할 수 있습니다.</span>
						</p>
					</div>					
<table class="table table-border">
	
	<tr>
		<th><spring:message code="cnb.cnbTitle" /></th>
		<td>
			<form:input path="cnbTitle" class="form-control" />
			<form:errors path="cnbTitle" class="error" />		
		</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>
			<input type="file" name="cnbFiles" multiple />
		</td>
	</tr>
	<tr>
		<th><spring:message code="cnb.cnbContent" /></th>
		<td>
		    <label>
		        <form:textarea path="cnbContent" class="form-control" /> 
		    </label>
		    <form:errors path="cnbContent" class="error" />
		</td>
	</tr>

	<tr>
	    <th><spring:message code="cnb.cnbWriter" /></th>
	    <td>
	        <form:input path="cnbWriter" class="form-control" value="김운영" readonly="true" />
	        <form:errors path="cnbWriter" class="error" />		
	    </td>
	</tr>
</table>
					</div>
			</div>
		</div>
	</div>
</section>
</form:form>

		 <div style="text-align: right; margin-top: 10px;">
			<input class="btn btn-primary" type="submit" value="저장">
			<a class="btn btn-secondary" href="<c:url value='/operate/custNoticeBrd/cnbList.do'/>">취소</a>
		</div>




<script>
	CKEDITOR.replace('cnbContent', {	
		filebrowserImageUploadUrl: '${pageContext.request.contextPath }/operate/cnbNoticeBrd/uploadImage.do',
	});
</script>


