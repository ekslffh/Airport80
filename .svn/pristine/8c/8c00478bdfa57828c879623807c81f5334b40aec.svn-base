<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


				    
<security:authentication property="principal.realUser" var="authMember" />
<form:form method="post" modelAttribute="vacreq" id="vacreqForm">
	<form:hidden path="vrEmpNo" value="${authMember.empNo }" />
	<div class="">
	
	</div>
	<table class="table table-border">

		<tr>
			<th>사번</th>
			<td>
				<input class="form-control" value="${authMember.empNo }" disabled />
			</td>
		</tr>
		<tr>
			<th>일시</th>
			<td>
        <div style="display: inline-block;">
            <form:input path="vrStartTs" class="form-control" type="date" />
            <form:errors path="vrStartTs" class="error" />
        </div>
        ~
        <div style="display: inline-block;">
            <form:input path="vrEndTs" class="form-control" type="date" />
            <form:errors path="vrEndTs" class="error" />
        </div>
    </td>
		</tr>
		<tr>
			<th>휴가유형</th>
			<td>
		        <form:select id="vrTypeSelect" path="vrType" class="form-control">
		            <form:option value="">-- 선택하세요 --</form:option>
		            <form:option value="SK">병가</form:option>
		            <form:option value="PD">공가</form:option>
		            <form:option value="AL">연차</form:option>
		            <form:option value="UP">무급</form:option>
		            <form:option value="FE">경조사</form:option>
		            <form:option value="PL">출산</form:option>
		        </form:select>
		        <form:errors path="vrType" class="error" />
		    </td>
		</tr>
		
		<tr>
		    <th>사유</th>
		    <td>
		        <form:input path="vrRsn" class="form-control" /> 
				<form:errors path="vrRsn" class="error" />
		    </td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:right;">
				<input class="btn gray_btn" id="autoFillButton" type="button" value="자동 생성">
				<input class="btn btn-secondary" type="submit" value="저장"> 
				<input class="btn btn-light" type="reset" value="취소">
			</td>
		</tr>
	</table>
</form:form>



