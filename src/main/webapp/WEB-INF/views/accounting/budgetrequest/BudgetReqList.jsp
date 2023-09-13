<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #deleteButton, #recoverButton {
        margin-top: 10px;
        margin-right: 10px;
    }
</style>

 <section class="section">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                        <!-- 게시판 헤더 영역 시작 -->
							<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
							    <h5 class="card-tit">추가 예산 신청 목록</h5>
							    <nav>
							      <ol class="breadcrumb">
							        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/in"><i class="bi bi-house-door"></i></a></li>
							        <li class="breadcrumb-item"><a href="#">지원요청</a></li>
							        <li class="breadcrumb-item active">추가 예산 신청 목록</li>
							      </ol>
							    </nav>
						    </div>
						    <p>목록을 클릭하면 상세 정보가 표시됩니다. <br> 우측 하단 추가 예산 신청으로 추가 예산을 신청할 수 있습니다.</p>
				 	   <!-- 게시판 헤더 영역 끝 -->
                         
                        <table class="table datatable table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">신청번호</th>
                                    <th scope="col">금액</th>
                                    <th scope="col">계정과목</th>
                                    <th scope="col">신청직원</th>                               
                                    <th scope="col">접수일</th>
                                    <th scope="col">처리직원</th>
                                    <th scope="col">처리일</th>
                                    <th scope="col">상태</th>
                                </tr>
                            </thead>
                            <tbody>
							    <c:forEach var="budgetReq" items="${BudgetReqList}">
							        <tr onclick="openDetailPage('${budgetReq.bgRId}');">
							            <td><a class="d-block bk" href='<c:url value="/accounting/budgetrequest/DetailPage.do?bgRId=${budgetReq.bgRId}" />'>${budgetReq.bgRId}</a></td>
							            <td><a class="d-block bk" href='<c:url value="/accounting/budgetrequest/DetailPage.do?bgRId=${budgetReq.bgRId}" />'><fmt:formatNumber value="${budgetReq.bgRAmt}" type="currency" currencySymbol="₩" /></a></td>
							            <td><a class="d-block bk" href='<c:url value="/accounting/budgetrequest/DetailPage.do?bgRId=${budgetReq.bgRId}" />'>${budgetReq.acaNm}</a></td>
		
							            <td><a class="d-block bk" href='<c:url value="/accounting/budgetrequest/DetailPage.do?bgRId=${budgetReq.bgRId}" />'>${budgetReq.empEmpNm}</a></td>
							            <td><a class="d-block bk" href='<c:url value="/accounting/budgetrequest/DetailPage.do?bgRId=${budgetReq.bgRId}" />'>${budgetReq.bgRTs.substring(0,11)}</a></td>       
							            <td>
										    <a class="d-block bk" href='<c:url value="/accounting/budgetrequest/DetailPage.do?bgRId=${budgetReq.bgRId}" />'>
										        ${empty budgetReq.salEmpNm ? '대기중' : budgetReq.salEmpNm}
										    </a>
										</td>
										<td>
										    <a class="d-block bk" href='<c:url value="/accounting/budgetrequest/DetailPage.do?bgRId=${budgetReq.bgRId}" />'>
										        ${empty budgetReq.bgRResTs ? '대기중' : budgetReq.bgRResTs.substring(0, 11)}
										    </a>
										</td>
										<td>
   											 <c:set var="textColor" value="${budgetReq.bgRStatus eq '승인대기' ? 'red' : (budgetReq.bgRStatus eq '승인완료' ? 'blue' : '')}"/>
    										 <a class="d-block bk" href='<c:url value="/accounting/budgetrequest/DetailPage.do?bgRId=${budgetReq.bgRId}" />' style="color: ${textColor};">${budgetReq.bgRStatus}</a>
							            </td>
							        </tr>
							    </c:forEach>
							</tbody>
                        </table>
                        <!-- End Table with stripped rows -->
                           <a href="javascript:void(0);" class="btn btn-primary" onclick="openBudgetRequestPopup();" style="float: right;">추가 예산 신청</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

<script>

window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    var datatableSorterElements = document.querySelectorAll('.datatable-sorter');
    var lastDatatableSorterElement = datatableSorterElements[datatableSorterElements.length - 1];
    
    var message = urlParams.get("message");
    
    if (message !== null && message !== "") {
        Swal.fire({
            icon: 'info',
            title: message,
        });
    }

    
    // 클릭 이벤트 트리거
    if (lastDatatableSorterElement) {
        lastDatatableSorterElement.click();
    }
    
};

    function openPopup(url, name, width, height) {
        var screenWidth = window.screen.availWidth;
        var screenHeight = window.screen.availHeight;
        var left = (screenWidth - width) / 2;
        var top = (screenHeight - height) / 2;
        window.open(url, name, 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
    }

    function openBudgetRequestPopup() {
        openPopup('<c:url value="/accounting/budgetrequest/BudgetRequestForm.do"/>', 'BudgetRequestPopup', 600, 500);
    }
</script>
