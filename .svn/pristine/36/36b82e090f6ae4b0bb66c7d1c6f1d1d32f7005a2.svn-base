 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
			

<security:authentication property="principal.realUser" var="authMember" />
<script src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<form:form method="post" modelAttribute="empbrd" enctype="multipart/form-data">
	<form:hidden path="ebNo" value="${ebNo }" />
	<form:hidden path="atchFileId" value="${atchFileId }" />
	<form:hidden path="empNo" value="${authMember.empNo }" />

	<div class="card">
	<div class="card-header" style="padding: 9px 15px 9px; color: #787878; background: #c5d0e3; color: white; font-size: 19px;">공지 등록</div>
	<div class="card-body">	
	
	
	<table class="table table-bordered" style="margin-top:20px;">
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
			<input class="form-control" value="${authMember.empNm }" disabled />	
		</td>
	</tr>
	<tr>
		<th><spring:message code="empbrd.ebPub" /></th>
		<td>
		    <label>
		        <form:radiobutton path="ebPub" value="Y" /> 필독 처리
		    </label>
<!-- 		    <label> -->
<%-- 		        <form:radiobutton path="ebPub" value="N" /> 필독하지 않음 --%>
<!-- 		    </label> -->
		    <form:errors path="ebPub" class="error" />
		</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>
			<input type="file" name="ebFiles" multiple />
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
			<input class="btn gray_btn" id="autoFillButton" type="button" value="자동 생성">
			<input class="btn btn-dark" type="reset" value="취소"> 
			<a class="btn gray_btn" href="<c:url value='/hr/empbrd/empbrdList.do'/>">목록</a> 
			<input class="btn btn-primary" type="submit" value="등록">
		</td>
	</tr>
</table>
</div>
</div>
</form:form>
	
					</div>
			</div>
		</div>
	</div>
</section>

<!-- 값 자동생성  -->
<script>
$(document).ready(function() {
    const autoFillIcon = $("#autoFillButton");

    autoFillIcon.click(function() {
        $("input[name='ebTitle']").val("오늘의 공지사항");
        const ckEditorInstance = CKEDITOR.instances.ebContent;
        ckEditorInstance.setData("최종 프로젝트 다들 수고하셨습니다~!");
    });
});

CKEDITOR.replace('ebContent', {	
		filebrowserImageUploadUrl: '${pageContext.request.contextPath }/uploadImage.do',
	});
</script>
