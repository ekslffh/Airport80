<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<security:authentication property="principal.realUser" var="authMember" />
<script src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<form:form method="post" modelAttribute="blog" enctype="multipart/form-data"> 
	<form:hidden path="blogId" value="${blogId }" />
	
	
	<style>
         .table th {
    white-space: nowrap;
	width: 200px;

  }

</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    




					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">운행일지</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">셔틀버스</a></li>
					        <li class="breadcrumb-item"><a href="#">운행일지</a></li>
					        <li class="breadcrumb-item active">수정</li>
					      </ol>
					    </nav>
					 </div>
					 <div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							운행일지를 수정할 수 있다.</span>
						</p>
					</div>						 
	

	
	<table class="table table-border">

		<tr>
			<th class="table-light">제목</th>
			<td>
			<form:input path="blogTitle" class="form-control" /> 
			<form:errors path="blogTitle" class="error" /></td>
		</tr>
		<tr>
			<th class="table-light">내용</th>
			<td>
			<form:input path="blogContent" class="form-control" /> 
			<form:errors path="blogContent" class="error" /></td>
		</tr>
		
		<tr>
			<th class="table-light">작성일</th>
			<td>
			<form:input path="blogCrtTs" class="form-control" type="date"/> 
			<form:errors path="blogCrtTs" class="error" />
			</td>
		</tr>

		<tr>
			<th class="table-light">작성자</th>
			<td><form:input path="blogWriter" class="form-control" /> <form:errors
					path="blogWriter" class="error" /></td>
		</tr>
		
		
		
	
	</table>
	
			<div style="text-align: right; margin-top: 10px;">
				<input class="btn btn-primary" type="submit" value="저장" /> 
			<a href="<c:url value="/operate/busLog/blogList.do" />" class="btn btn-secondary">취소</a>
			</div>

				</div>
			</div>
		</div>
	</div>
</section>

</form:form>



