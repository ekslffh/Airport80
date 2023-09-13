<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<c:url value="/accounting/history/insert.do" var="insertURL"></c:url>
<c:url value="/accounting/history/update.do" var="updateURL"></c:url>
<c:url value="/accounting/history/delete.do" var="deleteURL"></c:url>



<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">${budget.budYear } ${authMember.department.deptNm } 회계내역</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">예산</a></li>
					        <li class="breadcrumb-item active">예산 현황</li>
					      </ol>
					    </nav>
				    </div>
				    
<security:authentication property="principal.realUser" var="authMember" />
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			
<%-- 			<c:if test="${authMember.empDeptNo eq '1201' }"> --%>
<!-- 				<select id="deptSelect" class="form-select" aria-label="Default select example"> -->
<!-- 	                <option selected>부서선택</option> -->
<!-- 	                <option value="1201">경영</option> -->
<!-- 	                <option value="1202">운영</option> -->
<!-- 	                <option value="1203">보안</option> -->
<!-- 	                <option value="1204">인프라</option> -->
<!-- 	            </select> -->
<%-- 			</c:if> --%>
            
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active"></li>
			</ol>
			
			<div class="d-flex" style="text-align:right;">
			<button class="btn btn-sm btn-secondary" data-bs-toggle="modal"
				data-bs-target="#ymModal">연도변경</button>
			</div>	
			<!-- Modal -->
			<div class="modal fade" id="ymModal" tabindex="-1"
				aria-labelledby="ymModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">연도변경
							</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<c:url value="/accounting/history/list.do" var="listURL" />
						<form id="yqForm" method="get" action="${listURL }">
							<div class="modal-body">
								<table class="table table-bordered">
									<tr>
										<th>연도</th>
										<td><input name="budYear" class="form-control" /></td>
									</tr>
								</table>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">변경</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 			<div class="row"> -->
			<!-- 				<div class="col-xl-3 col-md-6"> -->
			<!-- 					<div class="card bg-primary text-white mb-4"> -->
			<!-- 						<div class="card-body">Primary Card</div> -->
			<!-- 						<div -->
			<!-- 							class="card-footer d-flex align-items-center justify-content-between"> -->
			<!-- 							<a class="small text-white stretched-link" href="#">View -->
			<!-- 								Details</a> -->
			<!-- 							<div class="small text-white"> -->
			<!-- 								<i class="fas fa-angle-right"></i> -->
			<!-- 							</div> -->
			<!-- 						</div> -->
			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="col-xl-3 col-md-6"> -->
			<!-- 					<div class="card bg-warning text-white mb-4"> -->
			<!-- 						<div class="card-body">Warning Card</div> -->
			<!-- 						<div -->
			<!-- 							class="card-footer d-flex align-items-center justify-content-between"> -->
			<!-- 							<a class="small text-white stretched-link" href="#">View -->
			<!-- 								Details</a> -->
			<!-- 							<div class="small text-white"> -->
			<!-- 								<i class="fas fa-angle-right"></i> -->
			<!-- 							</div> -->
			<!-- 						</div> -->
			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="col-xl-3 col-md-6"> -->
			<!-- 					<div class="card bg-success text-white mb-4"> -->
			<!-- 						<div class="card-body">Success Card</div> -->
			<!-- 						<div -->
			<!-- 							class="card-footer d-flex align-items-center justify-content-between"> -->
			<!-- 							<a class="small text-white stretched-link" href="#">View -->
			<!-- 								Details</a> -->
			<!-- 							<div class="small text-white"> -->
			<!-- 								<i class="fas fa-angle-right"></i> -->
			<!-- 							</div> -->
			<!-- 						</div> -->
			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="col-xl-3 col-md-6"> -->
			<!-- 					<div class="card bg-danger text-white mb-4"> -->
			<!-- 						<div class="card-body">Danger Card</div> -->
			<!-- 						<div -->
			<!-- 							class="card-footer d-flex align-items-center justify-content-between"> -->
			<!-- 							<a class="small text-white stretched-link" href="#">View -->
			<!-- 								Details</a> -->
			<!-- 							<div class="small text-white"> -->
			<!-- 								<i class="fas fa-angle-right"></i> -->
			<!-- 							</div> -->
			<!-- 						</div> -->
			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div class="row">
				<div class="col-xl-6">
					<div class="card mb-4" style="height: 290px;">
						<div class="card-header">
							<i class="fas fa-chart-area me-1"></i> 월별차트
						</div>
						<div class="card-body">
							<canvas id="myAreaChart" width="100%" height="40"></canvas>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-bar me-1"></i> 계정과목차트
						</div>
						<div class="card-body">
							<div class="container">
							    <div class="row">
							        <div class="col-md-4">
							            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
							                <input type="radio" class="btn-check" name="incomeExpense" id="incomeBtn" autocomplete="off" checked>
							                <label class="btn btn-outline-primary" for="incomeBtn">수입</label>
							                <input type="radio" class="btn-check" name="incomeExpense" id="expenseBtn" autocomplete="off">
							                <label class="btn btn-outline-primary" for="expenseBtn">지출</label>
							            </div>
							        </div>
							        <div class="col-md-8">
							            <select id="quarterSelect" class="form-select" aria-label="Default select example">
							                <option selected>분기선택</option>
							                <option value="Q1">1분기</option>
							                <option value="Q2">2분기</option>
							                <option value="Q3">3분기</option>
							                <option value="Q4">4분기</option>
							            </select>
							        </div>
							    </div>
							</div>
							<canvas id="myDnutChart" width="100%" height="40"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<button id="addAccBtn" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#exampleModal">추가</button>
					<i class="fas fa-table me-1">회계내역</i>
				</div>
				<div class="card-body">
					<table id="datatablesSimple" class="accTbl">
						<thead>
							<tr>
								<th>내역코드</th>
								<th>사용일</th>
								<th>계정과목</th>
								<th>입/출</th>
								<th>금액</th>
