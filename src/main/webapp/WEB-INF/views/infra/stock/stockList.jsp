<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
/* td 요소를 가운데 정렬하는 스타일 */
td, th {
	text-align: center;
}
.d-flex.justify-content-center.mb-5 {
    display: flex;
    justify-content: center;
    margin-bottom: 5px;
}
</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">재고목록</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">재고관리</a></li>
					        <li class="breadcrumb-item active">재고</li>
					      </ol>
					    </nav>
					 </div>




<!-- 					<h6 style="text-align: right;">*현재고 5개이하 = 발주필요* </h6> -->
                                <div class="info" style="width: 100%; text-align: left;">
                                    <p class="cofistooltip">
                                        <i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i>
                                        <span data-bs-toggle="tooltip" data-bs-placement="top"
                                            title="재고가 5개이하인 제품은 발주해주세요" style="text-right">현재고 5개 이하 = 발주필요</span>
                                    </p>
<!--                                     <p class="reason">시설물은 시설명, 코드, 상태, 운영시간만 수정 가능합니다.<br> 코드 수정시 3글자 중앙에 구역명 규칙을 지켜 주시기 바랍니다. 상태는 운영 "ON" 미운영 "OF"로 수정 하시기 바랍니다.</p> -->
                                </div>
					<table class="table Default Table">
						<thead class="table-light">
							<tr>
								<th>품번</th>
								<th>품명</th>
								<th>분류명</th>
								<th>거래업체</th>
								<th>단위당가격/원</th>
								<th>단위/ea</th>
								<th>재고</th>
								<th>상태</th>
								<th>위치</th>
								<th>등록일자</th>
							</tr>
						</thead>
						<tbody>
<c:set var="stockList" value="${paging.dataList}" />
<c:if test="${not empty stockList}">
  <!-- 페이지의 첫 번째 "발주필요" 상태인 항목을 찾음 -->
  <c:forEach items="${stockList}" var="stock" varStatus="status">
    <c:if test="${stock.stStatus == '발주필요'}">
      <!-- "발주필요" 상태인 행을 출력 -->
      <tr style="background-color: yellow;">
        <td>${stock.stId}</td>
        <td><a href="${viewURL}" style="display:block; float:left;">${stock.stNm}</a></td>
        <td>${stock.commonCode.codeNm}</td>
        <td>${stock.supplier.sprNm}</td>
        <td><fmt:formatNumber value="${stock.stPrice}" type="number" pattern="#,##0" /></td>
        <td>${stock.stUnit}</td>
        <td>${stock.stQuantity}</td>
        <td style="color:red;">${stock.stStatus}</td>
        <td>${stock.stLoc}</td>
        <td>${stock.stCrtDt}</td>
      </tr>
    </c:if>
  </c:forEach>

  <!-- "발주필요" 상태가 아닌 항목을 출력 -->
  <c:forEach items="${stockList}" var="stock">
    <c:if test="${stock.stStatus != '발주필요'}">
      <tr>
        <td>${stock.stId}</td>
        <td>
          <c:url value="/infra/updateStock.do" var="viewURL">
            <c:param name="what" value="${stock.stId}" />
          </c:url>
          <a href="${viewURL}" style="display:block; float:left;">${stock.stNm}</a>
        </td>
        <td>${stock.commonCode.codeNm}</td>
        <td>${stock.supplier.sprNm}</td>
        <td><fmt:formatNumber value="${stock.stPrice}" type="number" pattern="#,##0" /></td>
        <td>${stock.stUnit}</td>
        <td>${stock.stQuantity}</td>
        <td>${stock.stStatus}</td>
        <td>${stock.stLoc}</td>
        <td>${stock.stCrtDt}</td>
      </tr>
    </c:if>
  </c:forEach>
</c:if>
</tbody>
						</table>
								<div class="d-flex justify-content-center mb-5">
								${paging.pagingHTML }<!-- a태그 동작 -->
								</div>
									<div id="searchUI" class="row justify-content-center">
										<div class="col-auto">
										<form:select path="simpleCondition.searchType" class="form-select">
											<!-- 데이터 입력 용도 -->
											<form:option value="" label="전체" />
											<form:option value="id" label="품번" />
											<form:option value="name" label="품명" />
											<form:option value="category" label="분류" />
											<form:option value="supplier" label="발주업체" />
										</form:select>
										</div>
										<div  class="col-auto">
										<form:input path="simpleCondition.searchWord" class="form-control"/>
										</div>
										<div class="col-auto">
										<input type="button" value="검색" id="searchBtn" class="btn btn-outline-dark gray_btn" />
										<a class="btn btn-primary" href="<c:url value='/infra/stockInsert.do'/>">품목등록</a>
										</div>
									</div>
					
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
