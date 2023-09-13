<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	<style>
	.custom-textarea {
    height: 150px; /* 원하는 높이로 조정하세요 */
    width: 100%; /* 원하는 너비로 조정하세요 */
}
	</style>
	<script>
$(document).ready(function() {
    var originalRrContent = $("#rrContent").val();
    console.log('originalRrContent: '+originalRrContent);
    if(originalRrContent != ''){
    	var newRrContent = originalRrContent + "\r\n<반려사유>";
        $("#rrContent").val(newRrContent);	
    }
});
	</script>
<security:authentication property="principal.realUser" var="authMember" />

	<div class="card" >
		<div class="card-body">
			<h5 class="card-title" style="font-weight: 600;">반려사유</h5>

			<form:form method="post" modelAttribute="rncReq"
				id="popupForm" >
				<form:hidden path="rrId" id="rrId"/>
				<form:hidden path="rrStts" id="rrStts" />
				<div style="padding-left:10px;">
				<div class="row mb-3">
					<label for="inputPassword3" class="col-sm-2 col-form-label" style="padding:0px">상황설명</label>
					<div class="col-sm-10">
						<form:textarea path="rrContent" class="form-control custom-textarea"/>
					</div>
				</div>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary seReqBtn" data-dismiss="modal">완료</button>
					<button type="reset" class="btn btn-secondary">취소</button>
				</div>
			</form:form>
		</div>
	</div>
	
	<script>
	//완료상태 업데이트 폼 제출
$("#popupForm").submit(function(event){
    event.preventDefault(); 
    $.ajax({
        type: 'POST',
        url: "/Airport80/infra/rncReqUpdate.do",
        data: $(this).serialize(),
        success: function (response){
            console.log(response)
            if(response == "success") {
                Swal.fire({
                    icon: 'success',
                    text: '반려 처리 되었습니다.'
                }).then(() => {
                    // 모달닫기
                    $('#companion').modal('hide');
                    // 일정 시간(예: 2000ms) 후에 페이지 이동
                    setTimeout(function() {
                        window.location.href = "/Airport80/infra/rncReqList.do?mode=maintenance";
                    }, 1000);
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    text: '반려 처리 실패했습니다.'
                })
            }
        },
        error: function (xhr, status, error) {
            console.error(error);
        }
    });
});
// 	//메인 창에서 넘어온 소켓 객체 사용
// 		var socket = window.opener.socket;
		
// 	 	const floorSelect = document.getElementById("floorSelect");
// 	    const zoneSelect = document.getElementById("zoneSelect");


//     floorSelect.addEventListener("change", function() {
//         const selectedFloor = floorSelect.value;
	
//         // 기존 구역 옵션들 숨김
//         for (const option of zoneSelect.options) {
//             option.style.display = "none";
//         }
			
//         // 선택된 층에 해당하는 구역 옵션들 표시
//         for (const option of zoneSelect.options) {
//             if (option.classList.contains(selectedFloor)) {
//                 option.style.display = "block";
//             }
//         }
//     });

//     zoneSelect.addEventListener("change", function() {
//         const selectedZoneCode = zoneSelect.value;
//         // 선택된 구역 코드를 이용하여 다른 처리 수행 (예: 값 저장 등)
//     });
	</script>
</body>
</html>
