
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


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
								<li class="breadcrumb-item active">신규 직원</li>
							</ol>
						</nav>
					</div>

					<div style="display: flex; justify-content: center; align-items: center;">
						<!-- <div class="card" style="width:800px;"> -->
						<div style="width: 800px;">

							<div class="card-body">
								<input class="btn gray_btn" id="autoFillButton" type="button" value="자동 생성" onclick="autofillButton()">
								<form:form method="post" modelAttribute="emp" id="empForm" enctype="multipart/form-data">
									<div style="text-align: center; height: 65px;">
										<h3>
											<b>직원 계정 생성</b>
										</h3>
									</div>
									<hr style="margin:0px;">
									<table class="table table-border">
										<tr>
											<th><spring:message code="emp.empNm" /></th>
											<td style="padding: 9px 0px 9px 15px;">
											<form:input path="empNm" class="form-control"
													maxlength='10' style="width:200px;" /> 
											<form:errors
													path="empNm" class="error" /></td>
										</tr>
										<tr>
											<th><spring:message code="emp.empBir" /></th>
											<td style="padding: 9px 0px 9px 15px;"><form:input path="empBir" class="form-control"
													type="date" style="width:200px;" /> <form:errors
													path="empBir" class="error" /></td>
										</tr>
										<tr>
											<th><spring:message code="emp.empContact" /></th>
											<td style="padding: 9px 0px 9px 15px;"><form:input path="empContact" class="form-control"
													maxlength='15' style="width:200px;" /></td>
										</tr>
										<tr>
											<th><spring:message code="emp.empGender" /></th>
											<td style="padding: 9px 0px 9px 15px;">
												<label>
										            <input type="radio" name="empGender" value="F" id="femaleRadio" /> 여성 <br>
										        </label>
										        <label>
										            <input type="radio" name="empGender" value="M" id="maleRadio" /> 남성
										        </label>
											</td>
										</tr>

										<tr>
											<th><spring:message code="emp.empEmail" /></th>
											<td style="padding: 9px 0px 9px 15px;">
												<div style="display: flex; align-items: center;">
													<form:input path="empEmail" class="form-control"
														style="width:200px;" />
													&nbsp; @ &nbsp;
													<form:select id="empEmailDo" path="empEmailDo"
														class="form-control" style="width:200px;">
														<form:option value="">-- 이메일 주소 --</form:option>
														<form:option value="naver.com">naver.com</form:option>
														<form:option value="daum.net">daum.net</form:option>
														<form:option value="gmail.com">gmail.com</form:option>
														<form:option value="kakao.com">kakao.com</form:option>
														<form:option value="hanmail.net">hanmail.net</form:option>
													</form:select>
												</div>
											</td>
										</tr>
										<tr>
											<th>우편번호</th>
											<td style="display: flex; align-items: center; padding: 9px 0px 9px 15px;"><form:input
													id="emp_post" path="empPost" class="form-control"
													style="width:200px;" /> &nbsp;&nbsp; <input
												class="btn btn-light btn-sm" onclick="findAddr()"
												value="주소찾기" style="width: 66px;"> <form:errors
													path="empPost" class="error" /></td>
										</tr>
										<tr>
											<th>주소</th>
											<td style="padding: 9px 0px 9px 15px;"><form:input id="emp_addr" path="empAddr"
													class="form-control" /></td>
										</tr>
										<tr>
											<th>상세 주소</th>
											<td style="padding: 9px 0px 9px 15px;"><form:input path="empDetailAddr"
													class="form-control" style="width:200px;" /></td>
										</tr>
										<tr>
											<th><spring:message code="emp.empJoinDt" /></th>
											<td style="padding: 9px 0px 9px 15px;"><form:input path="empJoinDt" class="form-control"
													type="date" style="width:200px;" /></td>
										</tr>

										<tr>
											<th><spring:message code="emp.empDeptNo" /></th>
											<td style="padding: 9px 0px 9px 15px;"><form:select id="empDeptSelect" path="empDeptNo"
													class="form-control" style="width:200px;">
													<form:option value="">-- 선택하세요 --</form:option>
													<form:option value="1201">사무</form:option>
													<form:option value="1202">운영</form:option>
													<form:option value="1203">보안</form:option>
													<form:option value="1204">인프라</form:option>
												</form:select></td>
										</tr>
										<tr id="subDeptRow">
											<th><spring:message code="emp.empTeam" /></th>
											<td style="padding: 9px 0px 9px 15px;"><form:select path="empTeam" class="form-control"
													style="width:200px;">
													<form:option value="1">-- 선택하세요 --</form:option>
													<form:option value="31">인사</form:option>
													<form:option value="32">회계</form:option>
												</form:select></td>
										</tr>
										<tr>
											<th><spring:message code="emp.empRoleNm" /></th>
											<td style="padding: 9px 0px 9px 15px;"><form:select path="empRoleNm" class="form-control"
													style="width:200px;">
													<form:option value="">--선택하세요--</form:option>
													<form:option value="사원">사원</form:option>
													<form:option value="주임">주임</form:option>
													<form:option value="대리">대리</form:option>
													<form:option value="과장">과장</form:option>
													<form:option value="차장">차장</form:option>
													<form:option value="부장">부장</form:option>
												</form:select></td>
										</tr>
										<tr>
											<th>거래 은행</th>
											<td style="padding: 9px 0px 9px 15px;"><form:select id="empAccbank" path="empAccbank"
													class="form-control" style="width:200px;">
													<form:option value="">-- 선택하세요 --</form:option>
													<form:option value="우리">우리</form:option>
													<form:option value="하나">하나</form:option>
													<form:option value="국민">국민</form:option>
													<form:option value="기업">기업</form:option>
													<form:option value="농협">농협</form:option>
													<form:option value="경남">경남</form:option>
													<form:option value="수협">수협</form:option>
													<form:option value="대구">대구</form:option>
													<form:option value="부산">부산</form:option>
													<form:option value="전북">전북</form:option>
												</form:select></td>
										</tr>
										<tr>
											<th>계좌 번호</th>
											<td style="padding: 9px 0px 9px 15px;"><form:input path="empAccnum" class="form-control"
													style="width:200px;" /></td>
										</tr>
										<tr>
											<th>프로필</th>
											<td style="padding: 9px 0px 9px 15px;"><input type="file" name="empFiles" multiple /></td>
										</tr>
									</table>

									<div style="text-align: right; height: 100px; padding: 10px 0px 20px 20px; width: 701px;">
										<input class="btn btn-primary" type="submit" value="등록">
										<input class="btn btn-dark" type="reset" value="취소"> 
										<a class="btn gray_btn" href="<c:url value='/hr/emp/empList.do'/>">목록</a> 
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


