<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="preScript" />

<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/in/assets/img/airportLogo2.png" rel="icon">
<link href="${pageContext.request.contextPath}/resources/in/assets/img/airportLogo2.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet"
>

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/in/assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath }/resources/in/assets/css/style.css" rel="stylesheet">


</head>
<%-- <security:authentication property="principal.accInfo" var="authMember" /> --%>
<security:authentication property="principal.realUser" var="authMember" />
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">
		<tiles:insertAttribute name="headerMenu" />
	</header>
	<!-- End Header -->

	<!-- ======= sidebar ======= -->
	<aside id="sidebar" class="sidebar">
		<c:choose>
			<c:when test="${authMember.empDeptNo == '1201'}">
				<c:choose>
					<c:when test="${authMember.empTeam == 31}">
						<!-- Sidebar content for empNo 1201 and empTeam 31 -->
						<%@ include file="/in/hrSidebar.jsp"%>
					</c:when>
					<c:when test="${authMember.empTeam == 32}">
						<!-- Sidebar content for empNo 1201 and empTeam 32 -->
						<%@ include file="/in/accountingSidebar.jsp"%>
					</c:when>
				</c:choose>
			</c:when>
			<c:when test="${authMember.empDeptNo == '1202'}">
				<!-- Sidebar content for empNo 1202 -->
				<%@ include file="/in/operateSidebar.jsp"%>
			</c:when>
			<c:when test="${authMember.empDeptNo == '1203'}">
				<!-- Sidebar content for empNo 1203 -->
				<%@ include file="/in/safetySidebar.jsp"%>
			</c:when>
			<c:when test="${authMember.empDeptNo == '1204'}">
				<!-- Sidebar content for empNo 1204 -->
				<%@ include file="/in/infraSidebar.jsp"%>
			</c:when>
		</c:choose>
	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">
		<tiles:insertAttribute name="contentPage" />
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<tiles:insertAttribute name="footer" />
	</footer>
	<!-- End Footer -->

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<tiles:insertAttribute name="postScript" />

</body>

</html>