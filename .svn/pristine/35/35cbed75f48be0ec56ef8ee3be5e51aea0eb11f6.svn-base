<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<table class="table table-bordered">
	<thead class="table-light">
		<th class="text-center">요청ID</th>
		<th class="text-center">카테고리</th>
		<th class="text-center">위치</th>
		<th class="text-center">요청일시</th>
		<th class="text-center">작성자</th>
	</thead>

	<tbody>
		<c:if test="${empty comSecReq }">
			<tr>
				<td colspan="5">접수완료된 보안접수 내역 없음.</td>
			</tr>
		</c:if>
		<c:if test="${not empty comSecReq }">
			<c:forEach items="${comSecReq}" var="secReq">
				<tr style="cursor: pointer;">
					<td class="secItem" data-slogid="${secReq.srId}">${secReq.srId}</td>
					<td class="secItem" data-slogca="${secReq.srCa}">${secReq.srCa}</td>
					<td class="secItem" data-slogfloor="${secReq.zone.zoneFloor}" data-slogctgr="${secReq.zone.zoneCd}">${secReq.zone.zoneFloor}층
						${secReq.zone.zoneCtgr}</td>
						
						
					<td class="secItem" data-slogts="${secReq.srTs}">${secReq.srTs.toString().replace('T',' ')}</td>
					<td class="secItem" data-slogmem="${secReq.srReqMem}">${secReq.srReqMem}</td>
					<td class="secItem" data-slogsrct="${secReq.srContent}" hidden>${secReq.srContent}</td>
					<td class="secItem" data-slogsrprct="${secReq.srPrcCt}" hidden>${secReq.srPrcCt}</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<p style="margin-top: -10px; font-size: 15px; text-align: right; color: #050505;">* 보안접수 완료된 목록 입니다.</p>


