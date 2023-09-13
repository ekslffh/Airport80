<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<form:form method="post" modelAttribute="airline">
<form:hidden path="alKnm" value="${alKnm}" />
<form:hidden path="alEnm" value="${alEnm}" />
<form:hidden path="alCd" value="${alCd}" />
<form:hidden path="alCountry" value="${alCountry}" />
<form:hidden path="alCounCd" value="${alCounCd}" />
<form:hidden path="alFlag" value="${alFlag}" />
<form:hidden path="alScale" value="${alScale}" />
<form:hidden path="alVrId" value="${alVrId}" />

	<table class="table table-border">
		<tr>
			<th><spring:message code="airline.alKnm" /></th>
			<td>
				<input class="form-control" value="${airline.alKnm }" disabled />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alEnm" /></th>
			<td>
				<input class="form-control" value="${airline.alEnm }" disabled />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alCd" /></th>
			<td>
				<input class="form-control" value="${airline.alCd }" disabled />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alCountry" /></th>
			<td>
				<input class="form-control" value="${airline.alCountry }" disabled />
			</td>
		</tr>

		<tr>
			<th><spring:message code="airline.alCounCd" /></th>
			<td>
				<input class="form-control" value="${airline.alCounCd }" disabled />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alFlag" /></th>
			<td>
				<input class="form-control" value="${airline.alFlag }" disabled />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alScale" /></th>
			<td>
				<input class="form-control" value="${airline.alScale }" disabled />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alHead" /></th>
			<td>
				<form:input path="alHead" class="form-control" maxlength='20' />
				<form:errors path="alHead" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alVrId" /></th>
			<td>
				<input class="form-control" value="${airline.alVrId }" disabled />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alStatus" /></th>
			<td>
				<label>
			        <form:radiobutton path="alStatus" value="운영" /> 운영 <br>
			    </label> <br>
				<label>
			        <form:radiobutton path="alStatus" value="정지" /> 정지
			    </label>
			    <br>
				<label>
			        <form:radiobutton path="alStatus" value="폐업" /> 폐업
			    </label>
				<form:errors path="alStatus" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alDesc" /></th>
			<td>
				<form:input path="alDesc" class="form-control" />
				<form:errors path="alDesc" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alWeb" /></th>
			<td>
				<form:input path="alWeb" class="form-control" />
				<form:errors path="alWeb" class="error" />
			</td>
		</tr>
		<tr>
		<td colspan="2">
			<input class="btn btn-success" type="submit" value="저장"> 
			<a class="btn btn-secondary" href="<c:url value='/hr/airline/airlineList.do'/>">목록</a>
		</td>
	</tr>

	</table>
</form:form>
