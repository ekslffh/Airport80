 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<security:authentication property="principal.realUser" var="authMember" />
<script src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<form:form method="post" modelAttribute="cnb" enctype="multipart/form-data">
	<form:hidden path="cnbNo" value="${cnbNo }" />
	<form:hidden path="atchFileId" value="${atchFileId }" />
	


	
	<div class="card">
	<div class="card-header" style="padding: 9px 15px 9px; color: #787878; background: #c5d0e3; color: white; font-size: 19px;">공지 등록
	&nbsp;
		<i class="bi bi-file-text" id="autoFillIcon" style="cursor: pointer; color:black";></i>
	</div>
	<div class="card-body">


	<table class="table table-bordered" style="margin-top:20px;">

	<tr>
		<th><spring:message code="cnb.cnbTitle" /></th>
		<td>
			<form:input path="cnbTitle" class="form-control" />
			<form:errors path="cnbTitle" class="error" />		
		</td>
	</tr>
	<tr>
	    <th><spring:message code="cnb.cnbWriter" /></th>
	    <td>
	        <form:input path="cnbWriter" class="form-control" value="김운영" readonly="true" />
	        <form:errors path="cnbWriter" class="error" />		
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
			<form:textarea path="cnbContent" class="form-control" />
			<form:errors path="cnbContent" class="error" />		<br>
		</td>
		
	</tr>

</table>

			<div style="text-align: right;">
			<input type="submit" value="등록" class="btn btn-primary"/>
			<a href="<c:url value="/operate/custNoticeBrd/cnbList.do" />" class="btn btn-secondary">취소</a>
			</div>		
</div>
</div>


	
</form:form>
<script>
	CKEDITOR.replace('cnbContent', {	
		filebrowserImageUploadUrl: '${pageContext.request.contextPath }/uploadImage.do',
	});
	

	$(document).ready(function() {
	    const autoFillIcon = $("#autoFillIcon");

	    autoFillIcon.click(function() {
	        $("input[name='cnbTitle']").val("우편물 테러 식별 및 대응요령");
	    });
	});

</script>
