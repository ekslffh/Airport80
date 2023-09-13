<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">발주업체목록</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">업체관리</a></li>
					        <li class="breadcrumb-item"><a href="#">발주업체</a></li>
					        <li class="breadcrumb-item active">발주업체목록</li>
					      </ol>
					    </nav>
					 </div>
					<table class="table Default Table">
						<thead class="table-light">
							<tr>
								<th>업체아이디</th>
								<th>업체이름</th>
								<th>분류</th>
								<th>계약상태</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="ocList" value="${paging.dataList }" />
							<c:if test="${empty ocList }">
								<tr>
									<td colspan="4">발주업체 없음</td>
								</tr>
							</c:if>
							<c:if test="${not empty ocList }">
								<c:forEach items="${ocList }" var="ocList">
									<c:url value="/infra/orderCompanyView.do" var="viewURL">
										<c:param name="what" value="${ocList.sprId}" />
									</c:url>
									<tr>
										<td>${ocList.sprId }</td>
										<td><a href="${viewURL }" style="display:block;">${ocList.sprNm }</a></td>
										<td>${ocList.commonCode.codeNm }</td>
										<td>${ocList.sprStatus }</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
						
						<tfoot>
							<tr>
								<td colspan="5">
								<div class="d-flex justify-content-center mb-5">
								${paging.pagingHTML }<!-- a태그 동작 -->
								</div>
									<div id="searchUI" class="row justify-content-center">
										<div class="col-auto">
										<form:select path="simpleCondition.searchType" class="form-select">
											<!-- 데이터 입력 용도 -->
											<form:option value="" label="전체" />
											<form:option value="id" label="아이디" />
											<form:option value="name" label="업체이름" />
											<form:option value="status" label="계약상태" />
											<form:option value="category" label="분류" />
										</form:select>
										</div>
										<div  class="col-auto" >
										<form:input path="simpleCondition.searchWord" class="form-control"/>
										</div>
										<div class="col-auto">
										<input type="button" value="검색" id="searchBtn" class="btn btn-outline-dark gray_btn" />
										<a class="btn btn-primary" href="<c:url value='/infra/ocSupplierInsert.do'/>">업체등록</a>
										</div>
									</div>
								</td>
							</tr>
						</tfoot>
					</table>
					<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
						<!--  데이터 전송 용도  -->
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
      $(searchForm).submit();
//       searchForm.requestSubmit();
   }

      // searchUI에서 입력을 받은 데이터를 searchForm으로 옮겨야함
   $(searchBtn).on("click", function(event){
//       $ find : children을 찾겠다. name속성을 가지고 있는 input태그 중에서 모든 input태그
      $(searchUI).find(":input[name]").each(function(idx, input){ //셀렉트/ input
         let name = input.name; //하나의 input태그의 name속성
         let value = $(input).val();
         $(searchForm).find(`[name=\${name}]`).val(value);
      });
      $(searchForm).submit();
   });
</script>