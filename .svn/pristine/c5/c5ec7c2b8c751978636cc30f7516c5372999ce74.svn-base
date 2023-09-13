<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<table class="table table-bordered" style="margin-top: 10px; margin-bottom: 10px;">
	<tr>
		<th class="table-light thwidth">제목</th>
		<td>${secLogView.slogTitle }</td>
		<th class="table-light thwidth">일지ID</th>
		<td>${secLogView.slogId }</td>
	</tr>
	<tr>
		<th class="table-light">보안접수 내역</th>
		<td data-srid="${secLogView.slogSrId }">${secLogView.slogSrId }
			&nbsp;&nbsp;&nbsp; <c:if test="${not empty secLogView.slogSrId}">
				<button type="submit" id="secReqShow" class="btn btn-light"
					style="border: 1px solid #d1d1d1; background: #f1f1f1; padding: 5px 10px;">보기</button>
			</c:if> <c:if test="${empty secLogView.slogSrId}">
					    -
					    </c:if>
		</td>
		<th class="table-light">작성일시</th>
		<td>${secLogView.slogCrtTs.toString().replace("T"," ")}</td>
	</tr>
	<tr>
		<th class="table-light">보안이슈</th>
		<td colspan="3">${secLogView.slogIssue }</td>
	</tr>
	<tr>
		<th class="table-light">위치</th>
		<td>${secLogView.zone.zoneFloor }층${secLogView.zone.zoneCtgr }</td>
		<th class="table-light">압수품 여부</th>
		<td>${secLogView.slogConfis }</td>
	</tr>
	<tr>
		<th class="table-light">처리내용</th>
		<td colspan="3">${secLogView.slogContent }</td>
	</tr>
	<tr>
		<th class="table-light">처리일시</th>
		<td>${secLogView.slogPrcDt.toString().replace("T"," ")}</td>
		<th class="table-light">작성자</th>
		<td>${secLogView.slogWriter }</td>
	</tr>
	<tr>
		<th class="table-light">개선사항</th>
		<td colspan="3">${secLogView.slogInh }</td>
	</tr>
</table>


<div id="ReqListArea" style="margin-top: 40px;"></div>
