 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script
	src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<form:form method="post" modelAttribute="ba"
	enctype="multipart/form-data">
	<form:hidden path="baId" value="${baId }" />
	<form:hidden path="atchFileId" value="${atchFileId }" />


	<style>
.table-title {
	font-size: 30px;
	margin-bottom: 10px;
	color: deepskyblue;
}
.btn {
    width: 60px; /* 또는 필요한 너비 값으로 설정 */

  }
 
 
 
 
 
 
</style>

	<div class="table-title">입찰 신청 <i class="bi bi-file-text" id="autoFillIcon" style="cursor: pointer; color:black";></i></div>



	<table class="table table-border">

		<tr>
			<th>공고번호</th>
			<td><form:input path="baBnNo" name="bnNo" class="form-control" readonly="true"
					value="${bn.bnNo }" /> <form:errors path="baBnNo" class="error" /></td>
		</tr>
		<tr>
			<th>위치</th>
			<td><form:input path="baReqSpace" name="bnEnterLoc"
					class="form-control" readonly="true" value="${bn.bnEnterLoc }" /> <form:errors
					path="baReqSpace" class="error" /></td>
		</tr>

		<tr>
			<th>업체이름</th>
			<td><form:input path="baCoNm" class="form-control" /> <form:errors
					path="baCoNm" class="error" /></td>
		</tr>

		<tr>
			<th>운영시간</th>
			<td><form:input path="baStartTime" type="time" id="startTime" class="form-control custom-input-size" style="display: inline-block; width: 150px;"/> 부터
				<form:input path="baEndTime" type="time" id="endTime" class="form-control custom-input-size" style="display: inline-block; width: 150px;"/> 까지
			</td>
		</tr>
		<tr>
			<th>금액</th>
			<td><form:input path="baAmt" class="form-control" id="amountInput"  maxlength="11" /> <form:errors
					path="baAmt" class="error" /></td>
		</tr>


		<tr>
			<th>이메일</th>
			<td>
            <div style="display: flex; align-items: center;">
                <form:input path="baEmail" class="form-control" style="width:200px;" />&nbsp; @ &nbsp;
                <form:select id="baEmailDo" path="baEmailDo" class="form-control" style="width:200px;">
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
			<th>전화번호</th>
			<td>
				<form:input path="baContact" class="form-control" id="phoneNumberInput" maxlength="13"/> 
				<form:errors path="baContact" class="error" />

      </td>
		</tr>
		
		<tr>
		<th>사업자등록증</th>
		<td>
			<input type="file" name="baFiles" multiple />
		</td>
	</tr>
	

	
		
		<tr>
			<th>비밀번호</th>
			<td><form:input type="text" id="passwordInput" path="baPassword" class="form-control"  maxlength="4" value="신청 내역 조회 시 필요"
							onclick="clearDefaultValue();"/> <form:errors
					path="baPassword" class="error" /></td>
		</tr>
		
		



	</table>
		<div style="text-align: right; margin-top: 10px;">
		<input class="btn btn-outline-dark" type="submit" value="등록" /> 
		<input class="btn btn-outline-dark" data-bs-dismiss="modal"
               aria-label="Close" value="취소" />

			<a href="<c:url value="/open/operate/bnList.do#balist" />" class="btn btn-outline-dark">목록</a>
</div>

</form:form>

<script>

function clearDefaultValue() {
    var passwordInput = document.getElementById('passwordInput');
    
    if (passwordInput.value === "신청 내역 조회 시 필요") {
        passwordInput.value = "";
    }
}
</script>
<script>
document.getElementById('phoneNumberInput').addEventListener('input', function (event) {
    const input = event.target;
    const value = input.value.replace(/\D/g, ''); // 숫자 이외의 문자 제거

    if (value.length > 0) {
        input.value = formatPhoneNumber(value); // 형식에 맞게 변환된 값으로 설정
    } else {
        input.value = ''; // 빈 값일 경우 빈 문자열로 설정
    }
});

// 전화번호 형식에 맞게 변환하는 함수
function formatPhoneNumber(value) {
    const formattedValue = value.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    return formattedValue;
}
</script>
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
            $("input[name='baCoNm']").val("빽다방");
            $("input[name='baStartTime']").val("09:00");
            $("input[name='baEndTime']").val("22:00"); // 올바른 시간 형식으로 설정
            $("input[name='baAmt']").val("100,000,000"); 
            $("input[name='baEmail']").val("ppackk");
            $("select[name='baEmailDo']").val("gmail.com");
            $("input[name='baContact']").val("01043484689");
        });
    });
</script>



