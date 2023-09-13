<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form method="post" modelAttribute="noBaList" >




	<div class="card-header" style="padding: 9px 15px 9px; color: #787878; background: #c5d0e3; color: white; font-size: 19px;">입찰 현황</div>
	<div class="card-body" >


<table class="table Default Table" style="margin-top:20px;">
	
		<tr>
			<th class="table-light" style="text-align: center">신청아이디</th>
			<th class="table-light" style="text-align: center">공고번호</th>
			<th class="table-light" style="text-align: center">신청일시</th>
			<th class="table-light" style="text-align: center">상태</th>
		</tr>

	<tbody>
		<c:if test="${empty noBaList }">
		<tr>
			<th colspan="5" style="text-align: center;">
				입찰내역이 없습니다.
			</th>
		</tr>
		</c:if>
		<c:if test="${not empty noBaList }">
			<c:forEach items="${noBaList }" var="ba">
			<c:url value="/operate/bidApplication/baView.do" var="viewURL">
					<c:param name="what" value="${ba.baId }" />
				</c:url>
				<tr>
					<td class="text-center"><a href="${viewURL }">${ba.baId }</a></td>
					<td class="text-center">${ba.baBnNo }</td>
					<td class="text-center">${ba.baCrtTs }</td>
					<td class="text-center">${ba.baStatus}</td>
				</tr>
			</c:forEach>
			</c:if>

	</tbody>
</table>

</div>



</form:form>

