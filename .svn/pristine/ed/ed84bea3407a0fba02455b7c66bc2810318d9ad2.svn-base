

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<section class="section">
   <div class="row">
      <div class="col-lg-12">
         <div class="card">
            <div class="card-body">
            
               <!-- 게시판 헤더 영역 시작 -->
               <div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
                   <h5 class="card-tit">직원 조회</h5>
                   <nav>
                     <ol class="breadcrumb">
                       <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
                       <li class="breadcrumb-item"><a href="#">인사 정보</a></li>
                       <li class="breadcrumb-item active">직원 관리</li>
                     </ol>
                   </nav>
                   <div class="d-flex" style="padding: 0px 15px 0px; margin-bottom: -10px; border: 0;" id="searchUI">
                     <div class="d-flex" style="margin-left: auto;">
                        <p>
                           <input type="search" class="form-control" placeholder="search"
                              style="padding: 4px 0px 4px 14px; border: 1px solid rgb(0 0 0/ 30%);"
                              id="searchInput" />
                        </p>
                        <span>
                           <button type="submit" id="searchBtn" style="border: 0; padding: 0; margin-left: -30px; background: none; margin-top: 4px;">
                              <i class="bi bi-search"></i>
                           </button>
                        </span>
                     </div>
                  </div>
                </div>

                  
<!-- <div class="card"> -->

   
   <div class="card-body">
      <table class="table table-hover"  style="text-align:center">
         <thead class="table-light" >
            <tr>
               <th>사번</th>
               <th>이름</th>
               <th>소속 부서</th>
               <th>직급</th>
<!--                <th>이메일</th> -->
               <th>연락처</th>
               <th>입사일</th>
               <th>상태</th>
            </tr>
         </thead>
         <tbody>
            <c:set var="empList" value="${paging.dataList }" />
            <c:forEach items="${empList }" var="emp">
               <tr>
                  <c:url value="/hr/emp/empView.do" var="viewURL">
                     <c:param name="what" value="${emp.empNo }" />
                  </c:url>
      <!--             상세보기 모달창  -->
                  <td>
                     <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#verticalycentered" data-what="${emp.empNo}">
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
<%--                   <td>${emp.empEmail }@${emp.empEmailDo }</td> --%>
                  <td>
                     <c:set var="contact" value="${emp.empContact}" />
                       <c:set var="formattedContact" value="${fn:substring(contact, 0, 3)}-${fn:substring(contact, 3, 7)}-${fn:substring(contact, 7, fn:length(contact))}" />
                       ${formattedContact}
                  </td>
                  <td>${emp.empJoinDt }</td>
                  <td>
                     <c:choose>
                           <c:when test="${emp.empStatus == 0}">신규</c:when>
                           <c:when test="${emp.empStatus == 1}">출근</c:when>
                           <c:when test="${emp.empStatus == 2}">퇴근</c:when>
                       </c:choose>      
                  </td>
               </tr>
            </c:forEach>
         </tbody>
         <tfoot>
            <tr>
               <td colspan="8">
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
<!--    </div> -->
</section>


<c:url value="/hr/emp/empModal.do" var="viewURL" />

<!-- 모달 -->
<div class="modal fade" data-url="${viewURL }" id="verticalycentered" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title">상세 정보</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
               aria-label="Close"></button>
         </div>
<!--          모달 본문  -->
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

<script src="<c:url value='/resources/js/app/hr/empList.js'/>"></script>

