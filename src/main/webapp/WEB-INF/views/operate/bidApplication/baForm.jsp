<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<security:authentication property="principal.realUser" var="authMember" />
<script
	src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<form:form method="post" modelAttribute="ba"
	enctype="multipart/form-data">
	<form:hidden path="baId" value="${baId }" />


	<style>
.table-title {
	font-size: 30px;
	margin-bottom: 10px;
	color: deepskyblue;
}
.custom-input-size {
        width: 500px; 
    }
</style>

	<div class="table-title">입찰 신청</div>



	<table class="table table-border">

		<tr>
			<th>공고번호</th>
			<td><form:input path="baBnNo" name="bnNo" class="form-control" readonly="true"
					value="${bn.bnNo }" /> <form:errors path="baBnNo" class="error" /></td>
		</tr>
		<tr>
			<th>위치</th>
			<td><form:input path="baReqSpace" name="bnEnterLoc"
					class="form-control" readonly="true" value="${bn.bnEnterLoc }" /> <form:errors
					path="baReqSpace" class="error" /></td>
		</tr>

		<tr>
			<th>업체이름</th>
			<td><form:input path="baCoNm" class="form-control" /> <form:errors
					path="baCoNm" class="error" /></td>
		</tr>

		<tr>
			<th>운영시간</th>
			<td><form:input path="baStartTime" type="time" id="startTime" class="form-control custom-input-size" style="display: inline-block; width: auto;"/> 부터
				<form:input path="baEndTime" type="time" id="endTime" class="form-control custom-input-size" style="display: inline-block; width: auto;"/> 까지
			</td>
		</tr>

		<tr>
			<th>이메일</th>
			<td><form:input path="baEmail" class="form-control" /> <form:errors
					path="baEmail" class="error" /></td>

		</tr>
		<tr>
			<th>전화번호</th>
			<td><form:input path="baContact" class="form-control" /> <form:errors
					path="baContact" class="error" /></td>
		</tr>
		
<!-- 		<tr> -->
<!-- 			<th>상태</th> -->
<!-- 			<td> -->
<%-- 				<form:select path="baStatus" class="form-select"> --%>
<%-- 					<form:option value="" label="" /> --%>
<%-- 					<form:options items="${bastuList }" itemLabel="codeNm" itemValue="codeNm"/> --%>
<%-- 				</form:select> --%>
<%-- 				<form:errors path="baStatus" class="error" /> --%>
<!-- 			</td> -->
<!-- 		</tr> -->
		
		


	</table>
		<div style="text-align: right; margin-top: 10px;">
		<input class="btn btn-outline-dark" type="submit" value="등록" /> 
		<a href="<c:url value="/operate/bidApplication/baList.do" />" class="btn btn-outline-dark">취소</a>
			<a href="<c:url value="/operate/bidApplication/baList.do" />" class="btn btn-outline-dark">목록</a>
</div>

</form:form>

<script>
	// 	 var baMngerNmInput = document.querySelector('[name="baMngerNm"]');
	// 	    if (baMngerNmInput.value.trim() === '') {
	// 	    	baMngerNmInput.value = '김운영';
	// 	    }
</script>