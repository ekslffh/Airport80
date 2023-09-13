<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
  
<c:url value="/operate/flightlog/insert.do" var="insertURL" />


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
					
					
<div class="d-flex justify-content-end mb-3">
<a href="${insertURL }" class="btn btn-primary">일지작성</a>
</div>
<table class="table table-bordered" style="text-align:center;">
	<thead>
<!-- 		<tr align="right"> -->
<!-- 			<td colspan="4"> -->
<%-- 				<a href="${insertURL }" class="btn btn-primary">일지작성</a> --%>
<!-- 			</td> -->
<!-- 		</tr> -->
		<tr>
			<th class="table-light">제목</th>
<!-- 			<th>내용</th> -->
			<th class="table-light">작성일시</th>
			<th class="table-light">작성자</th>
		</tr>
	</thead>
	<tbody>
		<c:set value="${paging.dataList }" var="fLogList" />
		<c:if test="${empty fLogList }">
			<tr>
				<td colspan="4">등록된 일지 없음.</td>
			</tr>
		</c:if>	
		<c:if test="${not empty fLogList }">
			<c:forEach items="${fLogList }" var="fLog">
				<c:url value="/operate/flightlog/view.do" var="viewURL">
					<c:param name="what" value="${fLog.flId }" />
				</c:url>
				<tr>
					<td><a href="${viewURL }">${fLog.flTitle }</a></td>
<%-- 					<td>${fLog.flContent }</td> --%>
					<td>
					  <script>
					    var timestamp = "${fLog.flCrtTs}";
					    var formattedTimestamp = timestamp.substring(0, 16).replace('T', ' ');
					    document.write(formattedTimestamp);
					  </script>
					</td>
					<td>${fLog.employee.empNm }</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4" style="align:center;">
<!-- 				<div> -->
<%-- 					${paging.pagingHTML } --%>
<!-- 				</div> -->
				<div class="d-flex justify-content-center mb-3">
				${paging.pagingHTML }
				</div>
			</td>
		</tr>
	</tfoot>
</table>


				</div>
			</div>
		</div>
	</div>
</section>

<script>
	function fn_paging(page) {
		location.href = "?page=" + page;
	}
</script>