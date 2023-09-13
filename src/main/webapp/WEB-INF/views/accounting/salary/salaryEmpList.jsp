<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.main-container {
    display: flex;
    justify-content: space-between;
    margin-top: 2%;
}

.main-content {
    width: 40%; /* 두 메인 페이지를 좌우로 배치 */
}
.main-content:hover {
    cursor: pointer;
}
</style>

<main class="main-container">
    <div class="main-content">
        <section class="section">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card" style="width: 480px;">
                        <div class="card-body">
                          <!-- 게시판 헤더 영역 시작 -->
							<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
							    <h5 class="card-tit">재직 중인 직원 목록</h5>
							    <nav>
							      <ol class="breadcrumb">
							        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/in"><i class="bi bi-house-door"></i></a></li>
							        <li class="breadcrumb-item"><a href="#">급여</a></li>
							        <li class="breadcrumb-item active">급여 산정</li>
							      </ol>
							    </nav>
						    </div>
						     <div class="info" style="width: 100%; padding-bottom: 1px;">
							    <p class="cofistooltip">
							        <i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							        <span data-bs-toggle="tooltip" data-bs-placement="top">
							            목록을 클릭하면 지급정보가 우측에 표시됩니다. <br>
							             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 하단 당월 일괄 산정 클릭시 전체 직원들에 대해<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 당월급여가 산정됩니다. <br>
							             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 일괄 산정시 기존에 산정된 인원은<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 기존정보를 유지합니다.</p>
							        </span>
							    </p>
							</div>
									<p><p>
						    
				 	   <!-- 게시판 헤더 영역 끝 -->
                            <table class="table datatable table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">사번</th>
                                        <th scope="col">이름</th>
                                        <th scope="col">직급</th>
                                        <th scope="col">소속 부서</th>
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
                                        </tr>
                                    </c:forEach>
                                </tbody>                              
                            </table>
                            <a style="float: right;" class="btn btn-primary" href="javascript:void(0);" onclick="openSmallWindow('${pageContext.request.contextPath}/accounting/salary/salaryInsert.do', 'smallWindow', 600, 400)">당월 일괄 산정</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

<div class="main-content">
    <div class="sec-content" style="max-height: 800px; overflow-y: scroll; overflow-x: hidden; margin-left: -30%;">
        <!-- Content you want to make scrollable goes here -->
        직원을 선택해주세요
    </div>
</div>


</main>

<script>
document.addEventListener("DOMContentLoaded", function() {
    var rows = document.querySelectorAll(".table.datatable.table-hover tbody tr[data-index]");

    var paginationItems = document.querySelectorAll('.datatable-pagination-list-item'); // 페이징 아이템
    var search = document.querySelectorAll('.datatable-input'); // 검색 입력 필드
    var datatableSelector = document.querySelector('.datatable-selector'); // 테이블 페이지 단위 선택
	
    paginationItems.forEach(function(item) { // 페이지 이동시 클릭이벤트
        item.addEventListener('click', function() {
            const page = this.querySelector('.datatable-pagination-list-item-link').getAttribute('data-page');
            setTimeout(function() {
                var newRows = document.querySelectorAll(".table.datatable.table-hover tbody tr[data-index]");
                var rowsPerPage = newRows.length; // 재계산된 페이지당 행 수

                // 기존 행 클릭 이벤트 핸들러를 제거
                rows.forEach(function(row) {
                    row.removeEventListener("click", rowClickHandler);
                });

                // 클릭 이벤트 핸들러를 각 행에 다시 연결
                newRows.forEach(function(row) {
                    row.addEventListener("click", rowClickHandler);
                });

                // 클릭 이벤트 트리거 재시뮬레이트
                simulateClickOnFirstRow();
            }, 0);
        });
    });
    
    //행선택시
    datatableSelector.addEventListener('change', function() {
		var selectedValue = datatableSelector.value;
		 setTimeout(function() {
             var newRows = document.querySelectorAll(".table.datatable.table-hover tbody tr[data-index]");
             var rowsPerPage = newRows.length; // 재계산된 페이지당 행 수

             // 기존 행 클릭 이벤트 핸들러를 제거
             rows.forEach(function(row) {
                 row.removeEventListener("click", rowClickHandler);
             });
             // 클릭 이벤트 핸들러를 각 행에 다시 연결
             newRows.forEach(function(row) {
                 row.addEventListener("click", rowClickHandler);
             });
             // 클릭 이벤트 트리거 재시뮬레이트
             simulateClickOnFirstRow();
         }, 0);
	});
    
    // 검색 입력 필드에 대한 이벤트 핸들러 설정
    search.forEach(function(inputField) {
        inputField.addEventListener('input', function() {
            setTimeout(function() {
                var newRows = document.querySelectorAll(".table.datatable.table-hover tbody tr[data-index]");
                var rowsPerPage = newRows.length; // 재계산된 페이지당 행 수

                // 기존 행 클릭 이벤트 핸들러를 제거
                rows.forEach(function(row) {
                    row.removeEventListener("click", rowClickHandler);
                });
                // 클릭 이벤트 핸들러를 각 행에 다시 연결
                newRows.forEach(function(row) {
                    row.addEventListener("click", rowClickHandler);
                });
                // 클릭 이벤트 트리거 재시뮬레이트
                simulateClickOnFirstRow();
            }, 0);
        });
    });

    
    // 클릭 이벤트 핸들러 정의
    function rowClickHandler(event) {
        event.stopPropagation();

        var empNoElement = this.querySelector("td:nth-child(1)");
        if (empNoElement) {
            var empNo = empNoElement.textContent.trim();
            var url = "${pageContext.request.contextPath}/accounting/salary/salaryEmpListSal.do?empNo=" + empNo;
            var xhr = new XMLHttpRequest();

            xhr.open("GET", url, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        var secContent = xhr.responseText;
                        var secContentElement = document.querySelector(".sec-content");
                        secContentElement.innerHTML = ""; // 기존 내용 지우기
                        secContentElement.innerHTML = secContent; // 새로운 내용 업데이트
                    } else {
                        alert("정보를 가져올 수 없습니다.");
                    }
                }
            };
            xhr.send();
        } else {
            alert("페이지를 찾을 수 없습니다.");
        }
    }

    // 클릭 이벤트 핸들러를 각 행에 연결
    rows.forEach(function(row) {
        row.addEventListener("click", rowClickHandler);
    });

    // 첫 번째 직원 행에 대한 클릭 이벤트를 시뮬레이트하는 함수
    function simulateClickOnFirstRow() {
        if (rows.length > 0) {
            rows[0].click(); // 첫 번째 행에 클릭 이벤트 시뮬레이트
        }
    }
    

    // 페이지 로드시 첫 번째 행에 클릭 이벤트 트리거
    simulateClickOnFirstRow();
});

//일괄산정 작은 폼
function openSmallWindow(url, name, width, height) {
	  var screenWidth = window.screen.availWidth;
      var screenHeight = window.screen.availHeight;
      var left = (screenWidth - width) / 2;
      var top = (screenHeight - height) / 3;
      window.open(url, name, 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
}
</script>
