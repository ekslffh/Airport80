<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul class="sidebar-nav" id="sidebar-nav">

	<li class="nav-item navtitle">
			인프라본부
	</li>

	<li class="nav-item">
		<a class="nav-link collapsed"
			data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-menu-button-wide"></i>
				<span>점검일정/접수</span>
				<i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="components-nav" class="nav-content collapse "
			data-bs-parent="#sidebar-nav">
			<li>
				<a href="${pageContext.request.contextPath }/infra/rncReqList.do"> 
				<i class="bi bi-circle"></i>
				<span>유지보수/청소</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/infra/repLogList.do"> 
					<i class="bi bi-circle"></i>
					<span>점검 및 진단</span>
				</a>
			</li>
			
		</ul>
	</li>

	<li class="nav-item">
		<a class="nav-link collapsed"
			data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#"> 
			<i class="bi bi-journal-text"></i>
			<span>일정현황</span>
			<i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="forms-nav" class="nav-content collapse"
			data-bs-parent="#sidebar-nav">
			
			<li>
				<a href="${pageContext.request.contextPath }/infra/rncScheduleList.do"> 
					<i class="bi bi-circle"></i>
					<span>유지보수 일정/현황</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/infra/recScheduleList.do"> 
					<i class="bi bi-circle"></i>
					<span>청소 관리 일정/현황</span>
				</a>
			</li>
		</ul>
	</li>

	<li class="nav-item">
		<a class="nav-link collapsed"
			data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#"> 
			<i class="bi bi-layout-text-window-reverse"></i>
			<span>재고관리</span>
			<i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="tables-nav" class="nav-content collapse "
			data-bs-parent="#sidebar-nav">
			<li>
				<a href="${pageContext.request.contextPath }/infra/stockList.do"> 
					<i class="bi bi-circle"></i>
					<span>재고</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/infra/stockOrderInsert.do"> 
					<i class="bi bi-circle"></i>
					<span>발주</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/infra/stockOrderList.do"> 
					<i class="bi bi-circle"></i>
					<span>발주내역</span>
				</a>
			</li>
		</ul>
	</li>

	<li class="nav-item">
		<a class="nav-link collapsed"
			data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#"> 
			<i class="bi bi-bar-chart"></i>
			<span>업체관리</span>
			<i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="charts-nav" class="nav-content collapse "
			data-bs-parent="#sidebar-nav">
			<li>
				<a href="${pageContext.request.contextPath }/infra/ccList.do"> 
					<i class="bi bi-circle"></i>
					<span>외주업체</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/infra/orderCompanyList.do"> 
					<i class="bi bi-circle"></i>
					<span>발주업체</span>
				</a>
			</li>
<!-- 			<li> -->
<!-- 				<a href="charts-echarts.html">  -->
<!-- 					<i class="bi bi-circle"></i> -->
<!-- 					<span>시공계약</span> -->
<!-- 				</a> -->
<!-- 			</li> -->
		</ul>
	</li>

	<li class="nav-item">
		<a class="nav-link collapsed"
			data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#"> 
			<i class="bi bi-gem"></i>
			<span>시설관리</span>
			<i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="icons-nav" class="nav-content collapse "
			data-bs-parent="#sidebar-nav">
			<li>
				<a href="${pageContext.request.contextPath }/infra/facility.do"> 
					<i class="bi bi-circle"></i>
					<span>공항 내 시설물 관리</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/infra/ConvFacilityList.do"> 
					<i class="bi bi-circle"></i>
					<span>편의시설</span>
				</a>
			</li>
		</ul>
	</li>
</ul>