<!-- 								<th>메모</th> -->
								<th>작성자</th>
								<th>작성일</th>
<!-- 								<th>영수증</th> -->
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>내역코드</th>
								<th>사용일</th>
								<th>계정과목</th>
								<th>입/출</th>
								<th>금액</th>
<!-- 								<th>메모</th> -->
								<th>작성자</th>
								<th>작성일</th>
<!-- 								<th>영수증</th> -->
							</tr>
						</tfoot>
						<tbody>
							<c:forEach items="${histories }" var="history">
								<tr data-use-ts="${history.accUseTs }" data-bs-toggle="modal"
									data-bs-target="#exampleModal">
									<td><a href="javascript:;" data-bs-toggle="modal"
										data-bs-target="#exampleModal" class="btn btn-warning btn-sm"
										data-acc-id="${history.accId }"
										data-use-ts="${history.accUseTs }"
										data-aca-id="${history.accAcaId }"
										data-type="${history.accType }" data-amt="${history.accAmt }"
										data-memo="${history.accMemo }"> ${history.accId } </a></td>
									<td>${fn:substring(history.accUseTs, 0, 10)}</td>
									<td>${history.category.acaNm }</td>
									<td>${history.accType }</td>
									<td>  <fmt:formatNumber value="${history.accAmt}" type="currency" currencySymbol="₩ " /></td>
<%-- 									<td>${history.accMemo }</td> --%>
									<td>${history.writer.empNm }</td>
									<td>${fn:substring(history.accCrtTs, 0, 10)}</td>
