<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
h1 {
	color: white;
}

.btn-outline-dark {
	background-color: white;
	color: #black;
	border-color: #black;
}

}
.parent-container {
	max-height: 600px; /* 최대 높이 설정 */
}
th{
	width:250px;
}
</style>
<main>

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="hero">

		<div class="info d-flex align-items-center">
			<div class="container">
			
			<nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="http://localhost/Airport80/"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item active" style="color:white;">모집 공고</li>
					        <li class="breadcrumb-item active" style="color:white;">입찰신청</li>
					        <li class="breadcrumb-item active" style="color:white;">신청정보 조회</li>
					      </ol>
					    </nav>


				<br> <br> <br>
				<h1 style="font-size: 25px;">입찰신청정보</h1>


				<div class="parent-container">
					<table class="table table-border">



						<tr>
							<th class="table-light">공고 번호</th>
							<td>${ba.baBnNo }</td>

							<th class="table-light">위치</th>
							<td>${ba.baReqSpace }</td>
						</tr>
						<tr>
							<th class="table-light">신청 아이디</th>
							<td colspan="3">${ba.baId }</td>
						</tr>
						<tr>
							<th class="table-light">업체명</th>
							<td colspan="3">${ba.baCoNm }</td>
						</tr>
						<tr>
							<th class="table-light">운영시간</th>
							<td colspan="3">${ba.baStartTime }~${ba.baEndTime }</td>
						</tr>
						<tr>
							<th class="table-light">금액(원)</th>
							<td colspan="3">${ba.baAmt }</td>
						</tr>
						<tr>
							<th class="table-light">이메일</th>
							<td>${ba.baEmail }@${ba.baEmailDo }</td>
							<th class="table-light">전화번호</th>
							<td>${ba.baContact }</td>
						</tr>
						<c:if test="${not empty ba.fileGroup and not empty ba.fileGroup.detailList}">
						<tr>
							<th class="table-light">사업자등록증</th>
							<td colspan="3"><c:if
									test="${not empty ba.fileGroup and not empty ba.fileGroup.detailList }">
									<c:forEach items="${ba.fileGroup.detailList }" var="fileDetail">
										<c:url value="/download.do" var="downloadURL">
											<c:param name="atchFileId" value="${fileDetail.atchFileId }" />
											<c:param name="fiSn" value="${fileDetail.fiSn }" />
										</c:url>
										<i class="bi bi-paperclip">
										<a href="${downloadURL }">${fileDetail.fiOriginNm }</a>
										</i>
									</c:forEach>
								</c:if></td>
						</tr>
						</c:if>

						<c:url value="/open/operate/baUpdate.do" var="updateURL">
							<c:param name="what" value="${ba.baId }" />
						</c:url>
						<c:url value="/operate/bidApplication/baDelete.do" var="deleteURL">
							<c:param name="baId" value="${ba.baId }" />
						</c:url>

					</table>
				</div>



				<div style="text-align: right; margin-top: 10px;">
					<a href="${updateURL}" class="btn btn-primary">수정</a> <a
						href="${deleteURL }" class="btn btn-dark">삭제</a> <a
						href="<c:url value="/open/operate/bnList.do#balist" />"
						class="btn btn-secondary">목록</a>
				</div>

			</div>


		</div>



		<div id="hero-carousel" class="carousel slide" data-bs-ride="carousel"
			data-bs-interval="5000">



			<div class="carousel-item active"
				style="background-image: url(resources/open/assets/img/hero-carousel/airport1.jpg)"></div>
		</div>
	</section>

	<br> <br>


	<section id="hero" class="hero"></section>



	<br> <br>









</main>