<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
th {
	width:20%;	
}
</style>
<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">입점사 상세보기</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">외부 업체</a></li>
					        <li class="breadcrumb-item active">입점사</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->

<div class="info" style="width: 900px; margin: 0 auto; padding-bottom: 1px;">
	<p class="cofistooltip">
		<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
		<span data-bs-toggle="tooltip" data-bs-placement="top" >
		입점사의 상세 정보를 확인할 수 있습니다. </span> <br>
		<span data-bs-toggle="tooltip" data-bs-placement="top" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계약 정보를 추가할 수 있습니다.</span>
	</p>
</div>	
<br>			
<div style="width:890px; margin: 0 auto;">
<form:form method="post" modelAttribute="vendor">
	<table class="table table-border">
		<tr>
			<th class="table-light"><spring:message code="vendor.vendId" /></th>
			<td>${vendor.vendId }</td>
			<th class="table-light"><spring:message code="vendor.vendNm" /></th>
			<td>${vendor.vendNm }</td>
		</tr>
		<tr>
			<th class="table-light"><spring:message code="vendor.vendOpHours" /></th>
			<td>${vendor.vendOpHours }</td>
			<th class="table-light"><spring:message code="vendor.vendClHours" /></th>
			<td>${vendor.vendClHours }</td>
		</tr>
		<tr>
			<th class="table-light"><spring:message code="vendor.vendContact" /></th>
			<td>${vendor.vendContact }</td>
			<th class="table-light"><spring:message code="vendor.vendDt" /></th>
			<td>${vendor.vendDt }</td>
		</tr>

		<tr>
			<th class="table-light"><spring:message code="vendor.vendLoc" /></th>
			<td>${vendor.vendLoc }</td>
			<th class="table-light"><spring:message code="vendor.vendType" /></th>
			<td>
				<c:choose>
				    <c:when test="${vendor.vendType == '3001'}">식품(식당)</c:when>
				    <c:when test="${vendor.vendType == '3002'}">뷰티</c:when>
				    <c:when test="${vendor.vendType == '3003'}">명품</c:when>
				    <c:when test="${vendor.vendType == '3004'}">전자제품</c:when>
				    <c:when test="${vendor.vendType == '3005'}">패션</c:when>
				    <c:when test="${vendor.vendType == '3006'}">주류·담배</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th class="table-light"><spring:message code="vendor.vendMvp" /></th>
			<td colspan="3">${vendor.vendMvp }</td>
		</tr>
		<c:if test="${not empty vendor.vendDesc }">
			<tr>
				<th class="table-light">비고</th>
				<td colspan="3">${vendor.vendDesc }</td>
			</tr>
		</c:if>
		<tr>
			<th class="table-light" style="vertical-align : middle;"><spring:message code="vendor.vendStatus" /></th>
			<td style="vertical-align : middle;" colspan="3">
				<c:set value="${vendor.contract.ctrStatus }" var="status"/>
				<c:choose>
				    <c:when test="${status == 'V01'}">계약 대기</c:when>
				    <c:when test="${status == 'V02'}">계약 완료</c:when>
				    <c:when test="${status == 'V03'}">연장 계약</c:when>
				    <c:when test="${status == 'V99'}">계약 만료</c:when>
				    <c:when test="${status == 'V88'}">유찰</c:when>
				</c:choose>
				 <button onclick="fn_showContractInfo()" class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
				 	<i id='mark' class="bi bi-caret-down-square-fill"></i>
				 </button>
			</td>
		</tr>
		<tr>
			<th class="table-light"><spring:message code="vendor.vrId" /></th>
			<td>${vendor.vrId }</td>
			<th class="table-light"><spring:message code="vendor.vendCtrId" /></th>
			<td>${vendor.vendCtrId }</td>
		</tr>
		<tr class="collapse" id="collapseExample">
			<th class="table-light">상세리스트	<br><a href="javascript:;" id="addCBtn" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">추가</a></th>
			<td colspan="3">
				<c:choose>
					<c:when test="${empty vendor.contract.contractHistoryList }">
						계약정보가 존재하지 않습니다.
					</c:when>
					<c:otherwise>
						<table class="table table-bordered table-primary">
							<tr>
								<th>계약아이디</th>
								<th>계약 금액</th>
								<th>계약시작일</th>
								<th>계약종료일</th>
								<th>계약생성일시</th>
								<th>계약 파일</th>
							</tr>
							<c:forEach items="${vendor.contract.contractHistoryList }" var="ch">
							<tr>
								<td style="vertical-align : middle;"><a href="javascript:;fn_select()" class="btn btn-small btn-warning" 
								data-start-dt="${ch.chStartDt }" data-end-dt="${ch.chEndDt }" 
								data-amt="${ch.chAmt }" data-ch-id="${ch.chId }" data-bs-toggle="modal" 
								data-bs-target="#exampleModal">${ch.chId }</a></td>
								
								<td style="vertical-align : middle;"><fmt:formatNumber value="${ch.chAmt }" type="currency" currencySymbol="₩" /></td>
								
								<td style="vertical-align : middle;">${ch.chStartDt }</td>
								<td style="vertical-align : middle;">${ch.chEndDt }</td>
								<td style="vertical-align : middle;">${ch.chCrtTs }</td>
								<td style="vertical-align : middle;">
									<c:if
										test="${not empty ch.fileGroup and not empty ch.fileGroup.detailList }">
										<c:forEach items="${ch.fileGroup.detailList }" var="fileDetail">
											<c:url value="/download.do" var="downloadURL">
												<c:param name="atchFileId"
													value="${fileDetail.atchFileId }" />
												<c:param name="fiSn" value="${fileDetail.fiSn }" />
											</c:url>
											<a href="${downloadURL }">${fileDetail.fiOriginNm }</a>
										</c:forEach>
									</c:if>
								</td>
								</tr>
							</c:forEach>
						</table>			
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		
		
		<tr>
		<td colspan="4"  style="text-align:right;">
			<c:url value='/hr/vendor/vendorUpdate.do' var="updateURL">
				<c:param name="what" value="${vendor.vendId }" />
			</c:url>
			<a href="${updateURL }" class="btn btn-primary">수정</a>
			<a class="btn gray_btn" href="<c:url value='/hr/vendor/vendorList.do'/>">목록</a>
		</td>
	</tr>
	</table>
