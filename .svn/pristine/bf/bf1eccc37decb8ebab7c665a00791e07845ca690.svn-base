<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.table-title {
	font-size: 30px;
	margin-bottom: 10px;
	color: deepskyblue;
}

.center-image {
	display: flex;
	justify-content: center;
	align-items: center;
}

.dtlTableDt {
	width: 100%;
	border-collapse: collapse;
	background-color : white;
}

.dtlTableDt tr td {
	height: 80px;
	border: 1px solid #e29292;
}

.timeWrap {
	margin-left: auto;
	margin-right: auto;
	width: 790px;
	height: 45px;
}

.timeWrap .box {
	width: 158px;
	height: 30px;
	margin: 0;
	padding-top: 10px;
	line-height: 15px;
	float: left;
	text-align: center;
}

.center {
    display: flex;
    justify-content: center;
    align-items: center;

  }
</style>

<div class="table-title"></div>


<!-- <div class="center-image"><img -->
<%-- 				src="${pageContext.request.contextPath }/resources/images/bn/${bn.fileGroup.detailList[0].fiNm}"  --%>
<!-- 				style="width:500px; height:500px;" -->
<!-- 				/></div> -->

<table class="table table-border">



	<tr>
		<th>공고 번호</th>
		<td>${bn.bnNo }</td>
	</tr>
	
	<tr>
			<th>공고 제목</th>
			<td>
			${bn.bnTitle}</td>
		</tr>
	<tr>
		<th>모집 위치</th>
		<td>${bn.bnEnterLoc }</td>
	</tr>
	<tr>
		<th>마감일</th>
		<td>${bn.bnDeadline }</td>
	</tr>

	<tr>
		<th>금액</th>
		<td>${bn.bnAmt }</td>
	</tr>
	<tr>
	<tr>
		<th>상태</th>
		<td><c:choose>
				<c:when test="${bn.bnStatus == '모집중'}">
					<span style="color: orange;">${bn.bnStatus}</span>
				</c:when>
				<c:when test="${bn.bnStatus == '모집완료'}">
					<span style="color: limegreen;">${bn.bnStatus}</span>
				</c:when>
				<c:otherwise>${bn.bnStatus}</c:otherwise>
			</c:choose></td>




		<c:url value="/operate/bidNotice/bnUpdate.do" var="updateURL">
			<c:param name="what" value="${bn.bnNo }" />
		</c:url>
		<c:url value="/operate/bidNotice/bnDelete.do" var="deleteURL">
			<c:param name="bnNo" value="${bn.bnNo }" />
		</c:url>
</table>
<br>
<%-- <security:authorize access="isAuthenticated()"> --%>
	<a href="${updateURL}" class="btn btn-outline-dark">수정</a>
	<a href="${deleteURL }" class="btn btn-outline-dark">삭제</a>
	<a href="<c:url value="/operate/bidNotice/bnList.do" />"
		class="btn btn-outline-dark">목록</a>
<%-- </security:authorize> --%>





<script>
	CKEDITOR
			.replace(
					'bnImg',
					{
						filebrowserImageUploadUrl : '${pageContext.request.contextPath }/uploadImage.do',
					});
</script>
