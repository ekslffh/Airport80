<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">예산 접수</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">예산</a></li>
					        <li class="breadcrumb-item active">예산 접수</li>
					      </ol>
					    </nav>
				    </div>



<div id="budgetDiv">
	<form>
		<table id="ydTbl" class="table table-bordered"
			style="max-width: 500px;">
			<tr>
				<th style="vertical-align: middle;">연도</th>
				<td>
					<input name="year" type="number" class="form-control"  
						<c:if test="${not empty budgetInfo }">disabled value="${budget.budYear }"</c:if>
						<c:if test="${empty budgetInfo}">
						    <c:set var="currentYear" value="<%= new java.util.Date().getYear() + 1900 %>" />
						    value="${currentYear}"
						</c:if>					
					/>
				</td>
			</tr>
			<tr>
				<th style="vertical-align: middle;">부서</th>
				<td>
				    <select name="deptNo" class="form-select"
				    	<c:if test="${not empty budgetInfo }">disabled</c:if>
				    >
				        <option value="" ${empty budget.deptNo ? 'selected' : ''}>선택하세요</option>
				        <c:forEach items="${departments}" var="dept">
				            <option value="${dept.deptNo}" ${dept.deptNo eq budget.deptNo ? 'selected' : ''}>${dept.deptNm}</option>
				        </c:forEach>
				    </select>
				</td>
			</tr>
			<tr style="text-align: right;">
				<td colspan="2">
					<c:if test="${empty budgetInfo }">
						<a href="javascript:;fn_autoGenerate()" class="btn btn-warning">자동편성</a>
					</c:if>
					<a href="#" class="btn btn-primary" onclick="fn_register()">저장</a>
					<a class="btn btn-light" href="<c:url value='/accounting/budget/BudgetList.do' />">목록으로</a>
				</td>
			</tr>
		</table>
		
		<table class="table table-bordered" style="margin-top: 12px; table-layout: fixed; width: 100%;">
			<tr>
				<th>계정과목</th>
				<th>1분기</th>
				<th>2분기</th>
				<th>3분기</th>
				<th>4분기</th>
				<th>합계(₩)</th>
			</tr>
			<c:forEach items="${categories }" var="category">
				<c:set var="totalAmt" value="0" />
				<tr>
					<td>${category.acaNm }</td>
					<td><input class="oneq" data-category-id="${category.acaId}"
						data-category-name="${category.acaNm}" type="number"
						class="form-control" placeholder="1분기 금액입력"
						<c:forEach items='${budgetInfo.oneq.detailList}' var='oneqItem'>
			                  <c:if test='${oneqItem.acaId eq category.acaId}'>
			                      value="${oneqItem.bdAmt }"
			                      <c:set var="totalAmt" value="${totalAmt + oneqItem.bdAmt }" />
			                  </c:if>
			               </c:forEach> style="width: 150px;"/>
					</td>
					<td><input class="twoq" data-category-id="${category.acaId}"
						data-category-name="${category.acaNm }" type="number"
						class="form-control" placeholder="2분기 금액입력"
						<c:forEach items='${budgetInfo.twoq.detailList}' var='twoqItem'>
			                  <c:if test='${twoqItem.acaId eq category.acaId}'>
			                      value="${twoqItem.bdAmt }"
			                      <c:set var="totalAmt" value="${totalAmt + twoqItem.bdAmt }" />
			                  </c:if>
			                </c:forEach> style="width: 150px;"/>
					</td>
					<td><input class="threeq" data-category-id="${category.acaId}"
						data-category-name="${category.acaNm }" type="number"
						class="form-control" placeholder="3분기 금액입력"
						<c:forEach items='${budgetInfo.threeq.detailList}' var='threeqItem'>
			                  <c:if test='${threeqItem.acaId eq category.acaId}'>
			                      value="${threeqItem.bdAmt }"
			                      <c:set var="totalAmt" value="${totalAmt + threeqItem.bdAmt }" />
			                  </c:if>
			                </c:forEach> style="width: 150px;"/>
					</td>
					<td><input class="fourq" data-category-id="${category.acaId}"
						data-category-name="${category.acaNm }" type="number"
						class="form-control" placeholder="4분기 금액입력"
						<c:forEach items='${budgetInfo.fourq.detailList}' var='fourqItem'>
			                  <c:if test='${fourqItem.acaId eq category.acaId}'>
			                      value="${fourqItem.bdAmt }"
			                      <c:set var="totalAmt" value="${totalAmt + fourqItem.bdAmt }" />
			                  </c:if>
			                </c:forEach> style="width: 150px;"/>
					</td>
					<td><input class="totalAmt"
						data-category-id="${category.acaId}" type="number"
						class="form-control" disabled value="${totalAmt }" style="width: 150px;"/></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</div>



				</div>
			</div>
		</div>
	</div>
