<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

					
<security:authentication property="principal.realUser" var="authMember" />
<script src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<form:form method="post" modelAttribute="fLog" enctype="multipart/form-data" action="${pageContext.request.contextPath }/operate/flightlog/insert.do">
	<form:hidden path="flId" value="${flId }" />
	<form:hidden path="atchFileId" value="${atchFileId }" />
	<form:hidden path="flWriter" value="${authMember.empNo }" />
	<table class="table table-bordered">
		<tr>
			<th>작성자</th>
			<td>
				<input class="form-control" value="${authMember.empNm }" disabled />
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<form:input class="form-control" path="flTitle" />
				<form:errors path="flTitle" class="error" />
			</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<input type="file" name="flFiles" multiple />
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<form:textarea class="form-control" path="flContent"/>
				<form:errors path="flContent" class="error" />
			</td>
		</tr>

	</table>
			<div style="text-align: right; margin-top: 10px;">
				<input type="submit" value="등록" class="btn btn-primary" /> 
				<input type="reset" value="취소" class="btn btn-secondary" />
				<a class="btn" href="${pageContext.request.contextPath }/operate/flightlog/list.do" style="border: 1px solid gray;">목록으로</a>
			</div>

</form:form>



<script>
	CKEDITOR.replace('flContent', {
      filebrowserImageUploadUrl: '${pageContext.request.contextPath }/uploadImage.do',
	});
	
	function fn_goList() {
		console.log("click!!!!!")
	}
</script>    