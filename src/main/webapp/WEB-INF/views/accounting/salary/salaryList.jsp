<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>

<section class="section">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">급여 지급 관리</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/in"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">급여</a></li>
					        <li class="breadcrumb-item active">급여 지급 관리</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->
				    <div class="info" style="width: 100%; padding-bottom: 1px;">
					    <p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							 <span data-bs-toggle="tooltip" data-bs-placement="top">
							     목록 클릭 시 급여명세서가 나타나고, 급여명세서 하단에 처리버튼이 있습니다. <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;우측 하단 당월 일괄 처리시 전체목록을 처리합니다.
							 </span>
						</p>
					</div>
					<p></p>										
						<table class="table datatable table-hover">									
							<thead>
								<tr>
									<th scope="col">처리번호</th>
									<th scope="col">월분</th>
									<th scope="col">지급액</th>
<!-- 									<th scope="col">사원번호</th> -->
									<th scope="col">입사일</th>
									<th scope="col">사원이름</th>
									<th scope="col">부서명</th>
									<th scope="col">직급</th>
									<th scope="col">급여담당자</th>
									<th scope="col">지급여부</th>
									<th scope="col">지급일</th>
									<th scope="col">급여대장</th>
									<th scope="col"><c:choose>
											<c:when test="${loginEmpNo.startsWith('1201')}">
												<%--회계부서일 때만--%>
										           처리
										   	   </c:when>
										</c:choose></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${salList}" var="salary">
									<tr>
										<td scope="row">${salary.salId}</td>
										<td>${salary.salCrtTs.substring(0, 7)}</td>
										<td><fmt:formatNumber type="currency" value="${salary.salTotal}" /></td>
<%-- 										<td>${salary.emp.empNo}</td> --%>
										<td>${salary.emp.empJoinDt}</td>
										<td>${salary.emp.empNm}</td>
										<td>${salary.deptNm}</td>
										<td>${salary.emp.empRoleNm}</td>
										<td>${salary.salEmpNm}</td>
										<td
											style="color: ${salary.salPayDt == null ? 'red' : 'blue'};">
											${salary.salPayDt == null ? '미지급' : '지급완료'}</td>
										<td
											style="color: ${salary.salPayDt == null ? 'red' : 'blue'};">
											${salary.salPayDt == null ? '미지급' : salary.salPayDt.substring(0, 10)}
										</td>
										<td style="text-align: center;">
										    <c:choose>
										        <c:when test="${salary.salPayDt == null}">
										            <!-- 지급 상태여부 -->
										            <span style="color: red;">처리 대기</span>
										        </c:when>
										        <c:otherwise>
										            <!-- 지급 시 다운로드 표시 -->
										            <a href="${pageContext.request.contextPath}/accounting/salary/downloadSalaryExcel?salId=${salary.salId}" onclick="event.stopPropagation();">
    													  <i class="bi bi-download" style="font-size: 24px; vertical-align: middle;"></i>
										            </a>
										        </c:otherwise>
										    </c:choose>
										
										</td>
										<td><c:choose>
												<c:when test="${loginEmpNo.startsWith('1201')}">
													<!-- 회계부서일 때만 -->
													<c:choose>
														<c:when test="${salary.salPayDt == null}">
															<!-- 지급 상태여부 -->
															<span style="color: red;">대기</span>
														</c:when>
														<c:otherwise>
															<!-- 지급 시 처리 완료 메시지 표시 -->
															<span style="color: blue;">완료</span>
														</c:otherwise>
													</c:choose>

												</c:when>
												<c:otherwise>
													<!-- 회계부서가 아닐 때 처리 -->
													<!-- 원하는 내용 추가 -->
												</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
							<a style="float: right;" class="btn btn-primary" href="javascript:void(0);" onclick="openSmallWindow('${pageContext.request.contextPath}/accounting/salary/salaryStatusUpdate.do', 'smallWindow', 600, 400)">당월 일괄 처리</a>
					</div>
				</div>
			</div>
		</div>
		
	</section>
	
<section class="section2">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <!-- 게시판 헤더 영역 시작 -->
                    <div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;">
                        <h5 class="card-title">급여 지급 월별 그래프</h5>
                     
                    </div>
                    <canvas id="salaryChart"></canvas>
                </div>
            </div>
        </div>
    </div>
</section>




