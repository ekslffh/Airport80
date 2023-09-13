<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<main id="mainEx1" class="mainEx1">
	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						  <!-- 게시판 헤더 영역 시작 -->
							<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
							    <h5 class="card-tit">급여 지급 현황</h5>
							    <nav>
							      <ol class="breadcrumb">
							        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/in"><i class="bi bi-house-door"></i></a></li>
							        <li class="breadcrumb-item"><a href="#">급여</a></li>
							        <li class="breadcrumb-item active">급여 지급 현황</li>
							      </ol>
							    </nav>
						    </div>
						     <div class="info" style="width: 100%; padding-bottom: 1px;">
							    <p class="cofistooltip">
							        <i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							        <span data-bs-toggle="tooltip" data-bs-placement="top">
							             선택한 직원의 월급 지급 정보 입니다. <br>
							             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 급여 지급 관리에서 상세 현황을 확인할 수 있습니다. <br>
							            
							        </span>
							    </p>
							</div>
						   <p><p>
				 	   <!-- 게시판 헤더 영역 끝 -->
						<table class="table datatable table-hover">
							<thead>
								<tr>
									<th scope="col">월분</th>			
									<th scope="col">부서명</th>
									<th scope="col">급여담당자</th>
<!-- 									<th scope="col">급여수령자</th> -->
									<th scope="col">상태</th>
									<th scope="col">지급일</th>
<!-- 									<th scope="col">급여대장</th> -->
									<th scope="col">
									<c:choose>
										<c:when test="${loginEmpNo.startsWith('1201')}">
											<%--회계부서일 때만--%>
										     처리
										</c:when>
									</c:choose>
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${empSalList}" var="salary">
									<tr>
										<td scope="row" hidden>${salary.salId}</td>
										<td>${salary.salCrtTs.substring(0, 7)}</td>
									
										<td>${salary.deptNm}</td>
										<td>${salary.salEmpNm}</td>
<%-- 										<td>${salary.emp.empNm}</td> --%>
										<td
											style="color: ${salary.salPayDt == null ? 'red' : 'blue'};">
											${salary.salPayDt == null ? '미지급' : '지급완료'}</td>
										<td
											style="color: ${salary.salPayDt == null ? 'red' : 'blue'};">
											${salary.salPayDt == null ? '미지급' : salary.salPayDt.substring(0, 10)}
										</td>
<!-- 										<td> -->
<%-- 											<a href="${pageContext.request.contextPath}/accounting/salary/downloadSalaryExcel?salId=${salary.salId}" --%>
<!-- 											onclick="event.stopPropagation();">다운로드</a></td> -->
<!-- 										<td> -->
											<c:choose>
												<c:when test="${loginEmpNo.startsWith('1201')}">
													<!-- 회계부서일 때만 -->
													<c:choose>
														<c:when test="${salary.salPayDt == null}">
															<!-- 지급 상태여부 -->
										                    처리 대기
										                </c:when>
														<c:otherwise>
															<!-- 지급 시 처리 완료 메시지 표시 -->
										                    처리 완료
										                </c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<!-- 회계부서가 아닐 때 처리 -->
													<!-- 원하는 내용 추가 -->
												</c:otherwise>
											</c:choose>
										
									</tr>
								</c:forEach>

							</tbody>
						</table>



					</div>
				</div>

			</div>
		</div>
	</section>

</main>

<%-- 상세보기 모달 대화상자 코드 --%>
<div id="detailsModal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="detailsModalLabel">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="detailsModalLabel">급여 상세 정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" style="overflow-y: auto; max-height: 70vh;">
				<!-- 스크롤 형식 설정 -->
				<div id="modalContent1"></div>
			</div>
			<div class="modal-footer">
				<!-- 모달 하단의 닫기 버튼 -->
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- End 모달 대화상자 코드 -->


<%-- 수정 대화상자 코드 --%>
<div id="updateModal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="updateModalLabel">
	<div class="modal-dialog modal-xs" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="updateModalLabel">급여 승인</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" style="overflow-y: auto; max-height: 70vh;">
				<!-- 스크롤 형식 설정 -->
				<div id="modalContent2"></div>
			</div>
			<div class="modal-footer">
				<!-- 모달 하단의 닫기 버튼 -->
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- End 모달 대화상자 코드 -->


