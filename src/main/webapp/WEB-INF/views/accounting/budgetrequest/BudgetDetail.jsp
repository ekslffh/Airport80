<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
					   <!-- 게시판 헤더 영역 시작 -->
							<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
							    <h5 class="card-tit">예산 신청 상세보기</h5>
							    <nav>
							      <ol class="breadcrumb">
							        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/in"><i class="bi bi-house-door"></i></a></li>
							        <li class="breadcrumb-item"><a href="#">지원요청</a></li>
							        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/accounting/budgetrequest/BudgetReqList.do"></a>추가 예산 신청 목록</li>
							        <li class="breadcrumb-item active">예산 신청 상세보기</li>
							      </ol>
							    </nav>
						    </div>
						    <div class="info" style="width: 100%; padding-bottom: 1px;">
							    <p class="cofistooltip">
									<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
									 <span data-bs-toggle="tooltip" data-bs-placement="top">							     
										 신청한 예산의 상세정보입니다. 하단 버튼으로 관리 할 수 있습니다.
									 </span>
								</p>
							</div>
							<p></p>	
						  
				 	   <!-- 게시판 헤더 영역 끝 -->
						<h5 class="card-title"></h5>
					
	<table class="table table-bordered">
		<tr>
			<td>신청번호:</td>
			<td>${budgetDetail.bgRId}</td>
		</tr>
		<tr>
			<td>금액:</td>
			<td><fmt:formatNumber value="${budgetDetail.bgRAmt}"
					type="currency" currencySymbol="₩" /></td>
		</tr>
		<tr>
			<td>사유:</td>
			<td>${budgetDetail.bgRRsn}</td>
		</tr>
		<tr>
			<td>계정과목:</td>
			<td>${budgetDetail.acaNm}</td>
		</tr>
		<tr>
			<td>상태:</td>
			<td>${budgetDetail.bgRStatus}</td>
		</tr>
		<tr>
			<td>신청직원:</td>
			<td>${budgetDetail.empEmpNm}</td>
		</tr>
		<tr>
			<td>접수일:</td>
			<td>${budgetDetail.bgRTs.substring(0,16)}</td>
		</tr>
		<tr>
			<td>처리직원:</td>
			<td>${empty budgetDetail.salEmpNm ? "아직 처리되지 않았습니다" : budgetDetail.salEmpNm}</td>
		</tr>
		<tr>
			<td>처리일:</td>
			<td>${empty budgetDetail.bgRResTs ? "아직 처리되지 않았습니다" : budgetDetail.bgRResTs.substring(0, 16)}</td>
		</tr>
		<tr>
			<td>처리사유:</td>
			<td>${empty budgetDetail.bgRResRsn ? "아직 사유가 없습니다." : budgetDetail.bgRResRsn}</td>
		</tr>


	</table>

					</div>
				</div>

			</div>
		</div>
	</section>
	
	<%-- 목록 페이지로 돌아가는 링크 --%>
	<div style="text-align: right;">
	  <c:choose>
        <c:when test="${loginEmpNo.startsWith('1201')}">
            <a href="javascript:void(0);" class="btn btn-primary" onclick="openBudgetUpdatePopup();">처리하기</a>
        </c:when>
    	</c:choose>
 			 <a href="javascript:void(0);" class="btn btn-dark" onclick="confirmDelete();">삭제하기</a>
		  	<a href="${pageContext.request.contextPath}/accounting/budgetrequest/BudgetReqList.do" class="btn btn-secondary">목록으로 돌아가기</a>

	</div>


<script>
	 function openPopup(url, name, width, height) {
	       var screenWidth = window.screen.availWidth;
	       var screenHeight = window.screen.availHeight;
	       var left = (screenWidth - width) / 2;
	       var top = (screenHeight - height) / 2;
	       window.open(url, name, 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
	   }

	function openBudgetUpdatePopup() {
	    var budgetRId = "${budgetDetail.bgRId}";
	    var url = "${pageContext.request.contextPath}/accounting/budgetrequest/update.do?bgRId="+budgetRId;
	    openPopup(url, 'BudgetUpdatePopup', 600, 350);
	}
	
	function confirmDelete() {
	    Swal.fire({
	        title: '삭제 확인',
	        text: '정말로 삭제하시겠습니까?',
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#d33',
	        cancelButtonColor: '#3085d6',
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소',
	        showLoaderOnConfirm: true,
	    }).then((result) => {
	        if (result.isConfirmed) {
	            window.location.href = `${pageContext.request.contextPath}/accounting/budgetrequest/delete.do?bgRId=${budgetDetail.bgRId}`;
	        }
	    });
	}

</script>

