<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<ul class="sidebar-nav" id="sidebar-nav">
    <li class="nav-item navtitle">
        회계부서
    </li>
        <li class="nav-item">
		<a class="nav-link " href="<%=request.getContextPath()%>/accounting/accountcategory/AcccList.do"> 
			<i class="bi bi-grid"></i> 
			<span>계정 과목 관리</span>
		</a>
	</li>

        <li class="nav-item">
		<a class="nav-link " href="<%=request.getContextPath()%>/accounting/history/list.do"> 
			<i class="bi bi-grid"></i> 
			<span>회계내역</span>
		</a>
	</li>
 
    <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#salary-nav" data-bs-toggle="collapse" href="#">
            <i class="bi bi-menu-button-wide"></i>
            <span>급여</span>
            <i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="salary-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
            <li>
                <a href="${pageContext.request.contextPath}/accounting/salary/salaryEmpList.do"> 
                    <i class="bi bi-circle"></i>
                    <span>급여산정</span>
                </a>
            </li>
            
            <li>
                <a href="${pageContext.request.contextPath}/accounting/salary/salaryList.do"> 
                    <i class="bi bi-circle"></i>
                    <span>급여 지급 관리</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/accounting/salary/salarySeverancePay.do"> 
                    <i class="bi bi-circle"></i>
                    <span>퇴직금 산정</span>
                </a>
            </li>
        </ul>
    </li>
       <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#budget-nav" data-bs-toggle="collapse" href="#">
            <i class="bi bi-menu-button-wide"></i>
            <span>예산</span>
            <i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="budget-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
            
            <li>
                <a href="<%=request.getContextPath()%>/accounting/budget/BudgetList.do">
                    <i class="bi bi-circle"></i>
                    <span>예산 책정</span>
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/accounting/budget/BudgetInsertForm.do">
                    <i class="bi bi-circle"></i>
                    <span>예산접수</span>
                </a>
            </li>
        </ul>
    </li>


</ul>