<%-- 									<td><c:if --%>
<%-- 											test="${not empty history.fileGroup and not empty history.fileGroup.detailList }"> --%>
<%-- 											<c:forEach items="${history.fileGroup.detailList }" --%>
<%-- 												var="fileDetail"> --%>
<%-- 												<c:url value="/download.do" var="downloadURL"> --%>
<%-- 													<c:param name="atchFileId" --%>
<%-- 														value="${fileDetail.atchFileId }" /> --%>
<%-- 													<c:param name="fiSn" value="${fileDetail.fiSn }" /> --%>
<%-- 												</c:url> --%>
<%-- 												<a href="${downloadURL }">${fileDetail.fiOriginNm }</a> --%>
<%-- 											</c:forEach> --%>
<%-- 										</c:if></td> --%>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	<footer class="py-4 bg-light mt-auto">
		<div class="container-fluid px-4">
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-muted">Copyright &copy; Your Website 2021</div>
				<div>
					<a href="#">Privacy Policy</a> &middot; <a href="#">Terms &amp;
						Conditions</a>
				</div>
			</div>
		</div>
	</footer>
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
				<h5 class="modal-title" id="exampleModalLabel">회계내역</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form id="accForm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="accId" />
				<div class="modal-body">
					<input type="hidden" name="accWriter" value="${authMember.empNo }" />
					<table class="table table-border">
						<tr>
							<th>사용일시</th>
							<td><input name="accUseTs" class="form-control"
								type="datetime-local" /></td>
						</tr>
						<tr>
							<th>계정과목</th>
							<td><select name="accAcaId" class="form-select">
									<option value="" label="분류선택" />
									<c:forEach items="${categories}" var="category">
										<option value="${category.acaId}">${category.acaNm}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<th>유형</th>
							<td>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox"
										id="incomeCheckbox" value="수입"> <label
										class="form-check-label" for="incomeCheckbox">수입</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox"
										id="expenseCheckbox" value="지출"> <label
										class="form-check-label" for="expenseCheckbox">지출</label>
								</div>
							</td>
						</tr>
						<tr>
							<th>사용금액</th>
							<td><input name="accAmt" class="form-control" type="number" />
							</td>
						</tr>
						<tr>
							<th>비고</th>
							<td><input name="accMemo" class="form-control" /></td>
						</tr>
						<tr>
							<th>영수증</th>
							<td><input type="file" name="accFiles" class="form-control" />
							</td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">제출</button>
					<button id="delBtn" onclick="fn_deleteHistory()" type="button"
						class="btn btn-danger">삭제</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
    $("#incomeCheckbox, #expenseCheckbox").on("change", function() {
        // 모든 체크박스를 언체크
        $("#incomeCheckbox, #expenseCheckbox").not(this).prop("checked", false);
    });
    
    $("#accForm").submit(function(e) {
        e.preventDefault(); // 기본 제출 동작을 막습니다.
		
        // accForm에서 데이터 가져오기
        var formData = new FormData(this);
        // 수입, 지출 체크박스에서 값 가져오기
        var accTypeChkBox = $("input[type='checkbox']:checked")[0];
        console.log("checkbox", accTypeChkBox);
        // 체크박스 체크안하면 리턴
        if (accTypeChkBox == undefined) {
        	alert("수입이나 지출을 선택해주세요.");
        	return;
        }
        // 체크박스 값 가져와서 formData에 넣어주기
        var accType = accTypeChkBox.value;
        formData.append("accType", accType);
		
	    // formData의 값을 확인하고 콘솔에 출력
        for (var pair of formData.entries()) {
            console.log(pair[0] + ': ' + pair[1]);
        }
	    
	    let url = $(accForm).attr('action');
	    
        $.ajax({
            type: "POST",
            url: url,
            data: formData,
            dataType: 'json',
            processData: false, // FormData를 처리하지 않도록 설정
            contentType: false, // 내용 형식을 설정하지 않도록 설정
            success: function(response) {
            	if (response.result == 'success') {
                    // 성공 시 수행할 작업
                    console.log("성공:", response);
					location.href = "";
            	} else { // fail
            		alert("실패: " + response.message)
            	}
            },
            error: function(xhr, status, error) {
                // 오류 시 수행할 작업
                console.log("오류:", xhr.responseText);
            }
        });
    });
});

function fn_deleteHistory() {
	let accId = $('input[name="accId"]').val();
	let data = {accId: accId};
	let settings = {
		url : "${deleteURL }",
		method : "post",
		data : data,
		dataType : "json",
		success : function(resp) {
			if (resp.result == "success") {
				alert("삭제 성공");
			} else { // fail
				alert("삭제 실패 : "+ resp.message);
			}
			location.href = "";
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		} //request line,header,body -> response processing
	};
	$.ajax(settings);
}

