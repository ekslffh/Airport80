<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.table-title {
	font-size: 30px;
	margin-bottom: 10px;
	color: white;
}

.btn-outline-dark {
	background-color: white;
	color: #black;
	border-color: #black;
}
</style>


<main>
	<section id="hero" class="hero">

		<div class="info d-flex align-items-center">
			<div class="container">
				<div class="table-title">분실물 ${lostItem.liId }</div>

				<div class="parent-container">
					<table class="table table-border" style="height: 600px;">


						<tr>
							<th rowspan="8" style="text-align: center;"><img
								src="${pageContext.request.contextPath }/resources/images/li/${lostItem.fileGroup.detailList[0].fiNm}"
								style="width:auto; height:500px;" /></th>
							<th>분실물이름</th>
							<td>${lostItem.liNm }</td>
						</tr>
						<tr>
							<th>분실물종류</th>
							<td>${lostItem.liCtgr }</td>
						</tr>
						<tr>
							<th>습득장소</th>
							<td>${lostItem.liLoc }</td>
						</tr>
						<tr>
							<th>습득일시</th>
							<td>${lostItem.liFndTs }</td>
						</tr>

						<tr>
							<th>등록일자</th>
							<td>${lostItem.liCrtTs }</td>
						</tr>
						<tr>
						<tr>
    <th>분실자명</th>
    <td>
        <c:choose>
            <c:when test="${empty lostItem.liPsNm}">
                알수없음
            </c:when>
            <c:otherwise>
                ${lostItem.liPsNm}
            </c:otherwise>
        </c:choose>
    </td>
</tr>
						<tr>
							<th>상태</th>
							<td><c:choose>
									<c:when test="${lostItem.liStatus == '등록'}">
										<span style="color: red;">${lostItem.liStatus}</span>
									</c:when>
									<c:when test="${lostItem.liStatus == '반환'}">
										<span style="color: limegreen;">${lostItem.liStatus}</span>
									</c:when>
									<c:when test="${lostItem.liStatus == '만료'}">
										<span style="color: orange;">${lostItem.liStatus}</span>
									</c:when>
									<c:otherwise>${lostItem.liStatus}</c:otherwise>
								</c:choose></td>
						</tr>



						<tr>
							<th colspan="3" style="text-align: center;">분실하신 분께서는 본인을
								증명할 수 있는 서류를 지참하여 분실물 보관센터에 방문하여 주시기 바랍니다.</th>
						</tr>

					</table>


					<div style="text-align: right; margin-top: 10px;">

						<a href="<c:url value="/open/operate/lostItemList.do" />"
							class="btn btn-outline-dark">목록</a>
					</div>
				</div>



			</div>
		</div>



		<div id="hero-carousel" class="carousel slide" data-bs-ride="carousel"
			data-bs-interval="5000">



			<div class="carousel-item active"
				style="background-image: url(resources/open/assets/img/hero-carousel/airport1.jpg)"></div>
		</div>




	</section>

</main>

