<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">입출국금지자 관리</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">보안검색</a></li>
								<li class="breadcrumb-item active">입출국금지자 관리</li>
							</ol>
						</nav>
					</div>

					<div class="info" style="width: 100%;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> <span>출입국 금지자 규정</span>
						</p>
						<p class="reason" style="margin-bottom: 0;">범죄나 범법행위와 관련된사람, 국가 안보나 공공안전을 위협하는 사람, 감염병 확산 방지를 위한 사람, 출입국 비자나 허가조건을 위반한 사람</p>
					</div>

					<div class="fw-bold" style="font-size: 21px; margin-bottom: 13px;">출국금지자 관리</div>

					<table class="table Default Table">
						<thead class="table-primary">
							<th>이름</th>
							<th>여권번호</th>
							<th>금지사유</th>
							<th>금지기간</th>
						</thead>
						<tbody>
							<c:if test="${empty ppersonList }">
								<tr>
									<td colspan="4">출국금지자 없음.</td>
								</tr>
							</c:if>
							<c:if test="${not empty ppersonList }">
								<c:forEach items="${ppersonList }" var="pperson">
									<c:url value="/safety/PPersonView.do" var="viewURL">
										<c:param name="what" value="${pperson.ppPno }" />
									</c:url>
									<tr>
										<td><a href="${viewURL }">${pperson.ppNm }</a></td>
										<td>${pperson.ppPno }</td>
										<td>${pperson.ppRes }</td>
										<td>${pperson.ppPer }</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>

					<div class="d-flex justify-content-end">
						<a class="btn btn-primary" href="<c:url value='/safety/exinsertForm.do'/>">등록</a>
					</div>


				</div>






				<div class="card-body" style="margin-top: -20px;">

					<div class="fw-bold" style="font-size: 21px; margin-bottom: 13px;">입국금지자 관리</div>

					<div id="enterArea"></div>

				</div>



			</div>
		</div>
	</div>
</section>


<script>
	$(document).ready(function() {
		enterBoard();
	});

	// 출국금지자 불러오기
	function enterBoard() {
		$.ajax({
			url : '<c:url value="/safety/enterPerson.do"/>',
			method : 'get',
			dataType : 'html',
			success : function(data) {
				$('#enterArea').html(data);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});

	}
</script>
