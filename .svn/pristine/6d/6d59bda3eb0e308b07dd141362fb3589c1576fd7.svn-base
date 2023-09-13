<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<br>
<table class="table table-bordered" class="drop-target" ondrop="handleDrop(event)" ondragover="allowDrop(event)">
	<tr>
		<th class="table-light">사번</th>
		<td>${vacreq.vrEmpNo}</td>
		<th class="table-light">신청자</th>
		<td colspan="4">${vacreq.empNm }</td>
		<th class="table-light">휴가 유형</th>
		<td>
			 <c:choose>
			    <c:when test="${vacreq.vrType == 'SK'}">병가</c:when>
			    <c:when test="${vacreq.vrType == 'PD'}">공가</c:when>
			    <c:when test="${vacreq.vrType == 'AL'}">연차</c:when>
			    <c:when test="${vacreq.vrType == 'PL'}">출산</c:when>
			    <c:when test="${vacreq.vrType == 'FE'}">경조사</c:when>
			    <c:when test="${vacreq.vrType == 'UP'}">무급</c:when>
			</c:choose>				
		</td>
	</tr>
	<tr style="vertical-align : middle;">
		<th class="table-light">일시</th>
		<td colspan="6">${vacreq.vrStartTs } ~ ${vacreq.vrEndTs }</td>
		<th class="table-light">일수</th>
		<td style="vertical-align : middle;">${vacreq.vrPeriod }일</td>
	</tr>
	<tr>
		<th class="table-light" colspan="2">사유</th>
		<td colspan="7">${vacreq.vrRsn }</td>
	</tr>
</table> 
<hr>
<br>
<form:form method="post" modelAttribute="vacreq" id="statusForm">		
	<form:hidden path="vrId" id="hiddenVrId" value="${vacreq.vrId }"/>
	<form:hidden path="vrEmpNo" value="${vacreq.vrEmpNo }" />
	<form:hidden path="vrType" value="${vacreq.vrType }" />
	<form:hidden path="vrPeriod" value="${vacreq.vrPeriod }" />
	
	<div class="row mb-3">
		<label for="inputPassword3" class="col-sm-2 col-form-label" style="font-weight: bold; items-align:center;">상태</label>
		<div class="col-sm-10">
		   <label>
			    <form:radiobutton path="vrStatus" value="APPR" /> 승인
			</label>
			<label>
			    <form:radiobutton path="vrStatus" value="REJ" /> 반려
			</label>
		</div>
	</div>
	<div class="row mb-3" id="reasonDiv" style="display:none;" >
		<label for="inputPassword3" class="col-sm-2 col-form-label" style="font-weight: bold;">반려<br>사유</label>
		<div class="col-sm-10">
			<form:textarea class="form-control" type="text" path="vrRejRsn" placeholder="반려 사유를 입력해주세요"/>
		</div>
	</div>
	<div class="text-center">
		<input id="statusBtn" type="button" class="btn btn-primary" data-dismiss="modal" value="결재" />
		<button type="reset" class="btn btn-secondary">취소</button>
	</div>
</form:form>








<script>
    // 반려 버튼 클릭 시 "반려 사유" 입력란을 표시
    $('input[name="vrStatus"]').on('click', function() {
        if ($(this).val() === 'REJ') {
            $('#reasonDiv').show(); // 반려 버튼일 경우 보이게 함
        } else {
            $('#reasonDiv').hide(); // 다른 버튼일 경우 숨김
        }
    });

    // 페이지 로딩 시 초기 상태 설정
    $(document).ready(function() {
        if ($('input[name="vrStatus"]:checked').val() === 'REJ') {
            $('#reasonDiv').show(); // 초기 선택이 반려 버튼일 경우 보이게 함
        }
    });
</script>





