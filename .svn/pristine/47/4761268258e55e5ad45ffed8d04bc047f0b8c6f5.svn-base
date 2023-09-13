<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.info{
	background: #f4f4f4;
    padding: 10px 15px 5px 15px;
    border-radius: 5px;
    width: 40%;
    margin-bottom: 8px;
}
.count_zone {
	margin-top: 10px;
	margin-bottom: -10px;
}

.count_zone ul li {
	list-style: none;
	margin-right: 10px;
}

.count_zone ul {
	padding-left: 20px;
}
</style>
<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body" style="padding : 0px 20px 0px 20px;">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;">
					    <h5 class="card-tit">취항 항공사</h5>
					    <nav>
					        <ol class="breadcrumb">
					            <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					            <li class="breadcrumb-item"><a href="#">업체 관리</a></li>
					            <li class="breadcrumb-item active">항공사</li>
					        </ol>
					    </nav>
					    <!-- search UI -->
					        <div class="d-flex" style="padding: 0px 15px 0px; margin-bottom: -10px; border: 0;" id="searchUI">
								<div class="d-flex" style="margin-left: auto;">
								<p>
									<form:input type="search" class="form-control" placeholder="search"
 										style="padding: 4px 0px 4px 14px; border: 1px solid rgb(0 0 0/ 30%);"
 										id="searchInput" path="simpleCondition.searchWord" /> 
								</p>
								<span>
									<button type="submit" id="searchBtn"
										style="border: 0; padding: 0; margin-left: -30px; background: none; margin-top: 4px;">
										<i class="bi bi-search"></i>
									</button>
								</span>
							</div>
					    </div>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->

		
	<div class="count_zone">
		<ul class="d-flex">
		 <li><i class="bi bi-clipboard-check" style="font-size: 13px;"></i><span>  총 </span><span class="totalcolor">${totalCount }</span><span>개</span></li>
		 
		 <li data-bs-toggle="tooltip" data-bs-placement="top" title="현재 운영 중인 항공사">
		 <i class="bi bi-lightbulb-fill" style="font-size: 13px;"></i><span>&nbsp;운영 : </span><span style="color:green;"><b>${alOn }</b></span><span>개</span></li>
		 
		 <li data-bs-toggle="tooltip" data-bs-placement="top" title="현재 운영 중지 된 항공사">
		 <i class="bi bi-lightbulb-off" style="font-size: 13px;"></i><span>&nbsp;정지 : </span><span style="color:red;"><b>${alStop }</b></span><span>개</span></li>
		 
		 <li data-bs-toggle="tooltip" data-bs-placement="top" title="현재 폐업한 항공사">
		 <i class="bi bi-x-square" style="font-size: 13px;"></i><span>&nbsp;폐업 : </span><span style="color:black;"><b>${alOff }</b></span><span>개</span></li>
		</ul>
	</div>
		
		    
	<div class="card-body" style="padding:10px 20px 20px 20px;">
		<table class="table table-bordered" style="text-align:center;'">
		   <thead class="table-light">
		      <tr>
		         <th>항공사 코드</th>
		         <th>항공사</th>
		         <th>소재국가</th>
		         <th>규모</th>
		         <th>납입 아이디</th>
		         <th>상태</th>
		      </tr>
		   </thead>
		   <tbody>
		      <c:set var="airlineList" value="${paging.dataList }" />
		
		      <c:forEach items="${airlineList }" var="airline">
		         <tr>
		            <td>${airline.alCd }</td>
		            <c:url value="${airline.alWeb }" var="viewURL">
		               <c:param name="what" value="${airline.alCd }" />
		            </c:url>
		            <td><a href="${viewURL }">${airline.alKnm }</a></td>
		            <td>${airline.alCountry }</td>
		            <td>${airline.alScale }</td>
		            <td>${airline.alVrId }</td>
		            <td><a href="javascript:;" class="status-button"
		               data-bs-toggle="modal" data-bs-target="#verticalycentered"
		               data-alstatus="${airline.alStatus}" data-alcd="${airline.alCd }">
		                  <c:choose>
		                     <c:when test="${airline.alStatus == '운영'}">
		                        <button type="button" class="btn btn-success btn-sm">운영</button>
		                     </c:when>
		                     <c:when test="${airline.alStatus == '정지'}">
		                        <button type="button" class="btn btn-danger btn-sm">정지</button>
		                     </c:when>
		                     <c:when test="${airline.alStatus == '폐업'}">
		                        <button type="button" class="btn btn-secondary btn-sm">폐업</button>
		                     </c:when>
		                  </c:choose>
		            </a></td>
		         </tr>
		      </c:forEach>
		   </tbody>
		   <tfoot>
		      <tr>
		         <td colspan="6">
		            <div class="d-flex justify-content-center mb-3">
		               ${paging.pagingHTML }</div>
		         </td>
		      </tr>
		   </tfoot>
		</table>
	</div>
</div>


				</div>
			</div>
		</div>
</section>


<div class="modal fade" id="verticalycentered" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">항공사 운영 상태 변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="statusChangeForm" method="post"
					action="${pageContext.request.contextPath }/hr/airline/airlineModal.do">
					<input id="alCd" type="hidden" name="alCd" /> 
					<span>상태</span> 
					<select class="form-select" name="alStatus" id="alStatusSelect"
						style="display: inline; width: 70%; margin-left: 40px;">
						<option value="" label="상태변경" />
						<option value="운영" label="운영" />
						<option value="정지" label="정지" />
						<option value="폐업" label="폐업" />
					</select> 
			</div>
			<div class="modal-footer">
					<button type="submit" class="btn btn-primary">변경</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
			</div>
				</form>
		</div>
	</div>
</div>


<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
	<form:hidden path="searchType" />
	<form:hidden path="searchWord" />
	<input type="hidden" name="page" />
</form:form>

<script src="<c:url value='/resources/js/app/hr/airlineList.js'/>"></script>