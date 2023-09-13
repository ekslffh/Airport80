<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<security:authentication property="principal.realUser" var="authMember" />

<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #333;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            margin-top:50px ;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="datetime-local"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>


	<div class="card">
		<div class="card-body">
			<h5 class="card-title" style="font-weight: 600;">추가예산신청</h5>
			<form:form
				action="${pageContext.request.contextPath}/accounting/budgetrequest/insert.do"
				method="post" modelAttribute="budgetReq">

				<!--    이걸 따라하시오 -->
				<div class="row mb-3">
					<label for="bgRUseTs" class="col-sm-3 col-form-label">예산 사용 일정:</label>
					<div class="col-sm-8">
						<input type="datetime-local" id="bgRUseTsInput"
							onchange="setHiddenValue()" class="form-select" />
					</div>
				</div>
				<br>

				<!-- 숨겨진 필드 -->
				<form:input type="hidden" id="bgRUseTsWithoutT" path="bgRUseTs" />

				<!--     <label for="bgRAmt">예산 신청 금액(10,000 원 이상):</label> -->
				<%--     <form:input type="number" path="bgRAmt" required="true"/><br> --%>

				<div class="row mb-3">
					<label for="bgRAmt" class="col-sm-3 col-form-label">예산 신청
						금액:<br>(10,000 원 이상)
					</label>
					<div class="col-sm-8">
						<input type="text" class="form-select" id="money"
							placeholder="금액을 입력하세요" onkeyup="inputNumberFormat(this);"
							onchange="updateHiddenValue();" />
					</div>
				</div>
				<form:input type="hidden" path="bgRAmt" id="hiddenAmt"
					required="true" />
				<div class="row mb-3">
					<label for="acaId" class="col-sm-3 col-form-label">예산 신청
						항목:</label>
					<div class="col-sm-8">
						<form:select path="acaId" class="form-select">
							<form:options items="${accountCategories}" itemValue="acaId"
								itemLabel="acaNm" />
						</form:select>
					</div>
				</div>
				<div class="row mb-3">
					<label for="bgRRsn" class="col-sm-3 col-form-label">예산 신청
						사유:</label>
					<div class="col-sm-8">
						<form:textarea class="form-control" path="bgRRsn" rows="4"
							cols="50" />
						<br>
					</div>
				</div>
				<form:input type="hidden" path="empEmpNo" value="${empNo}"
					required="true" />
				<br>

				<div class="text-center">
					<button id="submitButton" type="submit" class="btn btn-primary">신청</button>
					<button type="reset" class="btn btn-secondary">지우기</button>
				</div>
			</form:form>

		</div>
	</div>




<script>

const input = document.querySelector('#money');
input.addEventListener('keyup', function(e) {
  let value = e.target.value;
  value = Number(value.replaceAll(',', ''));
  if(isNaN(value)) {         //NaN인지 판별
    input.value = 0;   
  }else {                   //NaN이 아닌 경우
    const formatValue = value.toLocaleString('ko-KR');
    input.value = formatValue;
  }
})

function updateHiddenValue() {
    var moneyInput = document.getElementById('money');
    var hiddenInput = document.getElementById('hiddenAmt');
    var value = moneyInput.value.replace(/,/g, ''); // 포맷된 값을 쉼표 제거
    hiddenInput.value = value;
}

window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    var message = urlParams.get("message");
    
    if (message !== null && message !== "") {
        alert(message);
    }
};

function setHiddenValue() {
    var bgRUseTsInput = document.getElementById('bgRUseTsInput');
    var bgRUseTsWithoutT = document.getElementById('bgRUseTsWithoutT');

    // 입력 필드의 값 가져오기
    var inputValue = bgRUseTsInput.value;

    // "T"를 제외한 날짜-시간 문자열 추출
    var dateTimeWithoutT = inputValue.replace("T", " ");
    // 숫자만 남기도록 정규식을 사용하여 처리
    var numericValue = dateTimeWithoutT.replace(/\D/g, "");
    // 숨겨진 필드의 값 설정
    bgRUseTsWithoutT.value = dateTimeWithoutT;
}

</script>