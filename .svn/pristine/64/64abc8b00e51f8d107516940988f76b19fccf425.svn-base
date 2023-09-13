<!-- 직원 휴가 일수 리스트  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    

<br>
<div class="info" style="width:412px; padding:3px 1px 0px 15px;">
	<p class="cofistooltip">
		<i class="bi bi-exclamation-circle-fill" ></i> 
		<span data-bs-toggle="tooltip" data-bs-placement="top" 
		title="3개월뒤 자동 '폐기' 상태가 됩니다. 이후 폐기사진 첨부 후 '완료'처리 바랍니다.">휴가 잔여 일수 확인</span>
	</p>
	<p class="reason">휴가 결재가 승인된 일정만 등록됩니다.</p>
</div>

<div style="overflow-y: scroll; height: 313px;" class="req-body">
<table class="table table-hover">
	<thead style="text-align:center">
		<tr>
			<th></th>
			<th class="table-light">병가</th>
			<th class="table-light">공가</th>
			<th class="table-light">연차</th>
			<th class="table-light">출산</th>
			<th class="table-light">경조사</th>
			<th class="table-light">무급</th>
<!-- 			<th class="table-light">지급연가</th> -->
		</tr>
	</thead>
	<tbody>
		<c:set var="elList" value="${paging.dataList }" />
		<c:forEach items="${elList}" var="elList">
			<tr>
			    <td class="table-light">${elList.empNm}</td>
			    <td>${elList.elUseSk == 0 ? '-' : elList.elUseSk}</td>
			    <td>${elList.elUsePd == 0 ? '-' : elList.elUsePd}</td>
			    <td>${elList.elUseAl == 0 ? '-' : elList.elUseAl}</td>
			    <td>${elList.elUsePl == 0 ? '-' : elList.elUsePl}</td>
			    <td>${elList.elUseFe == 0 ? '-' : elList.elUseFe}</td>
			    <td>${elList.elUseUp == 0 ? '-' : elList.elUseUp}</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="8">
				<div class="d-flex justify-content-center mb-3">
				${paging.pagingHTML }
				</div>
			</td>
		</tr>
	</tfoot>
</table>
</div>