$(exampleModal)
	.on(
		"show.bs.modal",
		function(event) {
			// 모달창을 부른 타겟찾기 (추가버튼 or 수정/삭제버튼)
			const rTarget = event.relatedTarget;
			console.log(rTarget);
			
			if (rTarget.id == "addAccBtn") { // 회계내역추가
				// 모달창 제목 변경
				$(exampleModalLabel).text("회계내역추가");
				// form의 action을 insert.do로 변경
				$(accForm).attr("action","${insertURL}");
				console.log($(accForm).attr("action"));
				
				$(delBtn).hide();
			} else { // 계약정보 수정
				$(delBtn).show();
				
				// 모달창 제목 변경
				$(exampleModalLabel).text("회계내역수정");
				
				// form의 action을 update.do로 변경
				$(accForm).attr("action","${updateURL }");
				console.log($(accForm).attr("action"));

				let useTs = rTarget.dataset['useTs'];
				let acaId = rTarget.dataset['acaId'];
				let type = rTarget.dataset['type'];
				let amt = rTarget.dataset['amt'];
				let memo = rTarget.dataset['memo'];
				let accId = rTarget.dataset['accId'];	
				
				// 모달창 내부에 있는 input요소 3개 찾아서 기존값 집어넣기
				var useTsInput = $('input[name="accUseTs"]');
				var acaIdInput = $('select[name="accAcaId"]');
				var typeInput = $('input[name="accType"]');
				var amtInput = $('input[name="accAmt"]');
				var memoInput = $('input[name="accMemo"]');
				var accIdInput = $('input[name="accId"]');
				
				useTsInput.val(useTs);
				acaIdInput.val(acaId);
				amtInput.val(amt);
				memoInput.val(memo);
				accIdInput.val(accId);
				
				if (type == '수입') {
					// 수입 체크박스를 체크
					$('#incomeCheckbox').prop('checked', true);
				} else { // 지출
					// 지출 체크박스를 체크
					$('#expenseCheckbox').prop('checked', true);
				}
			}
		}).on("hidden.bs.modal", function() {
			// 모달창 닫을 때 input창 초기화하기
			$('input[name="accUseTs"]').val('');
			$('select[name="accAcaId"]').val('');
			$('input[name="accType"]').val('');
			$('input[name="accAmt"]').val('');
			$('input[name="accMemo"]').val('');
			$('#incomeCheckbox').prop('checked', false);
			$('#expenseCheckbox').prop('checked', false);
});
</script>

<!-- <script -->
<!-- 	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" -->
<!-- 	crossorigin="anonymous"></script> -->
<script
	src="${pageContext.request.contextPath }/resources/account/history/js/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath }/resources/account/history/assets/demo/chart-area-demo.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath }/resources/account/history/assets/demo/chart-bar-demo.js"></script> --%>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath }/resources/account/history/js/datatables-simple-demo.js"></script>

<script type="text/javascript">

//historyObj를 가지고 차트 데이터 만들어내기
// 바로 historyObj꺼내기 (알아서 파싱해주는 듯)
var historyObj = ${historiesToJson};

console.log("hello", historyObj);

//월별로 수입과 지출을 누적할 객체 생성
var monthlyIncome = {};
var monthlyExpense = {};

// 객체 배열 반복
historyObj.forEach(function(item) {
// 	// 최대값 구하기.?
// 	if (item.accAmt > maxAmt) maxAmt = item.accAmt;
	
    // accUseTs에서 월 추출
    var date = new Date(item.accUseTs);
    var month = date.getMonth() + 1; // 월은 0부터 시작하므로 1을 더합니다.
	
    // 해당 월의 누적 값이 없으면 초기화
    if (item.accType === '수입') {
        if (!monthlyIncome[month]) {
            monthlyIncome[month] = 0;
        }
        monthlyIncome[month] += item.accAmt;
    } else if (item.accType === '지출') {
        if (!monthlyExpense[month]) {
            monthlyExpense[month] = 0;
        }
        monthlyExpense[month] += item.accAmt;
    }
});

