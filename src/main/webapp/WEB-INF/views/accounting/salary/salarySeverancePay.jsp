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
					    <h5 class="card-tit">퇴직금 조회</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/in"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">급여</a></li>
					        <li class="breadcrumb-item active">퇴직금 조회</li>
					      </ol>
					    </nav>
				    </div>
			         
				     <!-- 게시판 헤더 영역 끝 -->
				    <div class="info" style="width: 100%; padding-bottom: 1px;">
					    <p class="cofistooltip">
							 <i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							 <span data-bs-toggle="tooltip" data-bs-placement="top">
								  입사일과 퇴사일의 차이가 1년 이상으로 퇴직금 지급 대상인 직원목록 입니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*목록을 클릭하면 퇴직금 정보가 표시됩니다.
							 </span>
						</p>
					</div>
					<p></p>
											
						   <table class="table datatable table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">사번</th>
                                        <th scope="col">이름</th>
                                        <th scope="col">직급</th>
                                        <th scope="col">부서</th>
                                        <th scope="col">입사일</th>
                                        <th scope="col">퇴사일</th>
                                        <th scope="col">총 수령 급여</th>
                                        <th scope="col">지급퇴직금</th>
                                                                
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${empList }" var="emp">
                                        <tr>
                                            <td scope="row">${emp.empNo }</td>
                                            <td>${emp.empNm }</td>
                                            <td>${emp.empRoleNm }</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${emp.empDeptNo == 1201}">
                                                        <c:choose>
                                                            <c:when test="${emp.empTeam == 31}">인사</c:when>
                                                            <c:when test="${emp.empTeam == 32}">회계</c:when>
                                                            <c:otherwise><!-- 추가: 다른 팀일 경우 기본 값 -->기타팀${emp.empTeam}</c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:when test="${emp.empDeptNo == 1202}">운영</c:when>
                                                    <c:when test="${emp.empDeptNo == 1203}">보안</c:when>
                                                    <c:when test="${emp.empDeptNo == 1204}">인프라</c:when>
                                                    <c:otherwise><!-- 추가: 다른 부서일 경우 기본 값 -->기타부서${emp.empDeptNo}</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${emp.empJoinDt }</td>
                                        <td style="text-align: right; color: blue;">${emp.empResignDt}</td>


                                       <td>
										    <c:set var="currentEmpNo" value="${emp.empNo}" />
										    <c:set var="totalSalaryBasic" value="0" />
										    
										    <c:forEach items="${salary}" var="salaryItem">
										        <c:if test="${salaryItem.empEmpNo == currentEmpNo}">
										            <c:set var="totalSalaryBasic" value="${totalSalaryBasic + salaryItem.salBasic}" />
										        </c:if>
										    </c:forEach>					    
										 
										    <fmt:formatNumber type="currency" value="${totalSalaryBasic}" />
										</td>
										<td>
											    <!-- 근속 연월일 구하기 -->
											    <!-- salary 객체에서 직원의 입사일과 퇴사일 정보를 추출하여 연, 월, 일 정보를 가져옴 -->
											        <c:set var="joinYear" value="${emp.empJoinDt.year}" />
												    <c:set var="resignYear" value="${emp.empResignDt.year}" />
												
												    <c:set var="joinMonth" value="${emp.empJoinDt.month.value}" />
												    <c:set var="resignMonth" value="${emp.empResignDt.month.value}" />
												
												    <c:set var="joinDay" value="${emp.empJoinDt.dayOfMonth}" />
												    <c:set var="resignDay" value="${emp.empResignDt.dayOfMonth}" />
											    
											    <!-- 근속 기간 계산 -->
											    <c:set var="yearDifference" value="0" />
											    <c:set var="monthDifference" value="0" />
											    <c:set var="dayDifference" value="0" />
											    
											    <c:choose>
											        <c:when test="${joinYear >= 2000}">
											            <c:set var="yearDifference" value="${resignYear - joinYear}" />
											        </c:when>
											        <c:otherwise>
											            <c:set var="yearsBeforeJoin" value="${2000 - joinYear}" />
											            <c:set var="yearsBeforeResign" value="${(2000 - resignYear) * -1}" />
											            <c:set var="yearDifference" value="${yearsBeforeJoin + yearsBeforeResign}" />
											        </c:otherwise>
											    </c:choose>
											    
											    <c:choose>
											        <c:when test="${resignMonth >= joinMonth}">
											            <c:set var="monthDifference" value="${resignMonth - joinMonth}" />
											        </c:when>
											        <c:otherwise>
											            <c:set var="monthDifference" value="${resignMonth + 12 - joinMonth}" />
											            <c:set var="yearDifference" value="${yearDifference - 1}" />
											        </c:otherwise>
											    </c:choose>
											    
											    <c:choose>
											        <c:when test="${resignDay >= joinDay}">
											            <c:set var="dayDifference" value="${resignDay - joinDay}" />
											        </c:when>
											        <c:otherwise>
											            <c:set var="monthDifference" value="${monthDifference - 1}" />
											            <c:set var="dayDifference" value="${resignDay + 30 - joinDay}" /> 
											        </c:otherwise>
											    </c:choose>
											    
											    <!-- 총 근속 월 계산 -->
											    <c:set var="totalMonths" value="${yearDifference * 12 + monthDifference}" />
											    
											    <!-- 근속 연수, 월수, 일수 계산 -->
											    <c:set var="yearsPart" value="${Math.floor(totalMonths / 12)}" />
											    <c:set var="monthsPart" value="${totalMonths % 12}" />
											    <c:set var="daysPart" value="${dayDifference}" />
											
											    <!-- 이하 퇴직금 계산 -->
											    <c:set var="currentEmpNo" value="${emp.empNo}" />
											    <c:set var="totalSeverancePay" value="0" />
											    <c:set var="count" value="0" />
											    
											   <!-- 연간상여금 -->
												<c:set var="yearExtr" value="0" />
												<c:set var="counts" value="0" />
												<c:forEach items="${salary}" var="salaryItem">
												    <c:if test="${salaryItem.empEmpNo == currentEmpNo && counts < 12}">
												        <c:set var="yearExtr" value="${yearExtr + salaryItem.salExtr}" />
												        <c:set var="counts" value="${counts + 1}" />
												    </c:if>
												</c:forEach>
																				
												<!-- 3개월 합 -->											    
											    <c:forEach items="${salary}" var="salaryItem">
											        <c:if test="${salaryItem.empEmpNo == currentEmpNo && count < 3}">
											            <c:set var="totalSeverancePay" 
											                value="${(totalSeverancePay) + ((salaryItem.salBasic+(yearExtr/12))-salaryItem.salInsCompany)+(salaryItem.salOvertime + salaryItem.salBns)}" />
											            <c:set var="count" value="${count + 1}" />
											        </c:if>
											    </c:forEach>
											    
											    <!-- 퇴직금 계산 -->
											    <c:set var="daysValue" value="${(daysPart * (totalSeverancePay / 3)) / 365}" />
											   <c:set var="monthsValue" value="${monthsPart * ((totalSeverancePay / 3) / 12)}" />
											   <c:set var="yearsValue" value="${yearsPart * (totalSeverancePay / 3)}" />
											
											    
					    					    <!--직원당 퇴직금  -->
											    <fmt:formatNumber type="currency" value="${yearsValue+monthsValue+daysValue}" />
											    
											    <!-- 퇴직금 항목 합 누적 -->
    											<c:set var="totalSeverancePayAll" value="${totalSeverancePayAll + (yearsValue+monthsValue+daysValue)}" />	
    										   	<!-- 수령급여 항목 합 누적 -->
    											<c:set var="totalSalaryAll" value="${totalSalaryAll + totalSalaryBasic}" />										    				        
											</td>							   
                                        </tr>
                                    </c:forEach>
                                </tbody>
                         
                            </table>
                             <!--직원당 퇴직금 총계  -->
    						<p style="text-align: right; font-size: 20px;">지급퇴직금 총 계 : <span style="color: blue;"><fmt:formatNumber type="currency" value="${totalSeverancePayAll}" /></span></p>
						     <!--직원당 급여 총계  -->
						    <p style="text-align: right; font-size: 20px;">지급급여 총 계 : <span style="color: blue;"><fmt:formatNumber type="currency" value="${totalSalaryAll}" /></span></p>

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
                        <h5 class="card-title">직원당 급여 총지급액과 퇴직금 그래프</h5>
                     
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
				<h5 class="modal-title" id="detailsModalLabel">퇴직금 정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" style="overflow-y: auto; max-height: 70vh;">
				<!-- 스크롤 형식 설정 -->
				<div id="modalContent1"></div>
			</div>
			<div class="modal-footer">
				<!-- 모달 하단의 닫기 버튼 -->
         	    <button type="button" class="btn btn-primary" id="pdfDownBtnModal">퇴직금계산서를 PDF로 다운로드</button>		  		
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				
			</div>
		</div>
	</div>
