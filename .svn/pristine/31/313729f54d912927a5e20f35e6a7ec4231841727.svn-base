<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<security:authentication property="principal.realUser" var="authMember" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table class="table table-bordered">
		<tr>
			<th class="table-light">요청ID</th>
			<td>${reqList.srId }</td>
			<th class="table-light">작성자</th>
			<td>${reqList.srReqMem }</td>
		</tr>
		<tr>
			<th class="table-light">카테고리</th>
			<td>${reqList.srCa }</td>
			<th class="table-light">위치</th>
			<td>${reqList.zone.zoneFloor }층${reqList.zone.zoneCtgr }</td>
		</tr>
		<tr>
			<th class="table-light">요청일시</th>
			<td colspan="3">${reqList.srTs.toString().replace('T',' ') }</td>
		</tr>
		<tr>
			<th class="table-light">요청내용</th>
			<td colspan="3">${reqList.srContent }</td>
		</tr>

	</table>


	<!-- Accordion without outline borders -->
	<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
			<h2 class="accordion-header" id="flush-headingOne">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne" style="color: #4154f1;">
					<i class="bi bi-plus-square-fill"></i> &nbsp; 처리완료
				</button>
			</h2>
			<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
				<div class="accordion-body">



					<!-- Horizontal Form -->
					<form:form method="post" modelAttribute="reqList" id="statusForm">
						<form:hidden path="srId" id="hiddenSrId" />

						<div class="row mb-3">
							<label for="inputPassword3" class="col-sm-2 col-form-label">처리일시</label>
							<div class="col-sm-10">
								<form:input class="form-control" type="datetime-local" path="srPrcDt" />
							</div>
						</div>

						<div class="row mb-3">
							<label for="inputPassword3" class="col-sm-2 col-form-label">처리내용</label>
							<div class="col-sm-10">
								<form:textarea class="form-control" type="text" path="srPrcCt" />
							</div>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary seReqBtn poff" data-dismiss="modal">완료</button>
							<button type="reset" class="btn btn-secondary">취소</button>
						</div>
					</form:form>
					<!-- End Horizontal Form -->

				</div>
			</div>
		</div>
	</div>
	<!-- End Accordion without outline borders -->


	<script>
		//완료상태 업데이트 폼 제출
		$("#statusForm").submit(function(event) {
			event.preventDefault();

			$.ajax({
				type : 'POST',
				url : '<c:url value="/safety/secCompltUpdate.do"/>',
				data : $(this).serialize(),
				success : function(response) {
					if (response == "success") {
						
						
			            Swal.fire({
			                icon: 'success',
			                text: '완료 처리가 되었습니다.',
			                showLoaderOnConfirm: true, // 동작 중 로더 표시
			            })
						
						securityBoard();
						//모달닫기
						$('#disablebackdroㅊp').modal('hide');
					} else {
						alert("완료처리가 실패했습니다.");
					}
				},
				error : function(xhr, status, error) {
					console.error(error);
				}
			});
		});
	</script>

</body>
</html>