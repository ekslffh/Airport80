<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul class="sidebar-nav" id="sidebar-nav">

	<li class="nav-item navtitle">
			운영본부
	</li>
	
	<li class="nav-item">
		<a class="nav-link " href='<c:url value="/operate/flightlog/main.do" />'> 
			<i class="bi bi-menu-button-wide"></i> 
			<span>관제</span>
		</a>
	</li>
	
	<li class="nav-item">
		<a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="">
				<i class="bi bi-menu-button-wide"></i>
				<span>입점</span>
				<i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
			<li>
				<a href="/Airport80/hr/vendor/vendorList.do"> 
				<i class="bi bi-journal-text"></i>
				<span>입점업체 목록</span>
				</a>
			</li>
			<li>
				<a  href='<c:url value="/operate/bidNotice/bnList.do" />'> 
				<i class="bi bi-circle"></i>
				<span>모집 공고</span>
				</a>
			</li>

		</ul>
	</li>

	<li class="nav-item">
		<a class="nav-link collapsed"
			data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-menu-button-wide"></i>
				<span>고객</span>
				<i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="charts-nav" class="nav-content collapse "
			data-bs-parent="#sidebar-nav">
			<li>
				<a  href='<c:url value="/lostItem/lostItemList.do" />'> 
				<i class="bi bi-circle"></i>
				<span>분실물</span>
				</a>
			</li>
			<li>
				<a  href='<c:url value="/operate/custNoticeBrd/cnbList.do" />'> 
				<i class="bi bi-circle"></i>
				<span>공지게시판</span>
				</a>
			</li>
		</ul>
	</li>
	
	<li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="">
          <i class="bi bi-menu-button-wide"></i><span>교통</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a  href='<c:url value="/operate/busRoute/brList.do" />'> 
              <i class="bi bi-circle"></i><span>셔틀 버스</span>
            </a>
          </li>
          <li>
            <a href='<c:url value="/operate/busLog/blogList.do" />'> 
              <i class="bi bi-circle"></i><span>운행일지</span>
            </a>
          </li>
        </ul>
      </li>
      
		</ul>
	</li>
</ul>