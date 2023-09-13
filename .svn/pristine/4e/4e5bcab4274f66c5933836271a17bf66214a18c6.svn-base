<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="card-header"
						style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">계정 과목 등록</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a
									href="${pageContext.request.contextPath }/in"><i
										class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">예산</a></li>
								<li class="breadcrumb-item">계정 과목 관리</li>
								<li class="breadcrumb-item active">계정 과목 등록</li>
							</ol>
						</nav>
					</div>
					<!-- 게시판 헤더 영역 끝 -->

					<div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill"
								style="margin-right: 4px;"></i> <span data-bs-toggle="tooltip"
								data-bs-placement="top"> 사용될 계정 과목을 등록합니다. 이름과 설명을 입력하세요.
							</span>
						</p>
					</div>
 
					<h5 class="card-title"></h5>
					<form:form modelAttribute="accountcategory" method="post">
						<table class="table table-bordered">
							<tr>
								<th>항목이름</th>
								<td><form:input path="acaNm" class="form-control" /> <form:errors
										path="acaNm" class="error" /></td>
							</tr>
							<tr>
								<th>항목설명</th>
								<td><form:input path="acaInfo" class="form-control" /> <form:errors
										path="acaInfo" class="error" /></td>
							</tr>

						</table>
						<div class="text-right" style="float: right;">
							<input type="submit" value="등록" class="btn btn-success" /> <input
								type="reset" value="취소" class="btn btn-danger"
								onclick="window.location.href='${pageContext.request.contextPath}/accounting/accountcategory/AcccList.do'" />
						</div>
					</form:form>

				</div>
			</div>
		</div>
	</div>
</section>

<script>
	// 에러 메시지가 있는지 확인하고, 있으면 SweetAlert2로 표시하는 함수
	function showAlertIfError() {
		// 에러 메시지가 있는 경우
		var errorMessages = document.getElementsByClassName("error");
		if (errorMessages.length > 0) {
			var errorMessage = errorMessages[0].innerText;
			Swal.fire({
				icon : 'error',
				title : '에러',
				text : errorMessage,
			});
		}
	}

	// 페이지 로드 시 에러 메시지 확인
	window.onload = function() {
		showAlertIfError();
	};
</script>
