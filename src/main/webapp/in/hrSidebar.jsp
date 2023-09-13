<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="sidebar-nav" id="sidebar-nav">

	<li class="nav-item navtitle">
			인사/사무부서
	</li>
	
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="">
          <i class="ri-admin-line"></i><span>등록</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/hr/emp/empInsert.do">
              <i class="bi bi-circle"></i><span>신규직원</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/hr/vendor/vendorInsert.do">
              <i class="bi bi-circle"></i><span>외부업체</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/hr/airline/airlineInsert.do">
              <i class="bi bi-circle"></i><span>항공사</span>
            </a>
          </li>
        </ul>
      </li>
      
<!-- 	<li class="nav-item"> -->
<!--         <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href=""> -->
<!--           <i class="bi bi-lock"></i><span>보안</span><i class="bi bi-chevron-down ms-auto"></i> -->
<!--         </a> -->
<!--         <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav"> -->
<!--           <li> -->
<!--             <a href="#"> -->
<!--               <i class="bi bi-circle"></i><span>권한 설정</span> -->
<!--             </a> -->
<!--           </li> -->
<!--           <li> -->
<!--             <a href="#"> -->
<!--               <i class="bi bi-circle"></i><span>비밀번호</span> -->
<!--             </a> -->
<!--           </li> -->
<!--         </ul> -->
<!--       </li> -->
   
	<li class="nav-item">
		<a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="">
				<i class="bi bi-people-fill"></i>
				<span>인사정보</span>
				<i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
			<li>
				<a href="${pageContext.request.contextPath}/hr/emp/empList.do"> 
				<i class="bi bi-circle"></i>
				<span>직원정보</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/hr/remp/rempList.do"> 
				<i class="bi bi-circle"></i>
				<span>퇴사자관리</span>
				</a>
			</li>
<!-- 			<li> -->
<!-- 				<a href="components-accordion.html">  -->
<!-- 				<i class="bi bi-circle"></i> -->
<!-- 				<span>근무일정</span> -->
<!-- 				</a> -->
<!-- 			</li> -->
			<li>
				<a href="${pageContext.request.contextPath}/hr/vacation/vacation.do"> 
				<i class="bi bi-circle"></i>
				<span>휴가 관리</span>
				</a>
			</li>
		</ul>
	</li>
	
	<li class="nav-item">
		<a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="">
				<i class="bi bi-columns-gap"></i>
				<span>업체관리</span>
				<i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="tables-nav" class="nav-content collapse"
			data-bs-parent="#sidebar-nav">
			<li>
				<a href="${pageContext.request.contextPath}/hr/vendor/vendorList.do"> 
				<i class="bi bi-circle"></i>
				<span>입점사</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/hr/airline/airlineList.do"> 
				<i class="bi bi-circle"></i>
				<span>항공사</span>
				</a>
			</li>
		</ul>
	</li>
	
	   
	<li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/hr/parking/eplList.do">
          <i class=" ri-car-fill"></i>
          <span>사내 주차장 관리</span>
        </a>
    </li>
</ul>
