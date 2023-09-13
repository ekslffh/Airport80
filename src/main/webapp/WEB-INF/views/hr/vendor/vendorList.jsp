<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.searchBtnList {
    padding: 1px 10px 10px 21px;
    /*     padding: 12px 15px; */
    background: #ffffff;
}

.field-group {
    display: block;
    margin-top: 10px;
}
.field .field-radio {
    display: inline-block;
    position: absolute;
    width: 10px;
    height: 10px;
    z-index: -999;
}
.field .field-radio + .field-radio-label {
    display: block;
    padding: 5px 10px;
    background: #fff;
    border: 1px solid #d9d9d9;
    color: #666;
    font-size: 0.875rem;
    float: left;
    cursor: pointer;
    margin : 0px 8px 0px 0px;
}
.field .field-radio:checked + .field-radio-label {
    background: #000;
    color: #fff;
    border: 1px solid #000;
}
</style>
<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<p></p>

					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">입점 업체 리스트</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">업체 관리</a></li>
					        <li class="breadcrumb-item active">입점 업체</li>
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
				    
				    
					<div class="searchBtnList">
						<div class="field" id="selCategoryDetail">
							<div class="field-division col-1"></div>
							<div class="field-group" id="category_detail">

								<input type="radio" name="product" id="vendorAll" class="field-radio" value="ALL"
								onclick="getVendorList();" checked="checked">
								<label class="field-radio-label">전체</label>

								<input type="radio" name="product" id="vendorF" class="field-radio" value="3001"
								onclick="getVendorList2()"> 
								<label class="field-radio-label"> 식당가 </label>
								
								<input type="radio" name="product" id="vendorB" class="field-radio" value="3002"
								onclick="getVendorList2('2')"> 
								<label class="field-radio-label"> 뷰티 </label>
								
								<input type="radio" name="product" id="vendorL" class="field-radio" value="3003"
								onclick="getVendorList2('3')"> 
								<label class="field-radio-label"> 명품브랜드 </label>
								
								<input type="radio" name="product" id="vendorE" class="field-radio" value="3004"
								onclick="getVendorList2('4')"> 
								<label class="field-radio-label"> 전자제품 </label> 
								
								<input type="radio" name="product" id="vendorC" class="field-radio" value="3005"
								onclick="getVendorList2('5')"> 
								<label class="field-radio-label"> 패션·액세서리 </label>
								
								<input type="radio" name="product" id="vendorA" class="field-radio" value="3006"
								onclick="getVendorList2('6')"> 
								<label class="field-radio-label"> 주류·담배 </label> 
								
							</div>
						</div>
					</div>
<br><br>

					<div class="card-body">
		<table class="table table-bordered" style="text-align: center">
			<thead class="table-light">
				<tr>
					<th>업체 아이디</th>
					<th>상호명</th>
					<th>담당자</th>
					<th>연락처</th>
					<th>위치</th>
					<th>분류</th>
					<th>납입 아이디</th>
					<th>계약 종료일</th>
					<th>계약 상태</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="vendorList" value="${paging.dataList }" />
				<c:forEach items="${vendorList }" var="vendor">
					<tr>
						<c:url value="/hr/vendor/vendorView.do" var="viewURL">
							<c:param name="what" value="${vendor.vendId }" />
						</c:url>
						<td>${vendor.vendId }</td>
						<td><a href="${viewURL }">${vendor.vendNm }</a></td>
						<td>${vendor.vendOwner }</td>
						<td>${vendor.vendContact }</td>
						<td>${vendor.zoneCtgr } ${vendor.vendFloor }층</td>
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
						<td>${vendor.ctrId }</td>
						<td>${vendor.chEndDt }
							<c:choose>
								<c:when test="${empty vendor.chEndDt }">생성 계약 없음</c:when>
							</c:choose>
						</td>
						<td style="text-align: center"><strong><a
								href="javascript:;" class="status-button" data-bs-toggle="modal"
								data-bs-target="#verticalycentered"
								data-vend-status="${vendor.ctrStatus}"
								data-vend-id="${vendor.vendId }"
								data-ctr-id="${vendor.ctrId }"> 
								<c:choose>
										<c:when test="${vendor.ctrStatus == 'V01'}">
											<span style="color: orange;">계약 대기</span>
										</c:when>
										<c:when test="${vendor.ctrStatus == 'V02'}">
											<span style="color: green;">계약 완료</span>
										</c:when>
										<c:when test="${vendor.ctrStatus == 'V03'}">
											<span style="color: indigo;">연장 계약</span>
										</c:when>
										<c:when test="${vendor.ctrStatus == 'V99'}">
											<span style="color: red;">퇴점</span>
										</c:when>
										<c:when test="${vendor.vendStatus == 'V88'}">
											<span style="color: black;">유찰</span>
										</c:when>
									</c:choose>
							</a></strong></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="9">
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

<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
	<form:hidden path="searchType" />
	<form:hidden path="searchWord" />
	<input type="hidden" name="page" />
</form:form>


<div class="modal fade" id="verticalycentered" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">입점사 운영 상태 변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="statusChangeForm" method="post"
					action="${pageContext.request.contextPath }/hr/vendor/vendorModal.do">
					<input id="vendId" type="hidden" name="vendId" /> 
					<input id="vendCtrId" type="hidden" name="vendCtrId" />
					<input id="ctrId" type="hidden" name="ctrId" />
					<span>상태</span>
					<select class="form-select" name="ctrStatus" id="ctrStatusSelect"
						style="display: inline; width: 70%; margin-left: 40px;">
						<option value="" label="상태변경" />
						<option value="V00" label="신규" />
						<option value="V01" label="계약 진행" />
						<option value="V02" label="계약 완료" />
						<option value="V03" label="연장 계약" />
						<option value="V99" label="만료(퇴점)" />
						<option value="V88" label="유찰" />
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


<script src="<c:url value='/resources/js/app/hr/vendorList.js'/>"></script>


