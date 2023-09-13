<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->

<security:authentication property="principal.realUser" var="authMember" />
<script src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<form:form method="post" modelAttribute="bn" enctype="multipart/form-data"> 
	<form:hidden path="bnNo" value="${bnNo }" />
	<form:hidden path="atchFileId" value="${atchFileId }" />
<style>
	th{
		width: 200px;
	}


</style>


<div class="card">
	<div class="card-header" style="padding: 9px 15px 9px; color: #787878; background: #c5d0e3; color: white; font-size: 19px;">모집공고 등록
	&nbsp;
		<i class="bi bi-file-text" id="autoFillIcon" style="cursor: pointer; color:black";></i>
	</div>
	<div class="card-body"  style="height: 400px;">	
	
	
	<table class="table table-bordered" style=" margin-top:10px;">

		
		<tr>
			<th class="table-light">공고 제목</th>
			<td colspan="3">
			<form:input path="bnTitle" class="form-control" /> 
			<form:errors path="bnTitle" class="error" /></td>
		</tr>
		
		
		<tr>
			<th class="table-light">모집 위치</th>
			<td colspan="3">
			<form:input path="bnEnterLoc" class="form-control" /> 
			<form:errors path="bnEnterLoc" class="error" /></td>
		</tr>

		<tr>
			<th class="table-light">운영시간</th>
			<td colspan="3"><form:input path="bnStartTime" type="time" id="startTime" class="form-control custom-input-size" style="display: inline-block; width: auto;"/> 부터
				<form:input path="bnEndTime" type="time" id="endTime" class="form-control custom-input-size" style="display: inline-block; width: auto;"/> 까지
			</td>
		</tr>

		<tr>
			<th class="table-light">금액(원)</th>
			<td colspan="3"><form:input path="bnAmt" class="form-control" id="amountInput" name="bnAmtString" maxlength="11"/> </td>
		</tr>
		
		<tr>
			<th class="table-light">마감일</th>
			<td>
			<form:input path="bnDeadline" class="form-control" type="date"/> 
			<form:errors path="bnDeadline" class="error" />
			</td>

			<th class="table-light">상태</th>
			<td>
				<form:select path="bnStatus" class="form-select">
					<form:option value="" label="" />
					<form:options items="${bidstuList }" itemLabel="codeNm" itemValue="codeNm"/>
				</form:select>
				<form:errors path="bnStatus" class="error" />
			</td>
		</tr>
		
	<tr>
		<th class="table-light">위치 이미지</th>
		<td colspan="3">
			<input type="file" name="bnFiles" multiple />
		</td>
	</tr>
		
		
	</table>
			<div colspan="2" style="text-align: right; margin-top: 10px;">
				<input class="btn btn-primary" type="submit" value="등록" /> 
	<a href="<c:url value="/operate/bidNotice/bnList.do" />" class="btn btn-secondary">취소</a></div>
</div>
</div>
	
</form:form>


<script>
    const amountInput = document.getElementById('amountInput');

    // 입력 필드에 입력이 발생할 때마다 세 자리마다 쉼표를 추가하는 함수
    amountInput.addEventListener('input', function(event) {
        const value = event.target.value.replace(/,/g, ''); // 이전에 추가된 쉼표 제거
        event.target.value = formatAmount(value); // 세 자리마다 쉼표를 추가하여 설정
    });

    // 세 자리마다 쉼표를 추가하는 함수
    function formatAmount(value) {
        const parts = [];
        while (value.length > 3) {
            parts.unshift(value.slice(-3));
            value = value.slice(0, -3);
        }
        if (value.length > 0) {
            parts.unshift(value);
        }
        return parts.join(',');
    }
    


    $(document).ready(function() {
        const autoFillIcon = $("#autoFillIcon");

        autoFillIcon.click(function() {
            $("input[name='bnTitle']").val("1층 일반구역 B부근 입점업체를 모집합니다");
            $("input[name='bnEnterLoc']").val("1층 일반구역 B부근");
            $("input[name='bnStartTime']").val("08:00"); // 올바른 시간 형식으로 설정
            $("input[name='bnEndTime']").val("22:00"); // 올바른 시간 형식으로 설정
            $("input[name='bnDeadline']").val("2023-09-13");
            $("select[name='bnStatus']").val("모집중");
            $("input[name='bnAmt']").val("100,000,000");
        });
    });
    </script>





