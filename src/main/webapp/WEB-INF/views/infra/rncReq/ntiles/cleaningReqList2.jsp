<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<c:set var="recReq" value="${paging.dataList }" />
<c:if test="${empty cwt }">
	<tr>
		<td colspan="10">요청내용 없음.</td>
	</tr>
</c:if>
<c:if test="${not empty cwt}">
	<c:forEach items="${cwt }" var="cwt">
		<input type="hidden" value="${cwt.rrType}" />
		<tr>
			<td>${cwt.rrId }</td>
			<td>${cwt.zone.zoneFloor }층${cwt.zone.zoneCtgr }</td>
			<td class="content">${cwt.rrContent }</td>
			<td>${cwt.rrTs.toString().split(':')[0].replace('T', ' ')}:${cwt.rrTs.toString().split(':')[1]}</td>
			<td>${cwt.employee.empNm }</td>
			<td>${cwt.common.codeNm }</td>
			<td><c:choose>
					<c:when test="${cwt.rrStts == 'UN'}">
						<button onclick="javascript:;" data-who="${cwt.rrId}"
							data-where="${cwt.zone.zoneCd}" data-ca="${cwt.common.codeNm}"
							data-bs-toggle="modal" data-bs-target="#disablebackdrop"
							class="rncReqid">등록</button>
						<button onclick="javascript:;" data-what="${cwt}"
							data-rrid="${cwt.rrId }" data-rr-content="${cwt.rrContent }"
							data-rr-stts="${cwt.rrStts }" data-bs-toggle="modal"
							data-bs-target="#companion" class="rncReqid">반려</button>
					</c:when>
					<c:when test="${cwt.rrStts == 'CP' }">
						<button onclick="javascript:;" data-who="${cwt.rrId}"
							data-where="${cwt.zone.zoneCd}" data-ca="${cwt.common.codeNm}"
							data-bs-toggle="modal" data-bs-target="#disablebackdrop2"
							class="rncReqid">상세보기</button>
					</c:when>
				</c:choose></td>
		</tr>
	</c:forEach>
</c:if>