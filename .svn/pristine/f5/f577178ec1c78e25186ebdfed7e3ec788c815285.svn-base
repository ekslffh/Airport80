<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header"
						style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">운항 일지</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i
										class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">관제</a></li>
								<li class="breadcrumb-item active">운항</li>
							</ol>
						</nav>
					</div>
				
				
<table class="table table-bordered">
	<tr>
		<th class="table-light">제목</th>
		<td>${fLog.flTitle }</td>
	</tr>
	<tr>
		<th class="table-light">작성자</th>
		<td>${fLog.employee.empNm }</td>
	</tr>
	<tr>
		<th class="table-light" >내용</th>
		<td>${fLog.flContent }</td>
	</tr>
	<tr>
		<th class="table-light">작성일시</th>
		<td>${fLog.flCrtTs }</td>
	</tr>
	<tr>
		<th class="table-light">수정일시</th>
		<td>${fLog.flUpdTs }</td>
	</tr>
	<tr>
		<th class="table-light">첨부파일</th>
		<td><c:if
				test="${not empty fLog.fileGroup and not empty fLog.fileGroup.detailList }">
				<c:forEach items="${fLog.fileGroup.detailList }" var="fileDetail">
					<c:url value="/download.do" var="downloadURL">
						<c:param name="atchFileId" value="${fileDetail.atchFileId }" />
						<c:param name="fiSn" value="${fileDetail.fiSn }" />
					</c:url>
					<a href="${downloadURL }">${fileDetail.fiOriginNm }</a>
				</c:forEach>
			</c:if></td>
	</tr>
<!-- 	<tr> -->
<%-- 	<c:url value="/operate/flightlog/update.do" var="updateURL"> --%>
<%-- 		<c:param name="what" value="${fLog.flId }" /> --%>
<%-- 	</c:url> --%>
<%-- 	<c:url value="/operate/flightlog/delete.do" var="deleteURL"> --%>
<%-- 		<c:param name="flId" value="${fLog.flId }" /> --%>
<%-- 	</c:url> --%>
<!-- 		<td colspan="2"> -->
<%-- 			<a href="${updateURL }" class="btn btn-primary">수정</a> --%>
<%-- 			<a href="javascript:fn_delete('${deleteURL }')" class="btn btn-secondary">삭제</a> --%>
<%-- 			<a class="btn" href="${pageContext.request.contextPath }/operate/flightlog/list.do" style="border: 1px solid gray;">목록으로</a> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
</table>

<div style="text-align: right; margin-top: 10px;">
	<c:url value="/operate/flightlog/update.do" var="updateURL">
		<c:param name="what" value="${fLog.flId }" />
	</c:url>
	<c:url value="/operate/flightlog/delete.do" var="deleteURL">
		<c:param name="flId" value="${fLog.flId }" />
	</c:url>
	<a href="${updateURL }" class="btn btn-primary">수정</a>
	<a href="javascript:fn_delete('${deleteURL }')" class="btn btn-secondary">삭제</a>
	<a class="btn" href="${pageContext.request.contextPath }/operate/flightlog/list.do" style="border: 1px solid gray;">목록으로</a>
</div>


				</div>
			</div>
		</div>
	</div>
</section>




<script>
	function fn_delete(url) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href = url;
	       } else {
	           alert("삭제 취소되었습니다.");
	       }
	}
</script>