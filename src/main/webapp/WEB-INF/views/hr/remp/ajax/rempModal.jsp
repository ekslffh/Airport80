<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="table table-bordered">
	<tr>
		<th><spring:message code="emp.empNo" /></th>
		<td>${emp.empNo }</td>
	</tr>
	<tr>
		<th><spring:message code="emp.empNm" /></th>
		<td>${emp.empNm }</td>
	</tr>
	<tr>
		<th><spring:message code="emp.empStatus" /></th>
		<td>
			<c:choose>
	            <c:when test="${emp.empStatus == 0}">신규</c:when>
	            <c:when test="${emp.empStatus == 1}">출근</c:when>
	            <c:when test="${emp.empStatus == 2}">퇴근</c:when>
	            <c:when test="${emp.empStatus == 3}">휴가</c:when>
	            <c:when test="${emp.empStatus == 4}">퇴사</c:when>
	        </c:choose>		
		</td>
	</tr>
	<tr>
		<th><spring:message code="emp.empBir" /></th>
		<td>${emp.empBir }</td>
	</tr>
	<tr>
		<th><spring:message code="emp.empGender" /></th>
		<td>${emp.empGender }</td>
	</tr>
	<tr>
		<th><spring:message code="emp.empEmail" /></th>
		<td>${emp.empEmail }</td>
	</tr>
	<tr>
		<th><spring:message code="emp.empAddr" /></th>
		<td>퇴사자의 개인정보는 열람할 수 없습니다.</td>
	</tr>
	<tr>
		<th><spring:message code="emp.empContact" /></th>
		<td>퇴사자의 개인정보는 열람할 수 없습니다.</td>
	</tr>
	<tr>
		<th><spring:message code="emp.empJoinDt" /></th>
		<td>${emp.empJoinDt }</td>
	</tr>
	<tr>
		<th><spring:message code="emp.empResignDt" /></th>
		<td>${emp.empResignDt }</td>
	</tr>
	<tr>
		<th><spring:message code="emp.empDeptNo" /></th>
		<td>
		    <c:choose>
		        <c:when test="${emp.empDeptNo == 1201}">
		            <c:choose>
		                <c:when test="${emp.empTeam == 31}">인사</c:when>
		                <c:when test="${emp.empTeam == 32}">회계</c:when>
		            </c:choose>
		        </c:when>
		        <c:when test="${emp.empDeptNo == 1202}">운영</c:when>
		        <c:when test="${emp.empDeptNo == 1203}">보안</c:when>
		        <c:when test="${emp.empDeptNo == 1204}">인프라</c:when>
		    </c:choose>	
		</td>
	</tr>
	<tr>
		<th><spring:message code="emp.empAccnum" /></th>
		<td>퇴사자의 개인정보는 열람할 수 없습니다.</td>
	</tr>
	<tr>
		<th><spring:message code="emp.empCtrFile" /></th>
		<td>퇴사자의 개인정보는 열람할 수 없습니다.</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<a class="btn btn-secondary" href="<c:url value='/hr/remp/rempList.do'/>">목록</a>
		</td>
	</tr>
</table>

