<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<security:authentication property="principal.realUser" var="authMember" />
<script src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">게시글 수정</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">사내 게시판</a></li>
					        <li class="breadcrumb-item active">게시물 수정</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->

<form:form method="post" modelAttribute="empbrd" enctype="multipart/form-data">
<form:hidden path="ebNo" value="${ebNo}"/>
<form:hidden path="atchFileId" value="${atchFileId}" />
<form:hidden path="empNo" value="${authMember.empNo}" />
	
<table class="table table-border">
	<tr>
		<th><spring:message code="empbrd.ebTitle" /></th>
		<td>
			<form:input path="ebTitle" class="form-control" />
			<form:errors path="ebTitle" class="error" />		
		</td>
	</tr>
	<tr>
		<th><spring:message code="empbrd.empNo" /></th>
		<td>
			<form:input path="empNo" class="form-control" />
			<form:errors path="empNo" class="error" />		
		</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>
			<input type="file" name="ebFiles" multiple />
		</td>
	</tr>
	<tr>
		<th><spring:message code="empbrd.ebPub" /></th>
		<td>
		    <label>
		        <form:radiobutton path="ebPub" value="Y" /> 필독
		    </label>
		    <form:errors path="ebPub" class="error" />
		</td>
	</tr>
	<tr>
		<th><spring:message code="empbrd.ebContent" /></th>
		<td>
			<form:textarea path="ebContent" class="form-control" />
			<form:errors path="ebContent" class="error" />
		</td>		
	</tr>
	<tr>
		<td colspan="2" style="text-align: right;">
			<input class="btn btn-primary" type="submit" value="수정">
			<input class="btn btn-dark" type="reset" value="취소">
			<a class="btn gray_btn" href="<c:url value='/hr/empbrd/empbrdList.do'/>">목록</a>
		</td>
	</tr>
</table>
</form:form>


				</div>
			</div>
		</div>
	</div>
</section>


<script>
	CKEDITOR.replace('ebContent', {	
		filebrowserImageUploadUrl: '${pageContext.request.contextPath }/uploadImage.do',
	});
</script>


