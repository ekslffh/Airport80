<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
  

<style>
.table-title {
        font-size: 25px; 
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
		<br><br>
		 <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="http://localhost/Airport80/"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item" style="color:white;">게시판</li>
					      </ol>
					    </nav>
		
<div class="table-title">분실물 리스트</div>


		<div class="parent-container" >
				<table class="table table-border " style="height: 600px;">
	
		<tr>
			<th class="table-light" style="text-align: center" >분실물 아이디</th>
			<th class="table-light" style="text-align: center">분실물 이름</th>
			<th class="table-light" style="text-align: center">분실물 종류</th>
			<th class="table-light" style="text-align: center">분실자 이름</th>
			<th class="table-light" style="text-align: center">등록일자</th>
			<th class="table-light" style="text-align: center">상태</th>
		</tr>

	<tbody>
		<c:set value="${paging.dataList }" var="lostItemList" />
		<c:if test="${empty lostItemList }">
			<tr>
				<td colspan="6">분실물 없음</td>

			</tr>
		</c:if>
		<c:if test="${not empty lostItemList }">
			<c:forEach items="${lostItemList }" var="lostItem">
				<c:url value="/open/operate/lostItemView.do" var="viewURL">
					<c:param name="what" value="${lostItem.liId }" />
				</c:url>

				<tr>
					<td class="text-center"><a href="${viewURL }">${lostItem.liId }</a></td>
					<td class="text-center">${lostItem.liNm }</td>
					<td class="text-center">${lostItem.liCtgr}</td>
					 <td class="text-center">
							        <c:choose>
							            <c:when test="${empty lostItem.liPsNm}">
							                알수없음
							            </c:when>
							            <c:otherwise>
							                ${lostItem.liPsNm}
							            </c:otherwise>
							        </c:choose>
							   	 </td>
					<td class="text-center">${lostItem.liCrtTs }</td>
					<%-- 				<td>${lostItem.liStatus }</td> --%>
					
					<td class="text-center">
					
						<c:choose>
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
							</c:choose>
	
					</td>


				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
</div>
	
	
<tfoot>
		<tr>
			<td colspan="6">
				<div class="d-flex justify-content-center mb-3">
					${paging.pagingHTML }</div>
				<div id="searchUI" class="row justify-content-center">
					<div class="col-auto">
						<form:select path="simpleCondition.searchType" class="form-select">
							<form:option value="" label="전체" />
							<form:option value="liCtgr" label="종류" />
							<form:option value="liStatus" label="상태" />
						</form:select>
					</div>
					<div class="col-auto">
						<form:input path="simpleCondition.searchWord" class="form-control" />
					</div>
					
					
					<div class="col-auto">
						<input type="button" value="검색" id="searchBtn"
							class="btn btn-outline-dark" /> 
					</div>
				</div>
			</td>
		</tr>
	</tfoot>
</div>
</div>



<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
	<form:hidden path="searchType" />
	<form:hidden path="searchWord" />
	<input type="hidden" name="page" />
</form:form>


<div id="hero-carousel" class="carousel slide" data-bs-ride="carousel"
		data-bs-interval="5000">
	


		<div class="carousel-item active"
			style="background-image: url(resources/open/assets/img/hero-carousel/airport1.jpg)"></div>
</div>





<script>
function fn_paging(page) {
	searchForm.page.value = page;
	searchForm.requestSubmit();
}
$(searchBtn).on("click", function(event) {
	$(searchUI).find(":input[name]").each(function(idx, input) {
		let name = input.name;
		let value = $(input).val();
		$(searchForm).find(`[name=\${name}]`).val(value);
	});
	$(searchForm).submit();
});

let selectLiId;

const buttons = document.querySelectorAll('.li-button');
buttons.forEach(button =>{
	button.addEventListener('click', function(){
		selectLiId = this.getAttribute('data-liid');
		$('#liidValue').val(selectLiId);
	});
});


$(document).on("keydown", function(event) {
    if (event.key === "Enter") {
        event.preventDefault(); // 기본 동작(페이지 새로고침) 방지
        $('#searchBtn').click(); // 검색 버튼 클릭
    }
});
</script>

</section>


</main>






