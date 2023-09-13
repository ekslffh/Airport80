<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<table class="table table-bordered">
    <thead class="table-light">
        <tr>
            <th>부서</th>
            <th>예산항목</th>
            <th>항목금액</th>
            <th>책정날짜</th>
            <th>편집</th>
        </tr>
          
    </thead>
    <tbody>
        <c:set var="budgetDetailList" value="${paging.dataList}" />
        <c:choose>
            <c:when test="${empty budgetDetailList}">
                <tr>
                    <td colspan="4">조건에 맞는 예산이 없습니다.	</td>
                     <h3>예산액: <fmt:formatNumber value="${totalAmt }" type="number" pattern="###,### 원" /></h3>
                <td> <a href="<c:url value='/accounting/budgetdetail/BudgetDetailInsertForm.do?budId=${budId }' />" class="btn btn-primary">항목예산 책정</a></td>
  
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${budgetDetailList}" var="budget">
                    <tr>
                        <c:choose>
                            <c:when test="${budget.budId.substring(0, 4) eq '1201'}">
                                <c:set var="categoryName" value="경영" />
                            </c:when>
                            <c:when test="${budget.budId.substring(0, 4) eq '1202'}">
                                <c:set var="categoryName" value="운영" />
                            </c:when>
                            <c:when test="${budget.budId.substring(0, 4) eq '1203'}">
                                <c:set var="categoryName" value="보안" />
                            </c:when>
                            <c:when test="${budget.budId.substring(0, 4) eq '1204'}">
                                <c:set var="categoryName" value="인프라" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="categoryName" value="알 수 없음" />
                            </c:otherwise>
                        </c:choose>
                        <td>${categoryName}</td>
                        <td>${budget.acaNm}</td>       
                        <td><fmt:formatNumber value="${budget.bdAmt}" type="number" pattern="###,### 원" /></td>
                        <td>${budget.bdCrtTs}</td>
                        <td> 
                         <a id="updateButton"  href="<c:url value='/accounting/budgetdetail/BudgetDetailUpdateForm.do?bdId=${budget.bdId }' />" class="btn btn-primary">수정</a>
                         <a id="deleteButton" href="<c:url value='/accounting/budgetdetail/BudgetDetailDeleteForm.do?bdId=${budget.bdId}&budId=${budget.budId}' />" class="btn btn-danger">삭제</a> 	
        				</td>
                        
                    </tr>
                </c:forEach>
                <h3>예산액: <fmt:formatNumber value="${budgetDetailList[0].budAmt}" type="number" pattern="###,### 원" /> </h3>
                <h5>예산 소모 총액: <fmt:formatNumber value="${totalRemainingAmt}" type="number" pattern="###,### 원" /> </h5>
                <h5>예산 잔여액: <fmt:formatNumber value="${budgetDetailList[0].budAmt - totalRemainingAmt}" type="number" pattern="###,### 원" /> </h5>
          	     <h5> <a href="<c:url value='/accounting/budgetdetail/BudgetDetailInsertForm.do?budId=${budId }' />" class="btn btn-primary">항목예산 책정</a></h5>
          	     <h5> <a href="<c:url value='/accounting/budget/BudgetList.do?budId=${budId }' />" class="btn btn-warning">목록으로</a></h5>
            </c:otherwise>
        </c:choose>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="5">
                <div class="d-flex justify-content-center mb-3">
                    ${paging.pagingHTML}
                </div>
                   <!-- Add a canvas element for the chart -->
                <canvas id="budgetChart" width="100" height="30"></canvas>
                <div id="searchUI" class="row justify-content-center">
        
                   
                    <div class="col-auto">
                        <input type="hidden" value="검색" id="searchBtn" class="btn btn-success" />
                    </div>
                </div>

             
            </td>
        </tr>
    </tfoot>
</table>

<script>
    function fn_paging(page) {
        searchForm.page.value = page;
        searchForm.requestSubmit();
    }

    $(searchBtn).on("click", function (event) {
        $(searchUI).find(":input[name]").each(function (idx, input) {
            let name = input.name;
            let value = $(input).val();
            $(searchForm).find(`[name=\${name}]`).val(value);
        });
        $(searchForm).submit();
    });

    function generateBudgetChart() {
        var budgetAmount = ${totalAmt };
        var totalRemainingAmount = ${totalRemainingAmt};
        var spentAmount = budgetAmount - totalRemainingAmount;

        var ctx = document.getElementById("budgetChart").getContext("2d");

        var data = {
            labels: ["예산총액", "예산 잔여액", "예산 소모 총액"],
            datasets: [
                {
                    label: "금액",
                    data: [budgetAmount, spentAmount, totalRemainingAmount],
                    backgroundColor: [
                        "rgba(54, 162, 235, 0.2)",
                        "rgba(255, 99, 132, 0.2)",
                        "rgba(75, 192, 192, 0.2)",
                    ],
                    borderColor: [
                        "rgba(54, 162, 235, 1)",
                        "rgba(255, 99, 132, 1)",
                        "rgba(75, 192, 192, 1)",
                    ],
                    borderWidth: 1,
                },
            ],
        };

        var options = {
            scales: {
                y: {
                    beginAtZero: true,
                },
            },
        };

        var myBarChart = new Chart(ctx, {
            type: "bar",
            data: data,
            options: options,
        });
    }

    $(document).ready(function () {
        generateBudgetChart();
    });
    
 // 삭제 버튼 클릭 이벤트 처리
     $(document).ready(function() {
        // 삭제 버튼 클릭 이벤트 처리
        $("#deleteButton").click(function(event) {
            event.preventDefault(); // 기본 동작 중단
            
            var url = $(this).attr("href");
            
            $.ajax({
                url: url,
                type: "GET",
                success: function(data) {
             
                    location.reload(); // 전체 화면 새로고침
                }
            });
        });
    });
 
</script>
