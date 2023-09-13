<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<security:authentication property="principal.realUser" var="authMember" />
<script src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<form:form method="post" modelAttribute="bn" enctype="multipart/form-data"> 
	<form:hidden path="bnNo" value="${bnNo }" />
	<form:hidden path="atchFileId" value="${atchFileId }" />
	
	<style>

    .bnno{
		color: red;
	}
	      .table th {
    white-space: nowrap;
	width: 200px;

  }
</style>


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    




					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<h5 class="card-tit">모집공고 수정</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">입점</a></li>
					        <li class="breadcrumb-item ">모집공고</li>
					        <li class="breadcrumb-item active">공고 수정(<span class="bnno">${bn.bnNo }</span>)</li>
					      </ol>
					    </nav>
					<div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							등록된 모집공고를 수정할 수 있습니다. </span>
						</p>
					</div>									    
	

	
	<table class="table table-border">

		<tr>
		<th class="table-light">모집 이미지</th>
		<td>
			<input type="file" name="bnFiles" multiple />
		</td>
		</tr>
		
		<tr>
			<th class="table-light">공고 제목</th>
			<td>
			<form:input path="bnTitle" class="form-control" /> 
			<form:errors path="bnTitle" class="error" /></td>
		</tr>
		<tr>
			<th class="table-light">모집 위치</th>
			<td>
			<form:input path="bnEnterLoc" class="form-control" /> 
			<form:errors path="bnEnterLoc" class="error" /></td>
		</tr>
<!-- 		<tr> -->
<!-- 			<th>모집 위치</th> -->

<!-- 			<td> -->
<%-- 				<form:select path="liCtgr" class="form-select"> --%>
<%-- 					<form:option value="" label="" /> --%>
<%-- 					<form:options items="${commonList }" itemLabel="codeNm" itemValue="codeNm"/> --%>
<%-- 				</form:select> --%>
<%-- 				<form:errors path="liCtgr" class="error" /> --%>
<!-- 			</td> -->
<!-- 		</tr> -->

<tr>
			<th class="table-light">운영시간</th>
			<td><form:input path="bnStartTime" type="time" id="startTime" class="form-control custom-input-size" style="display: inline-block; width: auto;"/> 부터
				<form:input path="bnEndTime" type="time" id="endTime" class="form-control custom-input-size" style="display: inline-block; width: auto;"/> 까지
			</td>
		</tr>
		

		<tr>
			<th class="table-light">금액(원)</th>
			<td><form:input path="bnAmt" class="form-control" id="amountInput"  maxlength="11"/> <form:errors
					path="bnAmt" class="error" /></td>
		</tr>
		<tr>
			<th class="table-light">마감일</th>
			<td>
			<form:input path="bnDeadline" class="form-control" type="date"/> 
			<form:errors path="bnDeadline" class="error" />
			</td>
		</tr>
		
		<tr>
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
			<td colspan="2" style="text-align: right; margin-top: 10px;">
				<input class="btn btn-primary" type="submit" value="저장" /> 
			<a href="<c:url value="/operate/bidNotice/bnList.do" />" class="btn btn-secondary">취소</a>
			</td>
		</tr>
	</table>
	
			</div>
			</div>
			</div>
		</div>
	</div>
</section>
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
</script>