</div>
<!-- End 모달 대화상자 코드 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

<script>
//퇴직금 데이터와 지급급여 데이터 추출 및 가공
var retirementTableRows = document.querySelectorAll(".table.datatable.table-hover tbody tr");
var retirementChartDataMap = new Map(); // 연도를 키로 사용하는 맵

retirementTableRows.forEach(function(row) {
    var columns = row.getElementsByTagName("td");
    if (columns.length >= 6) { // 연도 열을 포함하는지 확인
        var year = columns[5].textContent.trim(); // 연도
        var retirementAmount = parseFloat(columns[7].textContent.trim().replace(/[^0-9.-]+/g, '')); // 퇴직금

        // 맵에 연도가 이미 존재하면 퇴직금을 누적
        if (retirementChartDataMap.has(year)) {
            retirementChartDataMap.set(year, retirementChartDataMap.get(year) + retirementAmount);
        } else {
            retirementChartDataMap.set(year, retirementAmount);
        }
    }
});

var salaryTableRows = document.querySelectorAll(".table.datatable.table-hover tbody tr");
var salaryChartDataMap = new Map(); // 연도를 키로 사용하는 맵

salaryTableRows.forEach(function(row) {
    var columns = row.getElementsByTagName("td");
    if (columns.length >= 6) { // 연도 열을 포함하는지 확인
        var year = columns[5].textContent.trim(); // 연도
        var salaryAmount = parseFloat(columns[6].textContent.trim().replace(/[^0-9.-]+/g, '')); // 지급급여

        // 맵에 연도가 이미 존재하면 지급급여를 누적
        if (salaryChartDataMap.has(year)) {
            salaryChartDataMap.set(year, salaryChartDataMap.get(year) + salaryAmount);
        } else {
            salaryChartDataMap.set(year, salaryAmount);
        }
    }
});

