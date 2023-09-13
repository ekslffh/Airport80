<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="org.springframework.format.datetime.DateFormatter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page
	import="org.springframework.format.support.DefaultFormattingConversionService"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%
DefaultFormattingConversionService conversionService = new DefaultFormattingConversionService();
conversionService.addFormatter(new DateFormatter("yyyy-MM-dd"));
%>


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">발주목록</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">재고관리</a></li>
					        <li class="breadcrumb-item active">발주내역</li>
					      </ol>
					    </nav>
					 </div>
					<h5 class="card-title"></h5>
					<table class="table Default Table">
						<thead class="table-light">
							<tr>
								<th>발주ID</th>
								<th>업체명</th>
								<th>금액</th>
								<th>담당자</th>
								<th>발주일자</th>
								<th>발주상태</th>
								<th></th>

							</tr>
						</thead>
						<tbody>
							<c:set var="soList" value="${paging.dataList }" />
							<c:if test="${empty soList }">
								<tr>
									<td colspan="6">발주내역 없음.</td>
								</tr>
							</c:if>
							<c:if test="${not empty soList }">
								<c:forEach items="${soList }" var="so">
									<tr>
										<td><a href="#" style="display: block;" class="so_link"
											data-so-id="${so.soId}"> ${so.soId} </a></td>
										<td>${so.supplier.sprNm}</td>
										<td ><fmt:formatNumber value="${so.soAmount}"
												type="number" pattern="#,##0" /></td>
										<td>${so.employee.empNm}</td>
											<td>${so.soTs.toString().split(':')[0].replace('T', ' ')}:${so.soTs.toString().split(':')[1]}</td>
										<td class="statusTd">${so.soStatus}</td>
										<td>
											<button class="btn btn-light" style="border: 1px solid #cdcdcd;" 
												data-so-id="${so.soId}" data-toggle="modal"
												data-target="#orderDetailModal">상세보기</button>
												<c:if test="${so.soStatus ne '입고완료'}">
											<button class="btn btn-primary completeButton"
												data-so-id="${so.soId}">입고처리</button>
												</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
						</table>
									<div class="d-flex justify-content-center mb-5">
										${paging.pagingHTML }
										<!-- a태그 동작 -->
									</div>
									<div id="searchUI" class="row justify-content-center">
										<div class="col-auto">
											<form:select path="simpleCondition.searchType"
												class="form-select">
												<!-- 데이터 입력 용도 -->
												<form:option value="" label="전체" />
												<form:option value="id" label="발주ID" />
												<form:option value="name" label="업체명" />
												<form:option value="date" label="발주일자" />
												<form:option value="status" label="발주상태" />
											</form:select>
										</div>
										<div class="col-auto">
											<form:input path="simpleCondition.searchWord"
												class="form-control" />
										</div>
										<div class="col-auto">
											<input type="button" value="검색" id="searchBtn"
												class="btn btn-outline-dark gray_btn" />
										</div>
									</div>
					
					<form:form id="searchForm" modelAttribute="simpleCondition"
						method="get">
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

<!-- Modal -->
<div id="orderDetailModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">발주내역 확인</h4>
				<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="orderDetailContent">
				<!-- Order detail content will be displayed here -->
			</div>
		</div>
	</div>
</div>


<script>
		function fn_paging(page) {
			searchForm.page.value = page;
			$(searchForm).submit();
			//       searchForm.requestSubmit();
		}

		// searchUI에서 입력을 받은 데이터를 searchForm으로 옮겨야함
		$(searchBtn).on("click", function(event) {
			//       $ find : children을 찾겠다. name속성을 가지고 있는 input태그 중에서 모든 input태그
			$(searchUI).find(":input[name]").each(function(idx, input) { //셀렉트/ input
				let name = input.name; //하나의 input태그의 name속성
				let value = $(input).val();
				$(searchForm).find(`[name=\${name}]`).val(value);
			});
			$(searchForm).submit();
		});

	// 모달창으로 orderDetail검색 
	   $(document).ready(function () {
        $('.completeButton').click(function () {
        	var button = $(this);
        	
            var soId = $(this).data('so-id');
            var completeURL = "${pageContext.request.contextPath}/infra/orderDetail.do";
            console.log(soId)
			console.log(completeURL)			
            if (confirm("선택한 아이템을 입고 완료 처리하시겠습니까?")) {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/infra/orderDetail.do",
                    data : JSON.stringify({"what" : soId })
                    ,
                    contentType : "application/json",
                    success: function (response) {
                    	console.log(response);
                        if (response.result === "성공") {
                        	 Swal.fire({
                        	     icon: 'success',
                        	     text: '입고 완료 처리되었습니다.'
                        	   })
                        	  button.text("입고완료").removeClass("btn-success completeButton").prop("disabled", true);
                        	  button.hide();
                        	  button.parents('td').siblings('.statusTd').text("입고완료");
                        	  
                            // 페이지를 새로고침하거나 필요한 다른 동작 수행
                        } else {
                            location.href="${pageContext.request.contextPath }/infra/stockOrderList.do";
                            Swal.fire({
                       	     icon: 'success',
                       	     text: '입고 완료 처리 중 오류가 발생했습니다.'
                       	   })
                        }
                    },
                	error : function(error){
                		 Swal.fire({
                       	     icon: 'success',
                       	     text: '입고 완료 처리 중 오류가 발생했습니다.'
                       	   })
                		console.log(error)
                	}
                });
            }
        });

        $('.so_button').click(function () {
            var soId = $(this).data('so-id');
            console.log(soId)
            var viewURL = "${pageContext.request.contextPath}/infra/orderDetail.do?what=" + soId;

            $.ajax({
                type: "GET",
                url: viewURL,
                success: function (data) {
                    $('#orderDetailContent').html(data);
                    $('#orderDetailModal').modal('show');
                    
                }
            });
        });
    });
</script>
