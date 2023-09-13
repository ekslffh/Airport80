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
			<th class="text-center" style="width: 65px;">작성자</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty comRncReq }">
			<tr>
				<td colspan="5">접수완료된 유지보수접수 내역 없음.</td>
			</tr>
		</c:if>
		<c:if test="${not empty comRncReq }">
			<c:forEach items="${comRncReq}" var="rncReq">
				<tr style="cursor: pointer;">
					<td class="rncItem" data-rrid="${rncReq.rrId}">${rncReq.rrId}</td>
					<td class="rncItem" data-rrloc="${rncReq.zone.zoneFloor},${rncReq.zone.zoneCd}">${rncReq.zone.zoneFloor}층 ${rncReq.zone.zoneCtgr}</td>
					<td class="rncItem" data-rrcontent="${rncReq.rrContent}">${rncReq.rrContent}</td>
					<td class="rncItem" data-rrts="${rncReq.rrTs}">${rncReq.rrTs.toString().replace('T',' ')}</td>
					<td class="rncItem" data-rracc="${rncReq.rrAcc}">${rncReq.employee.empNm}</td>
				</tr>
			</c:forEach>
		</c:if>

	</tbody>
</table>
<p style="margin-top: -10px; font-size: 15px; text-align: right; color: #050505;">* 접수 완료된 목록 입니다.</p>
<table class="table table-bordered">
	<thead class="table-light">
		<tr>
			<th style="width:200px;" class="text-center">점검명</th>
			<th class="text-center">위치</th>
			<th class="text-center">내용</th>
			<th style="width:250px;" class="text-center">점검일</th>
			<th class="text-center">담당자</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty comRepLog }">
			<tr>
				<td colspan="5">대기중인 점검 미흡 목록 없음.</td>
			</tr>
		</c:if>
		<c:if test="${not empty comRepLog }">
			<c:forEach items="${comRepLog}" var="comRepLog">
				<tr style="cursor: pointer;">
					<td class="rncItem" data-rrid="${comRepLog.rlNo}">${comRepLog.rlIt}(${comRepLog.rlNo})</td>
					<td class="rncItem" data-rrloc="${comRepLog.zone.zoneFloor},${comRepLog.rlSection}">${comRepLog.zone.zoneFloor}층 ${comRepLog.zone.zoneCtgr}</td>
					<td class="rncItem" data-rrcontent="${comRepLog.rlContent}">${comRepLog.rlContent}</td>
					<td class="rncItem" data-rrts="${comRepLog.rlDt}">${comRepLog.rlDt.toString().replace('T',' ')}</td>
					<td class="rncItem" data-rracc="${comRepLog.rlWriter}">${comRepLog.employee.empNm}</td>
				</tr>
			</c:forEach>
		</c:if>

	</tbody>
</table>
<p style="margin-top: -10px; font-size: 15px; text-align: right; color: #050505;">* 점검상태 미흡 목록입니다.</p>
