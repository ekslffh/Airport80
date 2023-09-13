<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<div class="card">
	<div class="card-header" style="padding: 9px 15px 9px; color: #787878; background: #c5d0e3; color: white; font-size: 19px;">입찰 현황</div>
	<div class="card-body" >


<table class="table Default Table" style="margin-top:20px;">
	
		<tr>
			<th class="table-light" style="text-align: center">신청아이디</th>
			<th class="table-light" style="text-align: center" >공고번호</th>
			<th class="table-light" style="text-align: center">위치</th>
			<th class="table-light" style="text-align: center">신청일시</th>
			<th class="table-light" style="text-align: center">상태</th>
		</tr>

	<tbody>
		<c:set value="${paging.dataList }" var="baList" />
		<c:if test="${empty baList }">
			<tr>
				<td colspan="5" />
			</tr>
		</c:if>
		<c:if test="${not empty baList }">
			<c:forEach items="${baList }" var="ba">
				<c:url value="/operate/bidApplication/baView.do" var="viewURL">
					<c:param name="what" value="${ba.baId }" />
				</c:url>

				<tr>
					<td class="text-center"><a href="${viewURL }">${ba.baId }</a></td>
					<td class="text-center">${ba.baBnNo }</td>
					<td class="text-center">${ba.baReqSpace }</td>
					<td class="text-center">${ba.baCrtTs }</td>


					<td class="text-center"><a href=""
						class="btn btn-light graybd ba-button btn-sm"
						data-bs-toggle="modal" data-bs-target="#verticalycentered"
						data-baid="${ba.baId}"> <c:choose>
								<c:when test="${ba.baStatus == '신청접수'}">
									<span style="color: orange;">${ba.baStatus}</span>
								</c:when>
								<c:when test="${ba.baStatus == '계약진행'}">
									<span style="color: limegreen;">${ba.baStatus}</span>
								</c:when>
								<c:when test="${ba.baStatus == '계약완료'}">
									<span style="color: limegreen;">${ba.baStatus}</span>
								</c:when>
								<c:otherwise>${ba.baStatus}</c:otherwise>
							</c:choose>
					</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
	<tfoot>
		<tr>
			<td colspan="5">
				<div class="d-flex justify-content-center mb-3">
					${paging.pagingHTML }</div>
				<div id="searchUI" class="row justify-content-center">
					<div class="col-auto">
						<form:select path="simpleCondition.searchType" class="form-select">
							<form:option value="" label="전체" />
							<form:option value="baBnNo" label="공고번호" />
							<form:option value="baStatus" label="상태" />
						</form:select>
					</div>
					<div class="col-auto">
						<form:input path="simpleCondition.searchWord" class="form-control" />
					</div>
					<div class="col-auto">
						<input type="button" value="검색" id="searchBtn"
							class="btn btn-secondary" />

					</div>
				</div>
			</td>
		</tr>
	</tfoot>
</div>
</div>

<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
	<form:hidden path="searchType" />
	<form:hidden path="searchWord" />
	<input type="hidden" name="page" />
</form:form>

<!-- Vertically centered Modal             -->
<div class="modal fade" id="verticalycentered" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">상태변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form:form id="baForm" method="post"
					action="${pageContext.request.contextPath }/operate/bidApplication/ajaj/baStatusUpdate.do"
					modelAttribute="ba">

					<form:hidden path="baId" id="baidValue" />

					<span>상태</span>
					<form:select class="form-select" type="text" path="baStatus"
						style="display:inline; width:70%; margin-left: 40px;">
						<form:option value="" label="상태변경" />
						<form:option value="신청접수" label="신청접수" />
						<form:option value="계약진행" label="계약진행" />
						<form:option value="계약완료" label="계약완료" />
					</form:select>
					<form:errors path="baStatus" class="error" />
					<br>
			</div>
			<div class="modal-footer">
				<button id="cancelBtn" type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<button id="changeBtn" type="button" class="btn btn-primary" onclick="fn_change()">변경</button>
			</div>
			</form:form>
		</div>
	</div>
</div>

<script>
	
// 	let selectBaId;
	
	
// 	const baButtons = document.querySelectorAll('.ba-button');
// 	baButtons.forEach(button =>{
// 		button.addEventListener('click', function(){
// 			selectBaId = this.getAttribute('data-baid');
// 			$('#baidValue').val(selectBaId);
// 		})
// 	})
</script>