<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form:form modelAttribute="budgetDetail" method="post">
    <table class="table table-bordered">
            <form:hidden path="budId" class="form-control" />
                
        <tr>
            <th>항목 금액</th>
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
        history.back();
    }

</script>