</form:form>
</div>

				</div>
			</div>
		</div>
	</div>
</section>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form id="conForm" method="post" action="<c:url value='/contractHistory/insert.do' />" enctype="multipart/form-data">
	      <div class="modal-body">
	        	<table class="table table-border">
		        	<input name = "ctrId" type="hidden" value="${vendor.vendCtrId }" />
		        	<input name = "vendId" type="hidden" value="${vendor.vendId }" />
		        	<input name = "chId" type="hidden" value="" />
		      		<tr>
		      			<th>계약시작일</th>
		      			<td><input name="chStartDt" type="date" /></td>
		      		</tr>
		      		<tr>
		      			<th>계약종료일</th>
		      			<td><input name="chEndDt" type="date" /></td>
		      		</tr>
		      		<tr>
		      			<th>계약금액</th>
		      			<td><input name="chAmt" type="number" /></td>
		      		</tr>
		      		<tr>
		      			<th>계약서</th>
		      			<td><input name="chFiles" type="file" /></td>
		      		</tr>
	      		</table> 
		  </div>       
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary">제출</button>
	        <button type="button" onclick="fn_deleteContract()" class="btn btn-danger">삭제</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
     </form>
    </div>
  </div>
</div>

<script>
	$(exampleModal)
	.on("show.bs.modal", function(event) {
		// 모달창을 부른 타겟찾기 (추가버튼 or 수정/삭제버튼)
		const rTarget = event.relatedTarget;
		
	    if (rTarget.id === "addCBtn") { // 계약정보 추가
	    	// 모달창 제목 변경
	    	$(exampleModalLabel).text("계약내역추가");
	    	// form의 action을 insert.do로 변경
	    	$(conForm).attr("action", "${pageContext.request.contextPath}/contractHistory/insert.do");
	    } else { // 계약정보 수정
	    	// 모달창 제목 변경
	    	$(exampleModalLabel).text("계약정보수정");
	    	// dataset으로 각 들어있는 값들 가져오기
	    	let amt = rTarget.dataset['amt'];
			let startDt = rTarget.dataset['startDt'];
			let endDt = rTarget.dataset['endDt'];
			let chId = rTarget.dataset['chId'];
			
			// 가져온 값 출력해보기
			console.log("amt: ", amt);
			console.log("startDt: ", startDt);
			console.log("endDt: ", endDt);
			console.log("chId: ", chId);
			
			// 모달창 내부에 있는 input요소 3개 찾아서 기존값 집어넣기
			var chStartDtInput = $('input[name="chStartDt"]');
			var chEndDtInput = $('input[name="chEndDt"]');
			var chAmtInput = $('input[name="chAmt"]');
			var chIdInput = $('input[name="chId"]');
			
			chAmtInput.val(amt);
			chStartDtInput.val(startDt);
			chEndDtInput.val(endDt);
			chIdInput.val(chId);
			
	    	// form의 action을 update.do로 변경
			$(conForm).attr("action", "${pageContext.request.contextPath}/contractHistory/update.do");
	    }
	}).on("hidden.bs.modal", function() {
		// 모달창 닫을 때 input창 초기화하기
		$('input[name="chStartDt"]').val("");
		$('input[name="chEndDt"]').val("");
		$('input[name="chAmt"]').val("");
		$('input[name="chId"]').val("");
	});
	
	function fn_showContractInfo() {
		var mark = document.getElementById("mark");
		mark.classList.toggle('bi-caret-down-square-fill'); // 'a' 클래스를 토글
		mark.classList.toggle('bi-caret-up-square-fill'); // 'b' 클래스를 토글
	}
	
	function fn_deleteContract() {
		var chIdInput = $('input[name="chId"]');
		console.log("value:", chIdInput.val());
		const chId = chIdInput.val();
		
		let formData = new FormData();
		formData.append("chId", chId); // 폼 필드 추가
		
		
		let data = {
				  chId: chId
				};
		let settings = {
			url : "${pageContext.request.contextPath }/contractHistory/delete.do",
			method : "post",
			data : data,
			dataType : "json",
			success : function(resp) {
				if (resp.result == "success") {
					alert("삭제 성공");
				} else { // fail
					alert("삭제 실패 : "+ resp.message);
				}
				location.href = "";
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			} //request line,header,body -> response processing
		};
		$.ajax(settings);
	}
</script>