// 결과를 배열로 변환
var monthlyIncomeArray = [];
var monthlyExpenseArray = [];

// var maxAmt = 0;

for (var i = 1; i <= 12; i++) {
    // 결과가 없는 경우 0으로 처리
    var incomeTotal = monthlyIncome[i] || 0;
    var expenseTotal = monthlyExpense[i] || 0;
    
//     // 월별 수입,지출 포함해서 최대값 구하기 => y축 최대값으로 사용예정..?
//     if (maxAmt < incomeTotal) maxAmt = incomeTotal;
//     if (maxAmt < expenseTotal) maxAmt = expenseTotal;
    
    monthlyIncomeArray.push(incomeTotal);
    monthlyExpenseArray.push(expenseTotal);
}

// console.log("maxAmt", maxAmt);

// Chart 그리기
//Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        datasets: [{
            label: "수입", // 수입 데이터셋
            lineTension: 0.3,
            backgroundColor: "rgba(255,105,180,0.2)", // 핑크색 배경
            borderColor: "rgba(255,105,180,1)", // 핑크색 선
            pointRadius: 5,
            pointBackgroundColor: "rgba(255,105,180,1)",
            pointBorderColor: "rgba(255,255,255,0.8)",
            pointHoverRadius: 5,
            pointHoverBackgroundColor: "rgba(255,105,180,1)",
            pointHitRadius: 50,
            pointBorderWidth: 2,
            data: monthlyIncomeArray,
        }, {
            label: "지출", // 지출 데이터셋
            lineTension: 0.3,
            backgroundColor: "rgba(0,191,255,0.2)", // 하늘색 배경
            borderColor: "rgba(0,191,255,1)", // 하늘색 선
            pointRadius: 5,
            pointBackgroundColor: "rgba(0,191,255,1)",
            pointBorderColor: "rgba(0,191,255,1)",
            pointHoverRadius: 5,
            pointHoverBackgroundColor: "rgba(0,191,255,1)",
            pointHitRadius: 50,
            pointBorderWidth: 2,
            data: monthlyExpenseArray,
        }],
    },
    options: {
        scales: {
            // ... (기존 설정 내용)
            yAxes: [{
                ticks: {
                    min: 0,
                    maxTicksLimit: 5,
                    callback: function(value, index, values) {
                        // 금액에 천 단위로 쉼표 추가
                        return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    }
                },
                gridLines: {
                    color: "rgba(0, 0, 0, .125)",
                }
            }],
        },
        legend: {
            display: true // 범례 표시
        }
    }

});


// 이번에는 카테고리별 값 더해서 최대값부터 출력해주기
// 결과를 저장할 객체
var incomeResult = {'Q1': {}, 'Q2': {}, 'Q3': {}, 'Q4': {}};
var expenseResult = {'Q1': {}, 'Q2': {}, 'Q3': {}, 'Q4': {}};

var selectedQuarter;

// historyObj를 순회하면서 데이터 더하기
historyObj.forEach(function(item) {
    // accUseTs를 기반으로 해당 월과 분기 찾기
    var date = new Date(item.accUseTs);
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var quarter;

    if (month >= 1 && month <= 3) {
        quarter = "Q1";
    } else if (month >= 4 && month <= 6) {
        quarter = "Q2";
    } else if (month >= 7 && month <= 9) {
        quarter = "Q3";
    } else {
        quarter = "Q4";
    }
    
//     if (!monthlyExpense[month]) {
//         monthlyExpense[month] = 0;
//     }
    var categoryNm = item.category.acaNm;
    // 수입, 지출 구분하기
    if (item.accType === '수입') {
    	// 각 분기에 맞게 넣는데 기존에 값이 들어가있지 않았으면 그대로 배정해주고
    	if (!incomeResult[quarter][categoryNm]) {
    		incomeResult[quarter][categoryNm] = item.accAmt;
    	} else { // 값이 기존에 들어가있었으면 amt 더해주기
    		incomeResult[quarter][categoryNm] += item.accAmt;
    	}
    } else { // 지출
    	// 각 분기에 맞게 넣는데 기존에 값이 들어가있지 않았으면 그대로 배정해주고
    	if (!expenseResult[quarter][categoryNm]) {
    		expenseResult[quarter][categoryNm] = item.accAmt;
    	} else { // 값이 기존에 들어가있었으면 amt 더해주기
    		expenseResult[quarter][categoryNm] += item.accAmt;
    	}
    }
});

