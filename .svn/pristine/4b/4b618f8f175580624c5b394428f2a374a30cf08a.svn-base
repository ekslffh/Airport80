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
<div class="table-title">공지 게시판</div>



		<div class="parent-container">
				<table class="table table-border " style="height: 600px;">
		
		<tr>
			<th class="table-light">번호</th>
			<th class="table-light" >제목</th>
			<th class="table-light" >작성자</th>
			<th class="table-light" >작성일</th>
			<th class="table-light" >조회수</th>
		</tr>
	<tbody>
		<c:set value="${paging.dataList }" var="cnbList" />
		<c:if test="${empty cnbList }">
			<tr>
				<td colspan="5">등록된 글 없음.</td>
			</tr>
		</c:if>	
		<c:if test="${not empty cnbList }">
			<c:forEach items="${cnbList }" var="cnb">
				<c:url value="/open/operate/cnbView.do" var="viewURL">
					<c:param name="what" value="${cnb.cnbNo }" />
				</c:url>
				<tr>
					<td>${cnb.cnbNo }</td>
					<td><a href="${viewURL }" style="color:steelblue;">${cnb.cnbTitle }</a></td>
					<td>${cnb.cnbWriter }</td>
					<td>${cnb.cnbCrtTs }</td>
					<td>${cnb.cnbVws }</td>
				
			</c:forEach>
		</c:if>
		
		
	</tbody>
	</table>
	</div>
	
	

		<tr>
			<td colspan="5">
				<div class="d-flex justify-content-center mb-3">
				${paging.pagingHTML }
				</div>
				<div id="searchUI" class="row justify-content-center">
					<div  class="col-auto">
						<form:select path="simpleCondition.searchType" class="form-select">
							<form:option value="" label="전체" />
							<form:option value="cnbWriter" label="작성자" />
							<form:option value="cnbTitle" label="제목" />
						</form:select>
					</div>
					<div  class="col-auto">
						<form:input path="simpleCondition.searchWord" class="form-control"/>
					</div>
					<div  class="col-auto">
						<input type="button" value="검색" id="searchBtn" class="btn btn-secondary"/>
						
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
	function fn_paging(page){
		searchForm.page.value = page;
		searchForm.requestSubmit();
	}
	$(searchBtn).on("click", function(event){
		$(searchUI).find(":input[name]").each(function(idx, input){
			let name = input.name;
			let value = $(input).val();
			$(searchForm).find(`[name=\${name}]`).val(value);
		});
		$(searchForm).submit();
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