</section>






<script>
	function fn_register() {
		var data = {};
		// 연도와 부서정보 넣어주기 (공통)
		let year = $("input[name='year']").val();
		let deptNo = $(":input[name='deptNo']").val();
		// 유효성 검사
		if (year == '') {
			alert("연도를 입력해주세요.");
			return;
		}
		if (deptNo == '') {
			alert("부서를 선택해주세요.")
			return;
		}
		// 보내줄 data에 값 넣어주기
		data.year = year;
		data.deptNo = deptNo;
		console.log("data: ", data);
		// 분기별로 카테고리 구분해서 예산 갖고 놀기
		data.oneq = [];
		data.oneqAmt = 0;
		$(".oneq").each(function(index, element) {
			// 이 안에서 요소(element)를 조작할 수 있습니다.
			// index는 현재 요소의 인덱스이며, element는 현재 요소 자체입니다.

			// 예시: 현재 요소의 텍스트를 콘솔에 출력
			const acaId = $(element).data('categoryId');
			const acaNm = $(element).data('categoryName');
			const bdAmt = $(element).val();

			// 1분기 전체 예산 계산하기
			data.oneqAmt += parseInt(bdAmt);

			// budgetDetail에 맞게 값 넣어서 배열에 저장
			var temp = {};
			temp['acaId'] = acaId;
			temp['acaNm'] = acaNm;
			temp['bdAmt'] = bdAmt;

			data.oneq.push(temp);
		});

		data.twoq = [];
		data.twoqAmt = 0;
		$(".twoq").each(function(index, element) {
			const acaId = $(element).data('categoryId');
			const acaNm = $(element).data('categoryName');
			const bdAmt = $(element).val();

			// 2분기 전체 예산 계산하기
			data.twoqAmt += parseInt(bdAmt);

			var temp = {};
			temp['acaId'] = acaId;
			temp['acaNm'] = acaNm;
			temp['bdAmt'] = bdAmt;

			data.twoq.push(temp);
		});

		data.threeq = [];
		data.threeqAmt = 0;
		$(".threeq").each(function(index, element) {
			const acaId = $(element).data('categoryId');
			const acaNm = $(element).data('categoryName');
			const bdAmt = $(element).val();

			// 3분기 전체 예산 계산하기
			data.threeqAmt += parseInt(bdAmt);

			var temp = {};
			temp['acaId'] = acaId;
			temp['acaNm'] = acaNm;
			temp['bdAmt'] = bdAmt;

			data.threeq.push(temp);
		});

		data.fourq = [];
		data.fourqAmt = 0;
		$(".fourq").each(function(index, element) {
			const acaId = $(element).data('categoryId');
			const acaNm = $(element).data('categoryName');
			const bdAmt = $(element).val();

			// 4분기 전체 예산 계산하기
			data.fourqAmt += parseInt(bdAmt);

			var temp = {};
			temp['acaId'] = acaId;
			temp['acaNm'] = acaNm;
			temp['bdAmt'] = bdAmt;

			data.fourq.push(temp);
		});
		
		// insert일때
		let url = "${pageContext.request.contextPath }/accounting/budget/BudgetInsertForm.do";
		// update일때 url변경
		if(${not empty budgetInfo}) {
			url = "${pageContext.request.contextPath }/accounting/budget/BudgetUpdate.do"
		}

		let settings = {
			url : url,
			method : "POST",
			data : JSON.stringify(data),
			contentType : "application/json", // JSON 형식의 데이터를 전송한다고 지정
			dataType : "text",
			success : function(resp) {
				console.log(resp);
				location.href = "${pageContext.request.contextPath}/accounting/budget/BudgetList.do?year=" + year + "&deptNo=" + deptNo;
			},
			error : function(error) {
				alert(error);
				location.href = "";
			} 
		};
		
		$.ajax(settings);
	}
	
	$(document).ready(function() {
		$('input[data-category-name]').on('input', function() {
			// 클래스가 totalAmt이고 category-id 속성이름으로 합계를 입력할 특정 input 요소 찾기
			const categoryId = $(this).data('categoryId');
		    var inputs = $("input[data-category-id='" + categoryId + "']:not(.totalAmt)");
		    var totalAmt = 0;
		    $(inputs).each(function() {
		    	let value = $(this).val();
		    	if (value == '') value = 0;
		    	totalAmt += parseInt(value);
		    })
		    var target = $("input.totalAmt[data-category-id='" + categoryId + "']")[0];
			$(target).val(totalAmt);
		});
	});
	
	function fn_autoGenerate() {
		const data = {};
		
		let year = $("input[name='year']").val();
		let deptNo = $(":input[name='deptNo']").val();
		$("input[name='year']").val('');
// 		$(":input[name='deptNo']").val('');
		
		// 유효성 검사
		if (year.trim() == '') {
			alert("연도를 입력해주세요.");
			return;
		} else if (deptNo.trim() == '') {
			alert("부서를 선택해주세요.");
			return;
		}
		
		data.budYear = year;
		data.deptNo = deptNo;
		
		function calcTotalAmt() {
			$('.totalAmt').each(function() {
				let categoryId = $(this).data('categoryId');
			    var inputs = $("input[data-category-id='" + categoryId + "']:not(.totalAmt)");
			    var totalAmt = 0;
				$(inputs).each(function() {
					// 비어있으면 0값 넣어주기
					let value = 0;
					if ($(this).val() != '') value = parseInt($(this).val());
					totalAmt += value;					
				});
				$(this).val(totalAmt);
			});
		}
		
		let settings = {
			url : "${pageContext.request.contextPath }/accounting/budget/autoGenerate.do",
			method : "get",
			data : data,
			dataType : "json",
			success : function(resp) {
				if (resp.oneq == null) {
					alert("해당하는 연도와 부서에 대해서 지정된 값이 없습니다.");
					return;
				}
				// 여기서 oneq, twoq, threeq, fourq 가지고 각 화면에 자동편성해주기?
				// 1분기 편성
				resp.oneq.detailList.forEach(function(item) {
					// data-category-id 속성과 클래스가 일치하는 요소 선택
				    var element = $("input[data-category-id='" + item.acaId + "'].oneq")[0];
					$(element).val(item.bdAmt);
				})
				// 2분기
				resp.twoq.detailList.forEach(function(item) {
					// data-category-id 속성과 클래스가 일치하는 요소 선택
				    var element = $("input[data-category-id='" + item.acaId + "'].twoq")[0];
					$(element).val(item.bdAmt);
				})
				// 3분기
				resp.threeq.detailList.forEach(function(item) {
					// data-category-id 속성과 클래스가 일치하는 요소 선택
				    var element = $("input[data-category-id='" + item.acaId + "'].threeq")[0];
					$(element).val(item.bdAmt);
				})
				// 4분기
				resp.fourq.detailList.forEach(function(item) {
					// data-category-id 속성과 클래스가 일치하는 요소 선택
				    var element = $("input[data-category-id='" + item.acaId + "'].fourq")[0];
					$(element).val(item.bdAmt);
				})
				calcTotalAmt();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			} 
		};
		$.ajax(settings);
	}
</script>