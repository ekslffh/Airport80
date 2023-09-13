<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

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
								<li class="breadcrumb-item active">항공사</li>
							</ol>
						</nav>
					</div>
                
                
<div style="display: flex; justify-content: center; align-items: center; ">
    <div style="width: 800px;">
		
<div class="card-body">
<input class="btn gray_btn" id="autoFillButton" type="button" value="자동 생성" onclick="autofillButton()">
<form:form method="post" modelAttribute="airline">
	<div style="text-align: center; height:65px;">
		<h3><b>항공사 등록</b></h3>
	</div>
	<hr style="margin:0px;">
	<table class="table table-border">
		<tr>
			<th><spring:message code="airline.alKnm" /></th>
			<td style="padding: 9px 0px 9px 15px;">
				<form:input path="alKnm" class="form-control" style="width:250px;" maxlength='10'/>
				<form:errors path="alKnm" class="error" />
			</td>
			<th style = "border-left: 1px solid #ccccccad; /* 각 열 사이에 세로 구분선 스타일 추가 */
						padding: 15px;
						vertical-align : middle;
						text-align: center; ">
				<spring:message code="airline.alEnm" /></th>
			<td style="padding: 9px 0px 9px 15px;">
				<form:input path="alEnm" class="form-control" style="width:250px;" maxlength='20'/>
				<form:errors path="alEnm" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alCd" /></th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;" >
				<form:input path="alCd" style="width:250px;" class="form-control" />
				<form:errors path="alCd" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alCountry" /></th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;">
				<form:input path="alCountry" style="width:250px;" class="form-control" maxlength='30' />
				<form:errors path="alCountry" class="error" />
			</td>
		</tr>
		
		<tr>
			<th><spring:message code="airline.alCounCd" /></th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;">
				<form:input path="alCounCd" style="width:250px;" class="form-control" maxlength='10'/>
				<form:errors path="alCounCd" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alFlag" /></th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;">
		        <label>
			        <form:radiobutton path="alFlag" value="국적 항공사" id="inRadio" /> 국내 <br>
			    </label>
				<label>
			        <form:radiobutton path="alFlag" value="외항사" id="outRadio" /> 국외
			    </label>
		        <form:errors path="alFlag" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alScale" /></th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;">
				<form:select path="alScale" class="form-control" style="width:250px;">
		            <form:option value="">-- 선택하세요 --</form:option>
		            <form:option value="FSC">FSC</form:option>
		            <form:option value="LCC">LCC</form:option>
		            <form:option value="Cargo">Cargo</form:option>
		        </form:select>
		        <form:errors path="alScale" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alHead" /></th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;">
				<form:input path="alHead" style="width:250px;" class="form-control" maxlength='20'/>
				<form:errors path="alHead" class="error" />
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
	      const alKnmInput = document.querySelector('input[name="alKnm"]'); // input 요소를 선택하도록 수정
	      const alEnmInput = document.querySelector('input[name="alEnm"]'); // input 요소를 선택하도록 수정
	      const alCdInput = document.querySelector('input[name="alCd"]'); // input 요소를 선택하도록 수정
	      const alCountryInput = document.querySelector('input[name="alCountry"]'); // input 요소를 선택하도록 수정
	      const alCounCdInput = document.querySelector('input[name="alCounCd"]'); // input 요소를 선택하도록 수정
	      const alScaleInput = document.querySelector('select[name="alScale"]'); // input 요소를 선택하도록 수정
	      const alHeadInput = document.querySelector('input[name="alHead"]'); // select 요소를 선택하도록 수정
	      const inRadio = document.getElementById("inRadio");
	      const outRadio = document.getElementById("outRadio");

	      inRadio.checked = true;
	      
	      // 각 필드에 값을 설정
	      alKnmInput.value = "테스트 항공";
	      alEnmInput.value = "TEST AIRLINE";
	      alCdInput.value = "T1";
	      alCountryInput.value = "대한민국";
	      alCounCdInput.value = "KR";
	      alScaleInput.value = "FSC";
	      alHeadInput.value = "대한민국 대전광역시"; // 선택 옵션 값으로 설정
	      alFlagInput.value="국내";
	      
	   });
	});
</script>