<%-- 상세보기 모달 대화상자 코드 --%>
<div id="detailsModal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="detailsModalLabel">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="detailsModalLabel">급여 상세 정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" style="overflow-y: auto; max-height: 70vh;">
				<!-- 스크롤 형식 설정 -->
				<div id="modalContent1"></div>
			</div>
			<div class="modal-footer">
				<!-- 모달 하단의 닫기 버튼 -->
         	    <button type="button" class="btn btn-primary" id="pdfDownBtnModal">급여명세서를 PDF로 다운로드</button>		  		
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				
			</div>
		</div>
	</div>
</div>
<!-- End 모달 대화상자 코드 -->


<%-- 수정 대화상자 코드 --%>
<div id="updateModal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="updateModalLabel">
	<div class="modal-dialog modal-xs" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="updateModalLabel">급여 승인</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" style="overflow-y: auto; max-height: 70vh;">
				<!-- 스크롤 형식 설정 -->
				<div id="modalContent2"></div>
			</div>
			<div class="modal-footer">

			</div>
		</div>
	</div>
</div>
<!-- End 모달 대화상자 코드 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

<script>
//테이블 데이터를 JavaScript 객체로 추출
var tableRows = document.querySelectorAll(".table.datatable.table-hover tbody tr");
var chartDataMap = new Map(); // 월분을 키로 사용하는 맵

tableRows.forEach(function(row) {
    var columns = row.getElementsByTagName("td");
    if (columns.length >= 3) {
        var month = columns[1].textContent.trim(); // 월분
        var amount = parseFloat(columns[2].textContent.trim().replace(/[^0-9.-]+/g, '')); // 지급액

        // 맵에 월분이 이미 존재하면 지급액을 누적
        if (chartDataMap.has(month)) {
            chartDataMap.set(month, chartDataMap.get(month) + amount);
        } else {
            chartDataMap.set(month, amount);
        }
    }
});

// 맵에서 월분과 지급액 데이터를 추출
var chartLabels = Array.from(chartDataMap.keys()) 
var chartData = Array.from(chartDataMap.values()) 

// 그래프 생성
var ctx = document.getElementById("salaryChart").getContext("2d");
ctx.canvas.width = 400; // 원하는 가로 크기로 설정
ctx.canvas.height = 200; // 원하는 세로 크기로 설정
var myChart = new Chart(ctx, {
    type: "line",
    data: {
        labels: chartLabels,
        datasets: [{
            label: "월별 급여 지급총액",
            data: chartData,
            backgroundColor: [
                "rgba(75, 192, 192, 0.2)",
                "rgba(255, 99, 132, 0.2)",
                "rgba(54, 162, 235, 0.2)",
                "rgba(255, 206, 86, 0.2)",
                "rgba(153, 102, 255, 0.2)",
                "rgba(255, 159, 64, 0.2)",
            ],
            borderColor: [
                "rgba(75, 192, 192, 1)",
                "rgba(255, 99, 132, 1)",
                "rgba(54, 162, 235, 1)",
                "rgba(255, 206, 86, 1)",
                "rgba(153, 102, 255, 1)",
                "rgba(255, 159, 64, 1)",
            ],
            borderWidth: 1,
        }],
    },
    options: {
        scales: {
            y: {
                beginAtZero: true,
            },
        },
    },
});
//일괄산정 작은 폼
function openSmallWindow(url, name, width, height) {
	  var screenWidth = window.screen.availWidth;
      var screenHeight = window.screen.availHeight;
      var left = (screenWidth - width) / 2;
      var top = (screenHeight - height) / 3;
      window.open(url, name, 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
}

window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    var message = urlParams.get("message");
    
    if (message !== null && message !== "") {
        // 메시지가 존재하면 SweetAlert2로 표시
        Swal.fire({
            title: "메시지",
            text: message,
            icon: "success",
            confirmButtonText: "확인"
        }).then(function() {
            // 확인 버튼을 누르면, localStorage에 표시 여부를 저장
            localStorage.setItem("messageDisplayed", "true");
        });
    }

    // 이미 메시지를 표시한 경우 다시 표시하지 않도록 검사
    var hasMessageDisplayed = localStorage.getItem("messageDisplayed");
    if (hasMessageDisplayed === "true") {
        // 메시지를 이미 표시한 경우, 다시 표시하지 않음
        urlParams.delete("message");
        history.replaceState(null, null, "?" + urlParams.toString());
    }
};


