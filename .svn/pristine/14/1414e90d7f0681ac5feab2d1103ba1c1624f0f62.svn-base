<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">품목등록</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">재고관리</a></li>
					        <li class="breadcrumb-item"><a href="#">재고</a></li>
					        <li class="breadcrumb-item active">품목등록</li>
					      </ol>
					    </nav>
					 </div>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title"></h5>
					<p></p>
					<form:form method="post" modelAttribute="stockList">
						<form:hidden path="stId" />
						<form:hidden path="stStatus" value="적정" />
						<table class="table table-border">
							<tr>
								<th>품명</th>
								<td><input class="form-control" type="text" name="stNm"
									value="${stockList.stNm }" /><span class="error">${errors["stNm"]}</span></td>
							</tr>
							<tr>
								<th>분류명</th>
								<td><form:select path="stCtgr" class="form-select">
										<form:option value="" label="분류선택" />
										<form:options items="${commonCode }" itemLabel="codeNm"
											itemValue="codeId" />
									</form:select> <form:errors path="stCtgr" class="error" /></td>
							</tr>
							<tr>
								<th>가격</th>
								<td> <input class="form-control" type="text" name="stPrice" id="priceInput" value="${stockList.stPrice}" oninput="formatPrice(this)" />
								<span
									class="error">${errors["stPrice"]}</span></td>
							</tr>
							<tr>
								<th>단위</th>
								<td><input class="form-control" type="text" name="stUnit"
								value="${stockList.stUnit }" />
									<span class="error">${errors["stUnit"]}</span></td>
							</tr>
							<tr>
								<th>현재고</th>
								<td><input class="form-control" type="text"
									name="stQuantity" value="${stockList.stQuantity }" /><span
									class="error">${errors["stQuantity"]}</span></td>
							</tr>
							<tr>
								<th>위치</th>
								<td><form:select path="stLoc" class="form-select">
										<form:option value="" label="구역선택" />
										<form:options items="${zoneList }" itemLabel="zoneCd"
											itemValue="zoneCd" />
									</form:select> <form:errors path="stLoc" class="error" /></td>
							</tr>
							<tr>
								<th>거래업체</th>
								<td><form:select path="stSprId" class="form-select">
									<form:option value="" label="거래처선택" />
									<form:options items="${supplier}" itemLabel="sprNm"
										itemValue="sprId" />
								</form:select><form:errors path="stSprId" class="error"/></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: right;"><input class="btn btn-primary"
									type="submit" value="등록"> <input class="btn btn-dark"
									type="reset" value="취소"> <input
									class="btn btn-outline-dark deletebtn" type="button" value="뒤로가기"
									onclick="history.back();"></td>
							</tr>
						</table>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</section>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
function formatPrice(input) {
    let value = input.value.replace(/,/g, ''); // 쉼표(,) 제거
    value = parseInt(value, 10); // 정수로 변환

    // 1000단위마다 쉼표 추가
    input.value = addCommas(value);
}

function addCommas(price) {
    return price.toLocaleString(); // 숫자를 1000단위로 쉼표를 가진 문자열로 변환
}
</script>