console.log("incomeResult", incomeResult);
console.log("expenseResult", expenseResult);

//현재 날짜 객체 생성
var currentDate = new Date();

// 현재 월을 가져오기 (0부터 시작하므로 +1)
var currentMonth = currentDate.getMonth() + 1;

// 현재 분기 계산
var currentQuarter;
if (currentMonth >= 1 && currentMonth <= 3) {
    currentQuarter = "Q1";
} else if (currentMonth >= 4 && currentMonth <= 6) {
    currentQuarter = "Q2";
} else if (currentMonth >= 7 && currentMonth <= 9) {
    currentQuarter = "Q3";
} else {
    currentQuarter = "Q4";
}

selectedQuarter = currentQuarter; 
$(quarterSelect).val(selectedQuarter);

//객체를 배열로 변환
console.log("ddd", incomeResult[selectedQuarter]);

var myDonutChart;
function makeDonutChart(rawData) {
	// 이전 차트를 파괴
	if (myDonutChart) {
		console.log("이전 차트 삭제?");
		myDonutChart.destroy();
	}
	
	var dataArray = Object.entries(rawData);

	// 배열을 내림차순으로 정렬
	dataArray.sort(function(a, b) {
	    // 두 개의 배열 항목을 비교하여 내림차순으로 정렬
	    return b[1] - a[1];
	});

	//key와 value를 따로 추출하여 새로운 배열에 저장
	var keysArray = dataArray.map(function(item) {
	    return item[0]; // key 추출
	});

	var valuesArray = dataArray.map(function(item) {
	    return item[1]; // value 추출
	});
	
	var ctx = document.getElementById("myDnutChart");
	myDonutChart = new Chart(ctx, {
	    type: 'doughnut',
	    data: {
	      labels: keysArray,
	      datasets: [{
	        label: 'My First Dataset',
	        data: valuesArray,
	        backgroundColor: [
	            'rgb(255, 99, 132)',
	            'rgb(54, 162, 235)',
	            'rgb(255, 205, 86)',
	            'rgb(75, 192, 192)',
	            'rgb(153, 102, 255)',
	            'rgb(255, 159, 64)',
	            'rgb(255, 0, 0)',       // 빨간색 추가
	            'rgb(0, 255, 0)',       // 녹색 추가
	            'rgb(0, 0, 255)',       // 파란색 추가
	            'rgb(128, 128, 128)',   // 회색 추가
	            // 필요한 만큼 다른 색상 추가
	        ],
	        hoverOffset: 4
	      }]
	    }
	  });
}

// Bar Chart Example
makeDonutChart(incomeResult[selectedQuarter]);
 
$(function() {
	$(incomeBtn).on('click', function() {
		console.log("수입버튼 클릭!");
		makeDonutChart(incomeResult[selectedQuarter]);
	});
	$(expenseBtn).on('click', function() {
		console.log("지출버튼 클릭!");
		makeDonutChart(expenseResult[selectedQuarter]);
	});
})

var chart = c3.generate({
    bindto: '#myDnutChart',
    data: {
      columns: [
        ['data1', 30, 200, 100, 400, 150, 250],
        ['data2', 50, 20, 10, 40, 15, 25]
      ],
      axes: {
        data2: 'y2' // ADD
      }
    },
    axis: {
      y2: {
        show: true // ADD
      }
    }
});

$(quarterSelect).on('change', function() {
	console.log($(this).val());
	var value = $(this).val();
	selectedQuarter = value;
	makeDonutChart(incomeResult[selectedQuarter]);
})
</script>