document.addEventListener("DOMContentLoaded", function() {
	
	// PDF 다운로드 버튼 클릭 핸들러
    document.getElementById("pdfDownBtnModal").addEventListener("click", function() {
        // 모달 내용을 선택
        var modalContent = document.querySelector("#modalContent1");
        var employeeName = document.getElementById("empNmEx").textContent;//이름 salaryDetailEx 에서 아이디로 가져옴
        var salDate = document.getElementById("salDateEx").textContent; //날짜를 salaryDetailEx 에서 가져옴
        salDate = salDate.substring(0, salDate.length - 4); // 일자는 지우기
        // 모달 내용의 크기를 70%로 조절
        modalContent.style.transform = "scale(0.7)";
        modalContent.style.transformOrigin = "top";

        // 모달 내용을 PDF로 변환
        //format 에 a4 넣으면 페이지 잘려서 직접 사이즈 지정
        var pdfOptions = {
        	marginTop:20, // 여백 설정 (단위: mm)
        	filename: employeeName+"_"+salDate+"_급여명세서.pdf", // 다운로드될 파일 이름
            image: { type: 'jpeg', quality: 0.98 }, // 이미지 포맷과 퀄리티 설정
            html2canvas: { scale: 2 }, // 화면 크기의 배율 조절
            jsPDF: { unit: 'mm', format: [220, 400], orientation: 'portrait' } // format: a4 // 하면 a4 크기
        };

        html2pdf().set(pdfOptions).from(modalContent).save();

        // 모달 내용의 크기 원래대로 복원
        modalContent.style.transform = "";
        modalContent.style.transformOrigin = "";

        // 모달 닫기 (선택사항)
        $("#detailsModal").modal("hide");
    });

	
    // Row click handler function
    function rowClickHandler(event) {
        event.stopPropagation();
        var empNoElement = this.querySelector("td:nth-child(1)"); // salId

        if (empNoElement) {
            var salId = empNoElement.textContent.trim();

            // AJAX 상세보기
            var url = "${pageContext.request.contextPath}/accounting/salary/salaryDetail.do?salId=" + salId;
            var xhr = new XMLHttpRequest();
            xhr.open("GET", url, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        var modalContent = xhr.responseText;
                        document.querySelector("#modalContent1").innerHTML = modalContent;
                        $("#detailsModal").modal("show");
                    } else {
                        alert("상세 정보를 가져올 수 없습니다.");
                    }
                }
            };
            xhr.send();
        } else {
            alert("페이지를 찾을 수 없습니다.");
        }
    }

    // Update 행클릭 핸들러
    function updateRowClickHandlers(rows) {
        rows.forEach(function(row) {
            row.addEventListener("click", rowClickHandler);
        });
    }

    var rows = document.querySelectorAll("tbody tr[data-index]");
    updateRowClickHandlers(rows);

    var datatableSelector = document.querySelector('.datatable-selector'); // 테이블 페이지 단위 선택
    
    // 페이지 변환시
    datatableSelector.addEventListener('change', function() {
        var newRows = document.querySelectorAll(".table.datatable.table-hover tbody tr[data-index]");
        updateRowClickHandlers(newRows);
    });

    //검색시
    var search = document.querySelectorAll('.datatable-input'); // 검색 입력 필드
    search.forEach(function(inputField) {
        inputField.addEventListener('input', function() {
            var newRows = document.querySelectorAll(".table.datatable.table-hover tbody tr[data-index]");
            updateRowClickHandlers(newRows);
        });
    });
    
 // 페이지가 로드될 때 실행되는 함수
    window.addEventListener("load", function() {
        // 첫 번째 정렬 버튼에 대한 클릭 이벤트를 시뮬레이트
        simulateClickOnFirstSortButton();
        simulateClickOnFirstSortButton();
        // 두번해서 내림차순으로
    });

    // 첫 번째 정렬 버튼에 대한 클릭 이벤트를 시뮬레이트하는 함수
    function simulateClickOnFirstSortButton() {
        var sortButtons = document.querySelectorAll(".datatable-sorter"); // 정렬 버튼의 클래스나 선택자를 확인하셔야 합니다.
        if (sortButtons.length > 0) {
            sortButtons[0].click(); // 첫 번째 정렬 버튼에 클릭 이벤트 시뮬레이트
        }
    }

});

function openUpdateModal(salId) {
	var modal = $('#updateModal');

	var url = "${pageContext.request.contextPath}/accounting/salary/salaryStatusUpdate.do?salId="
			+ salId;

	$.ajax({
		url : url,
		method : "GET",
		success : function(data) {
			// Update the modal content with the retrieved data
			document.querySelector("#modalContent2").innerHTML = data;
			$("#updateModal").modal("show");
		},
		error : function() {
			alert("불러오는데 실패했습니다");
		}
	});
}
</script>