<!-- 값 자동 입력 버튼  -->
<script>
document.addEventListener("DOMContentLoaded", function() {
	   const autofillButton = document.getElementById("autoFillButton"); // 버튼 ID를 "autoFillButton"로 수정

	   autofillButton.addEventListener("click", function() {
	      const empNmInput = document.querySelector('input[name="empNm"]'); // input 요소를 선택하도록 수정
	      const empBirInput = document.querySelector('input[name="empBir"]'); // input 요소를 선택하도록 수정
	      const empEmailInput = document.querySelector('input[name="empEmail"]'); // input 요소를 선택하도록 수정
	      const empContactInput = document.querySelector('input[name="empContact"]'); // input 요소를 선택하도록 수정
	      const empJoinDtInput = document.querySelector('input[name="empJoinDt"]'); // input 요소를 선택하도록 수정
	      const empAccNumInput = document.querySelector('input[name="empAccnum"]'); // input 요소를 선택하도록 수정
	      const empAccBankInput = document.querySelector('select[name="empAccbank"]'); // select 요소를 선택하도록 수정
	      const empEmailDoInput = document.querySelector('select[name="empEmailDo"]');
	      const empDetailAddrInput = document.querySelector('input[name="empDetailAddr"]');
	      const maleRadio = document.getElementById("maleRadio");
	      const femaleRadio = document.getElementById("femaleRadio");

	      femaleRadio.checked = true;
	      
	      // 각 필드에 값을 설정
	      empNmInput.value = "김공항";
	      empBirInput.value = "1998-10-25";
	      empEmailInput.value = "echo0913";
	      empContactInput.value = "01045892563";
	      empJoinDtInput.value = "2020-05-06";
	      empAccNumInput.value = "33335681205";
	      empAccBankInput.value = "우리"; // 선택 옵션 값으로 설정
	      empEmailDoInput.value="naver.com";
	      empDetailAddrInput.value="2번길 43";
	   });
	});
</script>

<script type="text/javascript">
	$(subDeptRow).hide();
	$(empDeptSelect).on('change', function() {
		const deptNo = $(empDeptSelect).val();
		if (deptNo == '1201') {
			console.log("same")
			$(subDeptRow).show();
		} else {
			$(subDeptRow).hide();
		}
	});
</script>

<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {

				console.log(data);

				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var jibunAddr = data.jibunAddress; // 지번 주소 변수
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('emp_post').value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById("emp_addr").value = roadAddr;
				} else if (jibunAddr !== '') {
					document.getElementById("emp_addr").value = jibunAddr;
				}
			}
		}).open();
	}
</script>