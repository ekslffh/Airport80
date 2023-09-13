<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<security:authentication property="principal.realUser" var="authMember" />

<style>
/* 탭 네비게이션을 가로로 나열하고 각 탭을 꾸미기 위한 스타일 */
.nav.nav-pills.nav-fill {
	display: flex;
	justify-content: space-between;
}

/* 각 탭의 스타일 */
.nav-item {
	flex: 1;
	text-align: center;
}

/* 활성화된 탭의 스타일 */
.nav-link.active {
	background-color: #007bff; /* 활성화된 탭의 배경색 */
	color: #fff; /* 활성화된 탭의 텍스트 색상 */
}
</style>


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header"
						style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">예산 책정</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i
										class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">예산</a></li>
								<li class="breadcrumb-item active">예산 책정</li>
							</ol>
						</nav>
					</div>


					<div class="card">
						<div class="card-body">
							<br>
							<ul class="nav nav-pills nav-fill">
								<li class="nav-item"><a id="manage" class="nav-link"
									href="<c:url value='/accounting/budget/BudgetList.do' />?deptNo=1201">경영</a>
								</li>
								<li class="nav-item"><a id="operate" class="nav-link"
									href="<c:url value='/accounting/budget/BudgetList.do' />?deptNo=1202">운영</a>
								</li>
								<li class="nav-item"><a id="secure" class="nav-link"
									href="<c:url value='/accounting/budget/BudgetList.do' />?deptNo=1203">보안</a>
								</li>
								<li class="nav-item"><a id="infra" class="nav-link"
									href="<c:url value='/accounting/budget/BudgetList.do' />?deptNo=1204">인프라</a>
								</li>
							</ul>


							<table class="table table-bordered">
								<tr>
									<th style="text-align: center;">1분기</th>
									<th style="text-align: center;">2분기</th>
									<th style="text-align: center;">3분기</th>
									<th style="text-align: center;">4분기</th>
									<th style="text-align: center;">총예산</th>
								</tr>
								<tr>
									<td style="text-align: right;"><fmt:formatNumber
											value="${budgetInfo.oneq.budAmt}" type="currency"
											currencySymbol="₩ " /></td>
									<td style="text-align: right;"><fmt:formatNumber
											value="${budgetInfo.twoq.budAmt}" type="currency"
											currencySymbol="₩ " /></td>
									<td style="text-align: right;"><fmt:formatNumber
											value="${budgetInfo.threeq.budAmt}" type="currency"
											currencySymbol="₩ " /></td>
									<td style="text-align: right;"><fmt:formatNumber
											value="${budgetInfo.fourq.budAmt}" type="currency"
											currencySymbol="₩ " /></td>
									<td style="text-align: right;"><fmt:formatNumber
											value="${budgetInfo.oneq.budAmt + budgetInfo.twoq.budAmt + budgetInfo.threeq.budAmt + budgetInfo.fourq.budAmt}"
											type="currency" currencySymbol="₩ " /></td>
								</tr>


								<tr>
									<c:url value="/accounting/budget/BudgetUpdate.do"
										var="updateURL">
										<c:param name="budYear" value="${curYear }" />
										<c:param name="deptNo" value="${curDeptNo }" />
									</c:url>
									<c:if test="${empty budgetInfo.oneq }">책정된 예산 없음.</c:if>
									<td colspan="5" class="text-end"><a
										href="${pageContext.request.contextPath }/accounting/budget/BudgetInsertForm.do"
										class="btn btn-outline-primary me-2">예산책정</a> <a
										href="${updateURL }" class="btn btn-outline-primary me-2">예산수정</a>
										<button type="button" class="btn btn-outline-primary"
											data-bs-toggle="modal" data-bs-target="#exampleModal">연도변경</button>
									</td>
								</tr>
							</table>

						</div>
					</div>

					<div class="accordion accordion-flush" id="accordionExample">
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseOne"
									aria-expanded="false" aria-controls="collapseOne">
									(${budgetInfo.oneq.deptNo }) ${budgetInfo.oneq.budYear }년
									${budgetInfo.oneq.budQuarter }분기</button>
							</h2>
							<div id="collapseOne" class="accordion-collapse collapse"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>계정과목</th>
												<th>설명</th>
												<th>책정금액</th>
											</tr>
											<c:forEach items="${budgetInfo.oneq.detailList }"
												var="detail">
												<tr>
													<td>${detail.category.acaNm }</td>
													<td>${detail.category.acaInfo }</td>
													<td style="text-align: right;"><fmt:formatNumber
															value="${detail.bdAmt }" type="currency"
															currencySymbol="₩ " /></td>
												</tr>
											</c:forEach>
										</thead>
									</table>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">
									${budgetInfo.twoq.budYear }년 ${budgetInfo.twoq.budQuarter }분기</button>
							</h2>
							<div id="collapseTwo" class="accordion-collapse collapse"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>계정과목</th>
												<th>설명</th>
												<th>책정금액</th>
											</tr>
											<c:forEach items="${budgetInfo.twoq.detailList }"
												var="detail">
												<tr>
													<td>${detail.category.acaNm }</td>
													<td>${detail.category.acaInfo }</td>
													<td style="text-align: right;"><fmt:formatNumber
															value="${detail.bdAmt }" type="currency"
															currencySymbol="₩ " /></td>
												</tr>
											</c:forEach>
										</thead>
									</table>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									${budgetInfo.threeq.budYear }년 ${budgetInfo.threeq.budQuarter }분기
								</button>
							</h2>
							<div id="collapseThree" class="accordion-collapse collapse"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>계정과목</th>
												<th>설명</th>
												<th>책정금액</th>
											</tr>
											<c:forEach items="${budgetInfo.threeq.detailList }"
												var="detail">
												<tr>
													<td>${detail.category.acaNm }</td>
													<td>${detail.category.acaInfo }</td>
													<td style="text-align: right;"><fmt:formatNumber
															value="${detail.bdAmt }" type="currency"
															currencySymbol="₩ " /></td>
												</tr>
											</c:forEach>
										</thead>
									</table>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseFour"
									aria-expanded="false" aria-controls="collapseFour">
									${budgetInfo.fourq.budYear }년 ${budgetInfo.fourq.budQuarter }분기
								</button>
							</h2>
							<div id="collapseFour" class="accordion-collapse collapse"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>계정과목</th>
												<th>설명</th>
												<th>책정금액</th>
											</tr>
											<c:forEach items="${budgetInfo.oneq.detailList }"
												var="detail">
												<tr>
													<td>${detail.category.acaNm }</td>
													<td>${detail.category.acaInfo }</td>
													<td style="text-align: right;"><fmt:formatNumber
															value="${detail.bdAmt }" type="currency"
															currencySymbol="₩ " /></td>
												</tr>
											</c:forEach>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>







