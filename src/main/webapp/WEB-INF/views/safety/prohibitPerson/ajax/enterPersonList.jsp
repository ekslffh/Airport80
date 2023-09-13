<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table Default Table">
	<thead class="table-primary">
		<th>이름</th>
		<th>여권번호</th>
		<th>금지사유</th>
		<th>금지기간</th>
	</thead>
	<tbody>
		<c:if test="${empty ppersonList }">
			<tr>
				<td colspan="4">입국금지자 없음.</td>
			</tr>
		</c:if>
		<c:if test="${not empty ppersonList }">
			<c:forEach items="${ppersonList }" var="pperson">
				<c:url value="/safety/PPersonView.do" var="viewURL">
					<c:param name="what" value="${pperson.ppPno }" />
				</c:url>
				<tr>
					<td><a href="${viewURL }">${pperson.ppNm }</a></td>
					<td>${pperson.ppPno }</td>
					<td>${pperson.ppRes }</td>
					<td>${pperson.ppPer }</td>

				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<div class="d-flex justify-content-end">
	<a class="btn btn-primary" href="<c:url value='/safety/insertForm.do'/>">등록</a>
</div>