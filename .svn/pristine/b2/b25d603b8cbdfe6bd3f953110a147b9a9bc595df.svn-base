<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> -->

<style>
.card-text br {
	content: "";
	display: block;
	border-top: 1px solid #ccc; /* 가로 구분선 스타일 지정 */
	margin: 8px 0; /* 구분선 위아래 여백 조정 (원하는 여백으로 조절) */
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
.searchBtnList {
    padding: 1px 10px 10px 21px;
    /*     padding: 12px 15px; */
}

</style>

<main style="background-color: rgba(0,0,0,0.4);">
<section class="section">

		<div class="info d-flex align-items-center">
			<div class="container">
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;">
						<h4 class="card-title" style="font-family: 'Pretendard-Regular';">입점 업체</h4>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">입점 업체</a></li>
								<li class="breadcrumb-item active">입점 업체 LIST</li>
							</ol>
						</nav>
					</div>

					<div class="d-flex" style="padding: 9px 15px 0px; border: 0; margin-right: 56px;" id="searchUI">
						<div class="d-flex" style="margin-left: auto;">
<!-- <!-- 							검색 UI --> 
							<p>
								<form:input type="search" class="form-control" placeholder="search" style="padding: 4px 0px 4px 14px; border: 1px solid rgb(0 0 0/ 30%);" id="searchInput"
  									path="simpleCondition.searchWord"/>
							</p>
							<span>
								<button type="submit" id="searchBtn" style="border: 0; padding: 0; margin-left: -30px; background: none; margin-top: 4px;">
									<i class="bi bi-search"></i>
								</button>
							</span>
						</div>
						
						
					</div>

<!-- 					<div class="searchBtnList d-flex"> -->
<!-- 						<div class="field" id="selCategoryDetail"> -->
<!-- 							<div class="field-division col-1"></div> -->
<!-- 							<div class="field-group" id="category_detail"> -->

<!-- 								<input type="radio" name="product" id="vendorAll" class="field-radio" value="ALL" -->
<!-- 								onclick="getVendorList();" checked="checked"> -->
<!-- 								<label class="field-radio-label">전체</label> -->

<!-- 								<input type="radio" name="product" id="vendorF" class="field-radio" value="3001" -->
<!-- 								onclick="getVendorList2()">  -->
<!-- 								<label class="field-radio-label"> 식당가 </label> -->
								
<!-- 								<input type="radio" name="product" id="vendorB" class="field-radio" value="3002" -->
<!-- 								onclick="getVendorList2('2')">  -->
<!-- 								<label class="field-radio-label"> 뷰티 </label> -->
								
<!-- 								<input type="radio" name="product" id="vendorL" class="field-radio" value="3003" -->
<!-- 								onclick="getVendorList2('3')">  -->
<!-- 								<label class="field-radio-label"> 명품브랜드 </label> -->
								
<!-- 								<input type="radio" name="product" id="vendorE" class="field-radio" value="3004" -->
<!-- 								onclick="getVendorList2('4')">  -->
<!-- 								<label class="field-radio-label"> 전자제품 </label>  -->
								
<!-- 								<input type="radio" name="product" id="vendorC" class="field-radio" value="3005" -->
<!-- 								onclick="getVendorList2('5')">  -->
<!-- 								<label class="field-radio-label"> 패션·액세서리 </label> -->
								
<!-- 								<input type="radio" name="product" id="vendorA" class="field-radio" value="3006" -->
<!-- 								onclick="getVendorList2('6')">  -->
<!-- 								<label class="field-radio-label"> 주류·담배 </label>  -->
								
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					

					<div class="container">
						<div class="row">
							<c:forEach items="${vendorList}" var="vendor">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<div class="card" style="width: 350px;">
										<div class="card-header" style="background-color:#ffeec0;">
											<c:choose>
												<c:when test="${vendor.vendType == '3001'}">식품(식당)</c:when>
												<c:when test="${vendor.vendType == '3002'}">뷰티</c:when>
												<c:when test="${vendor.vendType == '3003'}">명품</c:when>
												<c:when test="${vendor.vendType == '3004'}">전자제품</c:when>
												<c:when test="${vendor.vendType == '3005'}">패션</c:when>
												<c:when test="${vendor.vendType == '3006'}">주류·담배</c:when>
											</c:choose>
										</div>
										<img src="http://localhost/Airport80/resources/images/hr/${vendor.vendType }/${vendor.vendId }.png" alt="${vendor.vendId }" />
										<div class="card-body">
											<h5 class="card-title" style="font-family: 'Pretendard-Regular';">${vendor.vendNm}</h5>
											<p class="card-text">
												영업 시간 : ${vendor.vendOpHours } - ${vendor.vendClHours } <br> 연락처 : ${vendor.vendContact } <br> 위치 : ${vendor.vendLoc } <br> 주요 상품 : ${vendor.vendMvp } <br>
												etc : ${vendor.vendDesc }
											</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div id="section-carousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000"></div>
					</div>

</div>
</div>

<div id="hero-carousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
			<div class="carousel-item active" style="background-image: url(resources/open/assets/img/hero-carousel/airport1.jpg)"></div>
		</div>
</section>
</main>