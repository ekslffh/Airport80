<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">퇴사자 조회</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">인사 정보</a></li>
					        <li class="breadcrumb-item active">퇴사자 관리</li>
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
	
	<div class="card-body">
		<table class="table table-hover">
		   <thead class="table-light" style="text-align:center">
		      <tr>
		         <th>사번</th>
		         <th>이름</th>
		         <th>소속 부서</th>
		         <th>직급</th>
		         <th>상태</th>
		         <th>퇴사 날짜</th>
		      </tr>
		   </thead>
		   <tbody style="text-align:center">
		      <c:set var="empList" value="${paging.dataList }" />
		      <c:forEach items="${empList }" var="emp">
		         <tr>
		            <c:url value="/hr/remp/rempView.do" var="viewURL">
		               <c:param name="what" value="${emp.empNo }" />
		            </c:url>
		<!--             상세보기 모달창  -->
		            <td>
		               <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#rempViewModal" data-what="${emp.empNo}">
		                  ${emp.empNo }
		               </a>
		             </td>
		            <td>${emp.empNm }</td>
		            <td>
		                 <c:choose>
		                    <c:when test="${emp.empDeptNo == 1201}">
		                        <c:choose>
		                            <c:when test="${emp.empTeam == 31}">인사</c:when>
		                            <c:when test="${emp.empTeam == 32}">회계</c:when>
		                        </c:choose>
		                    </c:when>
		                    <c:when test="${emp.empDeptNo == 1202}">운영</c:when>
		                    <c:when test="${emp.empDeptNo == 1203}">보안</c:when>
		                    <c:when test="${emp.empDeptNo == 1204}">인프라</c:when>
		                </c:choose>   
		            </td>
		            <td>${emp.empRoleNm }</td>
		            <td>
		               <c:choose>
		                  <c:when test="${emp.empStatus == 4}">퇴사</c:when>
		               </c:choose>
		            </td>
		            <td>${emp.empResignDt }</td>
		         </tr>
		      </c:forEach>
		   </tbody>
		   <tfoot>
			   	 <tr>
					<td colspan="6">
						<div class="d-flex justify-content-center mb-3">
						${paging.pagingHTML }
						</div>
						
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







<c:url value="/hr/remp/rempModal.do" var="viewURL" />

<div class="modal fade" data-url="${viewURL }" id="rempViewModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">상세보기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
<!-- 			모달 본문  -->
			<div class="modal-body">
			</div>
		</div>
	</div>
</div>

<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
	<form:hidden path="searchType" />
	<form:hidden path="searchWord" />
	<input type="hidden" name="page" />
</form:form>


<script src="<c:url value='/resources/js/app/hr/rempList.js'/>"></script>


