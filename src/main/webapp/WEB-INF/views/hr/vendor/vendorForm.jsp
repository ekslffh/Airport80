<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.card-body {
	padding: 25px 30px 30px 35px;
}

hr {
	border: 0.5px solid #000; /* 가로 구분선의 스타일을 설정합니다. */
	margin: 13px 0; /* 위 아래 여백을 조정합니다. */
}
th {
            border-right: 1px solid #ccccccad; /* 각 열 사이에 세로 구분선 스타일 추가 */
            padding: 5px;
            vertical-align : middle;
            text-align: center; 
        }
</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header"
						style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">계정 등록</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i
										class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">등록</a></li>
								<li class="breadcrumb-item active">입점사</li>
							</ol>
						</nav>
					</div>
				    <!-- 게시판 헤더 영역 끝 -->

					<div style="display: flex; justify-content: center; align-items: center;">
						<div style="width: 800px;">
						
					<div class="card-body">	
					<input class="btn gray_btn" id="autoFillButton" type="button" value="자동 생성" onclick="autofillButton()">
					<form:form method="post" modelAttribute="vendor" id="vendorForm">
						<div style="text-align:center; height:65px;">
							<h3><b>입점 업체 등록</b></h3>
						</div>
						<hr style="margin:0px;">
						<table class="table table-border">
							<tr>
								<th><spring:message code="vendor.vendNm" /></th>
								<td colspan="3" style="padding: 9px 0px 9px 15px;">
									<form:input path="vendNm" class="form-control" maxlength="15" style="width:250px;" />
									<form:errors path="vendNm" class="error" />
								</td>
							</tr>
							<tr>
								<th>담당자</th>
								<td colspan="3" style="padding: 9px 0px 9px 15px;">
									<form:input path="vendOwner" class="form-control" maxlength="10" style="width:250px;" />
									<form:errors path="vendOwner" class="error" />
								</td>
							</tr>
							<tr>
								<th><spring:message code="vendor.vendContact" /></th>
								<td colspan="3" style="padding: 9px 0px 9px 15px;">
									<form:input path="vendContact" class="form-control" maxlength="15" style="width:250px;" />
									<form:errors path="vendContact" class="error" />
								</td>
							</tr>
							
							
							<tr>
								<th>운영시작시간</th>
								<td style="padding: 9px 0px 9px 15px;">
									<form:input path="vendOpHours" class="form-control" type="time" style="width:230px;" />
									<form:errors path="vendOpHours" class="error" />
								</td>
								<th style = "border-left: 1px solid #ccccccad; /* 각 열 사이에 세로 구분선 스타일 추가 */
								            padding: 5px;
								            vertical-align : middle;
								            text-align: center; ">
								            <spring:message code="vendor.vendClHours" /></th>
								<td style="padding: 9px 0px 9px 15px;">
									<form:input path="vendClHours" class="form-control" type="time" style="width:230px;" />
									<form:errors path="vendClHours" class="error" />
								</td>
							</tr>
							<tr>
								
							</tr>
							<tr>
								<th><spring:message code="vendor.vendLoc" /></th>
								<td style="padding: 9px 0px 9px 15px;">
									<form:input path="vendLoc" class="form-control" style="width:230px;" />
									<form:errors path="vendLoc" class="error" />
								</td>
								<th style = "border-left: 1px solid #ccccccad; /* 각 열 사이에 세로 구분선 스타일 추가 */
											padding: 5px;
											vertical-align : middle;
											text-align: center; ">층수</th>
								<td style="padding: 9px 0px 9px 15px;">
									<form:select id="vendFloor" path="vendFloor" class="form-control" style="width:230px;">
										<form:option value="">-- 선택하세요 --</form:option>
										<form:option value="1">1층</form:option>
										<form:option value="2">2층</form:option>
									</form:select>
									<form:errors path="vendFloor" class="error" />	
								</td>
							</tr>
							<tr>
								<th><spring:message code="vendor.vendMvp" /></th>
								<td colspan="3" style="padding: 9px 0px 9px 15px;">
									<form:input path="vendMvp" class="form-control" maxlength="30" />
									<form:errors path="vendMvp" class="error" />
								</td>
							</tr>
							<tr>
								<th>업체 <spring:message code="vendor.vendType" /></th>
								<td colspan="3" style="padding: 9px 0px 9px 15px;">
									<form:select id="vendType" path="vendType" class="form-control" style="width:250px;">
										<form:option value="">-- 선택하세요 --</form:option>
										<form:option value="3001">식품(식당)</form:option>
										<form:option value="3002">뷰티</form:option>
										<form:option value="3003">명품</form:option>
										<form:option value="3004">전자제품</form:option>
										<form:option value="3005">패션</form:option>
										<form:option value="3006">주류·담배</form:option>
									</form:select>
									<form:errors path="vendType" class="error" />
								</td>
							</tr>
							
							<tr>
								<th><spring:message code="vendor.vendDesc" /></th>
								<td colspan="3" style="padding: 9px 0px 9px 15px;">
									<form:input path="vendDesc" class="form-control" />
									<form:errors path="vendDesc" class="error" />
								</td>
							</tr>
						</table>
						
						<div style="text-align: right; height: 100px; padding: 10px 0px 20px 20px; width: 701px;">
							<input class="btn btn-dark" type="reset" value="취소"> 
							<a class="btn gray_btn" href="<c:url value='/hr/emp/empList.do'/>">목록</a> 
							<input class="btn btn-primary" type="submit" value="등록">
						</div>						
					</form:form>
						</div>
						</div>
					</div>
				</div>
         </div>
      </div>
   </div>
</section>

<script>
document.addEventListener("DOMContentLoaded", function() {
	   const autofillButton = document.getElementById("autoFillButton"); // 버튼 ID를 "autoFillButton"로 수정

	   autofillButton.addEventListener("click", function() {
	      const vendNmInput = document.querySelector('input[name="vendNm"]'); // input 요소를 선택하도록 수정
	      const vendOwnerInput = document.querySelector('input[name="vendOwner"]'); // input 요소를 선택하도록 수정
	      const vendContactInput = document.querySelector('input[name="vendContact"]'); // input 요소를 선택하도록 수정
	      const vendOpHoursInput = document.querySelector('input[name="vendOpHours"]'); // input 요소를 선택하도록 수정
	      const vendClHoursInput = document.querySelector('input[name="vendClHours"]'); // input 요소를 선택하도록 수정
	      const vendLocInput = document.querySelector('input[name="vendLoc"]'); // input 요소를 선택하도록 수정
	      const vendFloorInput = document.querySelector('select[name="vendFloor"]'); // select 요소를 선택하도록 수정
	      const vendMvpInput = document.querySelector('input[name="vendMvp"]');
	      const vendDescInput = document.querySelector('input[name="vendDesc"]');
	      const vendTypeInput = document.querySelector('select[name="vendType"]');

	      // 각 필드에 값을 설정
	      vendNmInput.value = "화평본가";
	      vendOwnerInput.value = "박은수";
	      vendContactInput.value = "01056891253";
	      vendOpHoursInput.value = "07:30";
	      vendClHoursInput.value = "21:30";
	      vendLocInput.value = "1GC";
	      vendFloorInput.value = "1";
	       
	      vendMvpInput.value = "갈비, 차돌된장찌개, 물냉면, 감자만두"
	      vendDescInput.value = "직접 만든 양념으로 담근 갈비가 정말 맛있음";
	      vendTypeInput.value = "3001";
	   });
	});
</script>