// 퇴직금과 지급급여 데이터 추출
var chartLabels = Array.from(retirementChartDataMap.keys());
var retirementData = Array.from(retirementChartDataMap.values());
var salaryData = Array.from(salaryChartDataMap.values());

// 그래프 생성
var ctx = document.getElementById("salaryChart").getContext("2d");
ctx.canvas.width = 400;
ctx.canvas.height = 200;
var myChart = new Chart(ctx, {
    type: "line",
    data: {
        labels: chartLabels,
        datasets: [{
            label: "퇴직금 지급총액",
            data: retirementData,
            backgroundColor: "rgba(75, 192, 192, 0.2)",
            borderColor: "rgba(75, 192, 192, 1)",
            borderWidth: 1,
        }, {
            label: "지급급여 지급총액",
            data: salaryData,
            backgroundColor: "rgba(255, 99, 132, 0.2)",
            borderColor: "rgba(255, 99, 132, 1)",
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



window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    var message = urlParams.get("message");
    
    if (message !== null && message !== "") {
        alert(message);
    }
};

document.addEventListener("DOMContentLoaded", function() {
	
	// PDF 다운로드 버튼 클릭 핸들러
    document.getElementById("pdfDownBtnModal").addEventListener("click", function() {
        // 모달 내용을 선택
        var modalContent = document.querySelector("#modalContent1");
        var employeeName = document.getElementById("empNmEx").textContent;//이름 salaryDetailEx 에서 아이디로 가져옴
 
        // 모달 내용의 크기를 70%로 조절
        modalContent.style.transform = "scale(0.7)";
        modalContent.style.transformOrigin = "top";

        // 모달 내용을 PDF로 변환
        //format 에 a4 넣으면 페이지 잘려서 직접 사이즈 지정
        var pdfOptions = {
        	marginTop:20, // 여백 설정 (단위: mm)
        	filename: employeeName+"_퇴직금계산서.pdf", // 다운로드될 파일 이름
            image: { type: 'jpeg', quality: 0.98 }, // 이미지 포맷과 퀄리티 설정
            html2canvas: { scale: 2 }, // 화면 크기의 배율 조절
            jsPDF: { unit: 'mm', format: [220, 550], orientation: 'portrait' } // format: a4 // 하면 a4 크기
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
        var empNoElement = this.querySelector("td:nth-child(1)"); // empNo

        if (empNoElement) {
        	 var empNo = empNoElement.textContent.trim();
            // AJAX 상세보기
            var url = "${pageContext.request.contextPath}/accounting/salary/salarySeverancePayEx.do?empNo="+empNo;
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
});


</script>