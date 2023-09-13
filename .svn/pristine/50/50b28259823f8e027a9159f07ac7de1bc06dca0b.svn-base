
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<form:form method="post" modelAttribute="vendor">
<form:hidden path="vendId" value="${vendId}" />
<form:hidden path="vendNm" value="${vendNm}" />
<form:hidden path="vendType" value="${vendType}" />
<form:hidden path="vendDt" value="${vendDt}" />
<form:hidden path="vrId" value="${vrId}" />
<form:hidden path="vendCtrId" value="${vendCtrId}" />

	<table class="table table-border">
		<tr>
			<th><spring:message code="vendor.vendId" /></th>
			<td>
				<input class="form-control" value="${vendor.vendId }" disabled />
			</td>
		</tr>
		<tr>
			<th><spring:message code="vendor.vendNm" /></th>
			<td>
				<input class="form-control" value="${vendor.vendNm }" disabled />
			</td>
		</tr>
		<tr>
			<th><spring:message code="vendor.vendType" /></th>
			<td>
				<input class="form-control" value="${vendor.vendType }" disabled />
			</td>
		</tr>
		<tr>
			<th><spring:message code="vendor.vendDt" /></th>
			<td>
				<input class="form-control" value="${vendor.vendDt }" disabled />
			</td>
		</tr>
		<tr>
			<th><spring:message code="vendor.vrId" /></th>
			<td>
				<input class="form-control" value="${vendor.vrId }" disabled />
			</td>
		</tr>

		<tr>
			<th><spring:message code="vendor.vendCtrId" /></th>
			<td>
				<input class="form-control" value="${vendor.vendCtrId }" disabled />
			</td>
		</tr>
		<tr>
			<th><spring:message code="vendor.vendOpHours" /></th>
			<td>
				<form:input path="vendOpHours" class="form-control" />
				<form:errors path="vendOpHours" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="vendor.vendClHours" /></th>
			<td>
				<form:input path="vendClHours" class="form-control" />
				<form:errors path="vendClHours" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="vendor.vendContact" /></th>
			<td>
				<form:input path="vendContact" class="form-control" />
				<form:errors path="vendContact" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="vendor.vendLoc" /></th>
			<td>
				<form:input path="vendLoc" class="form-control" />
				<form:errors path="vendLoc" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="vendor.vendMvp" /></th>
			<td>
				<form:input path="vendMvp" class="form-control" maxlength="30" />
				<form:errors path="vendMvp" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="vendor.vendDesc" /></th>
			<td>
				<form:input path="vendDesc" class="form-control" />
				<form:errors path="vendDesc" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="vendor.vendImg" /></th>
			<td>
				<form:input path="vendImg" class="form-control" />
				<form:errors path="vendImg" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="vendor.vendStatus" /></th>
			<td>
				<form:select path="vendStatus" class="form-control">
		            <form:option value="">-- 선택하세요 --</form:option>
		            <form:option value="V00">신규</form:option>
		            <form:option value="V01">계약 진행</form:option>
		            <form:option value="V03">계약 완료</form:option>
		            <form:option value="V04">연장 계약</form:option>
		            <form:option value="V99">계약 만료(퇴점)</form:option>
		            <form:option value="V88">유찰</form:option>
		        </form:select>
		        <form:errors path="vendStatus" class="error" />
			</td>
		</tr>
		<tr>
		<td colspan="2">
			<input class="btn btn-success" type="submit" value="저장"> 
			<a class="btn btn-secondary" href="<c:url value='/hr/vendor/vendorList.do'/>">목록</a>
		</td>
	</tr>

	</table>
</form:form>
