<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">사내 주차장 이용 신청</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">사내 주차장</a></li>
					        <li class="breadcrumb-item active">이용 신청</li>
					      </ol>
					    </nav>
				    </div>

				    <!-- 게시판 헤더 영역 끝 -->
				    
<div class="count_zone" style="text-align:right;">
		<ul>
		 <li style="list-style: none;"><i class="bi bi-info-circle" style="font-size: 13px;" ></i> <span>&nbsp;해당 구역에 커서를 대면 잔여 주차 현황을 조회할 수 있습니다.</span></li>
		</ul>
	</div>				    
<img src="${pageContext.request.contextPath}/resources/images/hr/epl.png" alt="${vendor.vendId }" 
style="display:block; margin: 0 auto" usemap="#image-map"/> 

<map id="image-map" name="image-map">
  <c:forEach items="${parkArea}" var="area" varStatus="loop">
    <c:set var="coords" value="" />
    <c:choose>
      <c:when test="${loop.index == 0}">
        <c:set var="coords" value="95,238,210,294" />
      </c:when>
      <c:when test="${loop.index == 1}">
        <c:set var="coords" value="67,323,212,373" />
        
      </c:when>
      <c:when test="${loop.index == 2}">
        <c:set var="coords" value="393,231,513,293" />
      </c:when>
      <c:when test="${loop.index == 3}">
        <c:set var="coords" value="375,330,526,374" />
      </c:when> 
    </c:choose>
    
   <area shape="rect" alt="${area.codeNm}" coords="${coords}" href="" 
    target="" title="${area.codeNm}(${area.codeId}): ${area.codeVal - area.apprCount}"/>
      
  </c:forEach>
</map>

<br>
   
<security:authentication property="principal.realUser" var="authMember" />
<form:form method="post" modelAttribute="eplstatus">
	<form:hidden path="eplId" value="${epl.eplId}" />
	<form:hidden path="empNo" value="${authMember.empNo }" />
	<table class="table table-bordered">

		<tr>
			<th>신청자</th>
			<td><input class="form-control" value="${authMember.empNm }"
				disabled /></td>
		</tr>
		<tr>
			<th>차량 번호</th>
			<td><form:input path="esCarNo" class="form-control"
					value="${epl.esCarNo}" /> <form:errors path="esCarNo"
					class="error" /></td>
		</tr>
		<tr>
			<th>차종</th>
			<td><form:input path="esCarModel" class="form-control"
					value="${epl.esCarModel}" /> <form:errors path="esCarModel"
					class="error" /></td>
		</tr>
		<tr>
			<th>희망 주차 구역</th>
			<td><form:select path="eplCd" class="form-control">
					<form:option value="">-- 선택하세요 --</form:option>

					<c:forEach items="${parkArea}" var="area">
						<c:choose>
							<c:when test="${epl.eplCd == area.codeId}">
								<form:option value="${area.codeId}" selected="selected">${area.codeNm} (${area.codeId})</form:option>
							</c:when>
							<c:otherwise>
								<form:option value="${area.codeId}">${area.codeNm} (${area.codeId})</form:option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<form:errors path="eplCd" class="error" />
				</form:select> <form:errors path="eplCd" class="error" /></td>
		</tr>
		<c:if test="${not empty epl.commoncode.codeNm }">
			<tr>
			    <th>상태</th>
			    <td>${epl.commoncode.codeNm}</td>
			</tr>
			
			<c:if test="${epl.commoncode.codeNm eq '반려'}">
			    <tr>
			        <th>사유</th>
			        <td>${epl.eplReason}</td>
			    </tr>
			</c:if>
		</c:if>
		
		
	   <tr style="text-align:right">
	      <td colspan="2" >
	          <c:choose>
	              <c:when test="${not empty epl.eplCd}">
<!-- 	                  <input type="submit" value="수정" class="btn btn-success"/> -->
					<form action="/hr/parking/eplUpdate.do" method="POST">
						<input type="submit" value="수정" class="btn btn-dark" />
					</form>
	              </c:when>
	              
	              <c:otherwise>
	                  <input type="submit" value="등록" class="btn btn-primary"/>
	              </c:otherwise>
	          </c:choose>
	      </td>
	   </tr>
	</table>
</form:form>

				</div>
			</div>
		</div>
	</div>
</section>
