<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<table class="table table-bordered">
	<thead class="table-light">
		<tr>
			<th style="width:200px;" class="text-center">요청ID</th>
			<th class="text-center">위치</th>
			<th class="text-center">내용</th>
			<th style="width:250px;" class="text-center">요청일시</th>
			<th class="text-center">작성자</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty comRecReq }">
			<tr>
				<td colspan="5">접수완료된 청소접수 내역 없음.</td>
			</tr>
		</c:if>
		<c:if test="${not empty comRecReq }">
			<c:forEach items="${comRecReq}" var="comRecReq">
				<tr style="cursor: pointer;">
					<td class="rncItem" data-rrid="${comRecReq.rrId}">${comRecReq.rrId}</td>
					<td class="rncItem" data-rrloc="${comRecReq.zone.zoneFloor},${comRecReq.zone.zoneCd}">${comRecReq.zone.zoneFloor}층 ${comRecReq.zone.zoneCtgr}</td>
					<td class="rncItem" data-rrcontent="${comRecReq.rrContent}">${comRecReq.rrContent}</td>
					<td class="rncItem" data-rrts="${comRecReq.rrTs}">${comRecReq.rrTs.toString().replace('T',' ')}</td>
					<td class="rncItem" data-rracc="${comRecReq.rrAcc}">${comRecReq.employee.empNm}</td>
				</tr>
			</c:forEach>
		</c:if>

	</tbody>
</table>
<p style="margin-top: -10px; font-size: 15px; text-align: right; color: #050505;">* 접수 완료된 목록 입니다.</p>
