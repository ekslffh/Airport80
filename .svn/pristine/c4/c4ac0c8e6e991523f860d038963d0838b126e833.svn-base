<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<style>
    .table-title {
        font-size: 30px; 
        margin-bottom: 10px; 
        color: deepskyblue;
    }
     .col-auto {
        display: flex;
        justify-content: flex-end;
    }
   
</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    




					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">운행일지</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">셔틀버스</a></li>
					        <li class="breadcrumb-item"><a href="#">운행일지</a></li>
					        <li class="breadcrumb-item active">전체조회</li>
					      </ol>
					    </nav>
					 </div>
					 <div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							셔틀버스 운행일지 리스트를 조회할 수 있습니다.</span>
						</p>
					</div>						 

<table class="table table-border">
<thead>
	<tr>

		<th class="table-light">제목</th>
		<th class="table-light">작성일자</th>
		<th class="table-light">작성자</th>
 	</tr>
</thead>
<tbody>
	<c:set value="${paging.dataList }" var="blogList" />
	<c:if test="${empty blogList }">
		<tr>
			<td colspan="3"/>
		</tr>
	</c:if>
	<c:if test="${not empty blogList }">
		<c:forEach items="${blogList }" var="blog">
			<c:url value="/operate/busLog/blogView.do" var="viewURL">
				<c:param name="what" value="${blog.blogId }" />
			</c:url>

			<tr>

				<td><a href="${viewURL }">${blog.blogTitle }</a></td>
				<td>${blog.blogCrtTs }</td>
				<td>${blog.blogWriter }</td>

			</tr>
		</c:forEach>
	</c:if>
</tbody>
<tfoot>
		<tr>
			<td colspan="3">
				<div class="d-flex justify-content-center mb-3">
				${paging.pagingHTML }
				</div>

					<div  class="col-auto">
<!-- 						<input type="button" value="검색" id="searchBtn" class="btn btn-outline-dark"/> -->
						<a href="<c:url value='/operate/busLog/blogInsert.do' />" class="btn btn-primary">등록</a>
					
				</div>
			</td>
		</tr>
	</tfoot>
</table>

	
<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
	<form:hidden path="searchType" />
	<form:hidden path="searchWord" />
	<input type="hidden" name="page" />
</form:form>

				</div>
			</div>
		</div>
	</div>
</section>

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
</script>



