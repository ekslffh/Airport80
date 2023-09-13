<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<security:authentication property="principal.realUser" var="authMember" />
<script
	src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<form:form method="post" modelAttribute="lostItem"
	enctype="multipart/form-data" id="insertForm">
	<form:hidden path="liId" value="${liId }" />
	<form:hidden path="atchFileId" value="${atchFileId }" />
<style>
	th{
		width: 200px;
	}


</style>


	<div class="card">
		<div class="card-header" style="padding: 9px 15px 9px; color: #787878; background: #c5d0e3; color: white; font-size: 19px;">분실물 등록
		&nbsp;
		<i class="bi bi-file-text" id="autoFillIcon" style="cursor: pointer; color:black";></i>
		</div>
		<div class="card-body" style="height: 400px;">


		<table class="table table-bordered" style="margin-top:20px;">

			<tr>
				<th class="table-light">분실물이름</th>
				<td  colspan="3"><form:input path="liNm" class="form-control" /> <form:errors
						path="liNm" class="error" /></td>
			</tr>
			<tr>
				<th class="table-light">분실물종류</th>

				<td colspan="3"><form:select path="liCtgr" class="form-select">
						<form:option value="" label="" />
						<form:options items="${commonList }" itemLabel="codeNm"
							itemValue="codeNm" />
					</form:select> <form:errors path="liCtgr" class="error" /></td>
			</tr>

			<tr>
				<th class="table-light">습득일시</th>
				<td><form:input path="liFndTs" class="form-control" type="date" />
					<form:errors path="liFndTs" class="error" /></td>

				<th class="table-light">습득장소</th>
				<td><form:select path="liLoc" class="form-select">
						<form:option value="" label="" />
						<form:options items="${zoneList }" itemLabel="zoneCd"
							itemValue="zoneCd" />
					</form:select> <form:errors path="liLoc" class="error" /></td>
			</tr>
			<tr>
				<th class="table-light">분실자명</th>
				<td colspan="3"><form:input path="liPsNm" class="form-control" /> <form:errors
						path="liPsNm" class="error" /></td>
			</tr>

			<tr>
				<th class="table-light">상태</th>
				<td colspan="3"><form:select path="liStatus" class="form-select">
						<form:option value="" label="" />
						<form:options items="${statusList }" itemLabel="codeNm"
							itemValue="codeNm" />
					</form:select> <form:errors path="liStatus" class="error" /></td>
			</tr>

			<tr>
				<th class="table-light">분실물 이미지</th>
				<td colspan="3"><input type="file" name="liFiles" multiple /></td>
			</tr>
			
		</table>

				<div colspan="2" style="text-align: right; "><input
					class="btn btn-primary" type="submit" value="등록" /> <a
					href="<c:url value="/lostItem/lostItemList.do" />"
					class="btn btn-secondary">취소</a></div>

	</div>
	</div>

</form:form>

<script>
$(document).ready(function() {
    const autoFillIcon = $("#autoFillIcon");

    autoFillIcon.click(function() {
        $("input[name='liNm']").val("카드");
        $("select[name='liCtgr']").val("가방/지갑");
        $("input[name='liFndTs']").val("2023-09-13");
        $("input[name='liPsNm']").val("김은지");
        $("select[name='liLoc']").val("1AC");
        $("select[name='liStatus']").val("등록");
    });
});
</script>