<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">연도변경</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<input id="changeYearInput" type="number" class="form-control" />
			</div>
			<div class="modal-footer">
				<button id="changeYearBtn" type="button" class="btn btn-primary">변경하기</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>

	<script>
    function getCurrentQuarter() {
        const currentMonth = new Date().getMonth() + 1; // JavaScript의 월은 0부터 시작하므로 +1 해줍니다.
        const currentQuarter = Math.ceil(currentMonth / 3);
        return currentQuarter;
    }
    
 	// 현재 URL에서 부서번호(deptNo)를 추출합니다.
    function getDeptNoFromURL() {
        const url = new URL(window.location.href);
        const deptNo = url.searchParams.get("deptNo");
        return deptNo;
    }
 	
 	var deptNo;
    
    $(document).ready(function() {
    	const currentQuarter = getCurrentQuarter();
        console.log("현재 분기:", currentQuarter);
        
     	var accordionItemToExpand;
        switch (currentQuarter) {
        case 1:
            // 1분기에 해당하는 처리
            accordionItemToExpand = $(collapseOne);
            break;
        case 2:
            // 2분기에 해당하는 처리
            accordionItemToExpand = $(collapseTwo);
            break;
        case 3:
            // 3분기에 해당하는 처리
            accordionItemToExpand = $(collapseThree);
            break;
        case 4:
            // 4분기에 해당하는 처리
            accordionItemToExpand = $(collapseFour);
            break;
        default:
            // 현재 분기가 범위를 벗어날 경우 처리 그냥 1분기 보여주기
            accordionItemToExpand = $(collapseOne);
            break;
        }

        if (${empty budgetInfo.oneq }) {
        	$('.accordion-item').hide();
        }
        // 현재 분기에 맞는 아코디언을 펼치도록 JavaScript로 처리
        if (accordionItemToExpand && ${not empty budgetInfo.oneq }) {
            accordionItemToExpand.addClass('show');
        }

        // 현재 부서에 맞게 nav active 시키기
        deptNo = getDeptNoFromURL();
        

        if (deptNo == null) deptNo = '${authMember.empDeptNo }';
        
        console.log("부서번호: ", deptNo);
        
        switch (deptNo) {
        case '1201':
            // 경영
            $(manage).addClass('active');
            console.log("경영임");
            break;
        case '1202':
            // 운영
            $(operate).addClass('active');
            break;
        case '1203':
            // 보안
            $(secure).addClass('active');
            break;
        case '1204':
            // 인프라
            $(infra).addClass('active');
            break;
        default:
            break;
        }
        
        $(changeYearBtn).on("click", function() {
        	console.log("click");
        	const year = $(changeYearInput).val();
        	location.href = "?year=" + year + "&deptNo=" + deptNo; 
        });
    });
</script>