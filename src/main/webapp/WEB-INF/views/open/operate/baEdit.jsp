<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<main>
<form:form method="post" modelAttribute="ba"
	enctype="multipart/form-data">
	<form:hidden path="baId" value="${baId }" />
	<form:hidden path="atchFileId" value="${atchFileId }" />

<style>
h1 {
	color: white;
}

 .btn-outline-dark {
        background-color: white; 
        color: #black; 
        border-color: #black; 

    }

.parent-container {
	max-height: 600px; /* 최대 높이 설정 */
}
th{
	width:250px;
}
</style>


<!-- ======= Hero Section ======= -->
<section id="hero" class="hero">

	<div class="info d-flex align-items-center">
		<div class="container">

					<nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="http://localhost/Airport80/"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item active" style="color:white;">모집 공고</li>
					        <li class="breadcrumb-item active" style="color:white;">입찰신청</li>
					        <li class="breadcrumb-item active" style="color:white;">신청정보 수정</li>
					      </ol>
					    </nav>

			<br> <br> <br>
			<h1 style="font-size: 25px;">신청정보 (<span class="baid" style="font-size:20px; color:orange;">${ba.baId }</span>) 수정</h1>


			<div class="parent-container">
				<table class="table table-border">

					<tr>
			<th class="table-light">공고번호</th>
			<td><form:input path="baBnNo" name="bnNo" class="form-control" readonly="true"
					value="${bn.bnNo }" /> <form:errors path="baBnNo" class="error" /></td>
		</tr>
		
<!-- 		<tr> -->
<!-- 			<th>위치</th> -->
<%-- 			<td><form:input path="baReqSpace" name="bnEnterLoc" --%>
<%-- 				class="form-control" readonly="true" value="${bn.bnEnterLoc }" /> <form:errors  --%>
<%-- 					path="baReqSpace" class="error" /></td>  --%>
<!-- 		</tr> -->
		

		<tr>
			<th class="table-light">업체이름</th>
			<td><form:input path="baCoNm" class="form-control" /> <form:errors
					path="baCoNm" class="error" /></td>
		</tr>

		<tr>
			<th class="table-light">운영시간</th>
			<td><form:input path="baStartTime" type="time" id="startTime" class="form-control custom-input-size" style="display: inline-block; width: auto;" /> <span>부터</span>
				<form:input path="baEndTime" type="time" id="endTime" class="form-control custom-input-size" style="display: inline-block; width: auto;" /> <span>까지</span>
			</td>
		</tr>

		<tr>
			<th class="table-light">이메일</th>
			<td>
            <div style="display: flex; align-items: center;">
                <form:input path="baEmail" class="form-control" style="width:200px;" />&nbsp; @ &nbsp;
                <form:select id="baEmailDo" path="baEmailDo" class="form-control" style="width:200px;">
                    <form:option value="">-- 이메일 주소 --</form:option>
                    <form:option value="naver.com">naver.com</form:option>
                    <form:option value="daum.net">daum.net</form:option>
                    <form:option value="gmail.com">gmail.com</form:option>
                    <form:option value="kakao.com">kakao.com</form:option>
                    <form:option value="hanmail.net">hanmail.net</form:option>
                </form:select>
            </div>
         </td>

		</tr>
		<tr>
			<th class="table-light">전화번호</th>
			<td><form:input path="baContact" class="form-control" id="phoneNumberInput" maxlength="13"/> <form:errors
					path="baContact" class="error" /></td>
		</tr>
		<tr>
		<th class="table-light">사업자등록증 첨부</th>
			<td>
				<input type="file" name="baFiles" multiple />
			</td>
		</tr>
		
		
<!-- 		<td colspan="2"><input class="btn btn-outline-dark" type="submit" -->
<!-- 			value="저장" /> <a -->
<%-- 			href="<c:url value="/open/operate/baView.do" />" --%>
<!-- 			class="btn btn-outline-dark">취소</a> -->
<%-- 		<a href="<c:url value="/operate/bidApplication/baList.do" />" class="btn btn-outline-dark">목록</a> --%>
<!-- </td> -->

					
				</table>
			</div>
			
	

			<div style="text-align: right; margin-top: 10px;">
				<input class="btn btn-primary" type="submit" value="저장" />
				<a href="<c:url value="/open/operate/bnList.do#balist" />" class="btn btn-secondary">목록</a>
			</div>

			</div>


	</div>

	
	
	<div id="hero-carousel" class="carousel slide" data-bs-ride="carousel"
		data-bs-interval="5000">
	


		<div class="carousel-item active"
			style="background-image: url(resources/open/assets/img/hero-carousel/airport1.jpg)"></div>
</div>
</section>

<section id="hero" class="hero"></section>

</form:form>
</main>


<script>
document.getElementById('phoneNumberInput').addEventListener('input', function (event) {
    const input = event.target;
    const value = input.value.replace(/\D/g, ''); // 숫자 이외의 문자 제거

    if (value.length > 0) {
        input.value = formatPhoneNumber(value); // 형식에 맞게 변환된 값으로 설정
    } else {
        input.value = ''; // 빈 값일 경우 빈 문자열로 설정
    }
});

// 전화번호 형식에 맞게 변환하는 함수
function formatPhoneNumber(value) {
    const formattedValue = value.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    return formattedValue;
}
</script>
