<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form:form modelAttribute="budget" method="post">
    <table class="table table-bordered">
        <tr>
            <th>예산항목 선택</th>
            <td>
                <form:select path="acaId" class="form-select">
                    <form:option value="" label="선택하세요" /> <!-- 선택 안 함 -->
                    <form:options items="${categorylist}" itemValue="acaId" itemLabel="acaNm" />
                </form:select>
                <form:errors path="acaId" class="error" />
            </td>
        </tr>
        <tr>
            <th>항목당 금액</th>
            <td>
                <form:input path="bdAmt" class="form-control" />
                <form:errors path="bdAmt" class="error" />
            </td>
        </tr>
        
   
        <tr>
            <td colspan="2">
                <input type="submit" value="등록" class="btn btn-success" />
              <input type="button" value="취소" class="btn btn-danger" onclick="goBack()" />

            </td>
        </tr>
    </table>
</form:form>
<!-- JavaScript 섹션 -->
<script>
    // 에러 메시지가 있는지 확인하고, 있으면 알림으로 표시하는 함수
    function showAlertIfError() {
        // 에러 메시지가 있는 경우
        var errorMessages = document.getElementsByClassName("error");
        if (errorMessages.length > 0) {
            var errorMessage = errorMessages[0].innerText;
            alert(errorMessage);
        }
    }
    
    // 페이지 로드 시 에러 메시지 확인
    window.onload = function() {
        showAlertIfError();
    };
    
    function goBack() {
        // 이전 페이지로 돌아갑니다.
        history.back();
    }

</script>
