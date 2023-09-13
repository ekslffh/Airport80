<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header"
						style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">항공사 상세보기</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i
										class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">외부 업체</a></li>
								<li class="breadcrumb-item active">취항 항공사</li>
							</ol>
						</nav>
					</div>

<form:form method="post" modelAttribute="airline">
	<table class="table table-border">
		<tr>
			<th><spring:message code="airline.alKnm" /></th>
			<td>${airline.alKnm }</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alEnm" /></th>
			<td>${airline.alEnm }</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alCd" /></th>
			<td>${airline.alCd }</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alCountry" /></th>
			<td>${airline.alCountry }</td>
		</tr>

		<tr>
			<th><spring:message code="airline.alCounCd" /></th>
			<td>${airline.alCounCd }</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alFlag" /></th>
			<td>${airline.alFlag }</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alScale" /></th>
			<td>${airline.alScale }</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alHead" /></th>
			<td>${airline.alHead }</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alVrId" /></th>
			<td>${airline.alVrId }</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alStatus" /></th>
			<td>${airline.alStatus }</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alDesc" /></th>
			<td>${airline.alDesc }</td>
		</tr>
		<tr>
			<th><spring:message code="airline.alWeb" /></th>
			<td>${airline.alWeb }</td>
		</tr>
		<tr>
		<td colspan="2" style="text-align:right;">
			<c:url value='/hr/airline/airlineUpdate.do' var="updateURL">
				<c:param name="what" value="${airline.alCd }" />
			</c:url>
			<a href="${updateURL }" class="btn btn-primary">수정</a>
			<a class="btn gray-btn" href="<c:url value='/hr/airline/airlineList.do'/>">목록</a>
		</td>
	</tr>

	</table>
</form:form>
				</div>
			</div>
		</div>
	</div>
</section>