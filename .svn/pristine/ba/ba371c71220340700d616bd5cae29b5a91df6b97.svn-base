<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">점검일정/일지</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">일정현황</a></li>
					        <li class="breadcrumb-item active">점검일정/일지</li>
					      </ol>
					    </nav>
					 </div>


<!-- Accordion without outline borders -->
<div class="accordion accordion-flush" id="accordionFlushExample">
	<div class="accordion-item">
		<h2 class="accordion-header d-flex" id="flush-headingOne">
			
			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne" style="    width: 250px; margin-left: 10px">
				<h4 class="mt0">
					<i class="ri-upload-2-fill"></i> <i class="fa fa-cube" aria-hidden="true"></i>점검 일정 업로드
				</h4>
			</button>
			
			<table class="table table-bordered" style="width: 50%;  margin-left: auto; margin-top: 10px; font-size: 20px; margin-right: 10px;">
						<thead>
							<tr class="table-primary">
								<th style="width: 220px;">${thisMonth} 점검일정</th>
								<th>월 전체</th>
								<th>미흡</th>
								<th>정상</th>
								<th>점검 대기</th>
							</tr>
						</thead>
						<tbody id="table1">
							<tr>
								<td>수</td>
								<td><div>${work.TCnt}</div></td>
								<td><div>${work.NCnt}</div></td>
								<td><div>${work.SCnt}</div></td>
								<td><div>${work.wtCnt}</div></td>
							</tr>
						</tbody>
			</table>
		</h2>
		<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
			<div class="accordion-body">
				<div id="contAreaBox">
					<form name="inputForm" method="post" onsubmit="return _onSubmit();" action="${path}/infra/repLogByexcel" enctype="multipart/form-data" class="form-horizontal">
						<div class="panel">
							<div class="panel-body">

								<div class="table-responsive">
									<p>양식파일을 다운로드 하시고 파일내에 있는 모든 항목들을 채워서 업로드하셔야 정상적으로 등록됩니다.</p>
									<table id="datatable-scroller" class="table table-bordered tbl_Form">
										<colgroup>
											<col width="250px" />
											<col />
										</colgroup>
										<tbody>
											<tr>
												<th class="active" style="text-align: right"><label class="control-label" for="">파일 업로드</label></th>
												<td><input type="file" name="file" id="file" accept=".xlsx, .xls" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="pull-right">
							<button type="submit" class="btn btn-success">
								<i class="bi bi-check-circle"></i> 엑셀파일 업로드
							</button>
							<a href="/Airport80/resources/document/reqins.xlsx" class="btn btn-outline-warning"><i class="bi bi-folder"></i> 양식파일 다운로드</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Accordion without outline borders -->


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title"></h5>

					<!-- Pills Tabs -->
					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link ${tabs[0]}" id="pills-home-tab" data-bs-toggle="pill" name="tabsBtn" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
							>전체</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link ${tabs[1]}" id="pills-profile-tab" data-bs-toggle="pill" name="tabsBtn" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile"
							>월 점검 대기</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link ${tabs[2]}" id="pills-contact-tab" data-bs-toggle="pill" name="tabsBtn" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact"
							>유지보수 대기</button>
						</li>
					</ul>
					<div class="tab-content pt-2" id="myTabContent">
						<div class="tab-pane fade ${tabs[3]}" id="pills-home" role="tabpanel" aria-labelledby="home-tab">
							<table class="table Default Table">
								<thead class="table-light">
									<tr>
										<th>점검명</th>
										<th>점검일자</th>
										<th>구역</th>
										<th>시설</th>
										<th>수정시간</th>
										<th>점검주기</th>
										<th>점검결과</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody id="table1">
									<c:set var="rncReq" value="${paging.dataList }" />
									<c:if test="${empty repLog }">
										<tr>
											<td colspan="10">요청내용 없음.</td>
										</tr>
									</c:if>
									<c:if test="${not empty repLog}">
										<c:forEach items="${repLog }" var="repLog">
											<input type="hidden" value="${repLog}" />
											<tr onClick="location.href='${path}/infra/repLogView?what=${repLog.rlNo }'">
												<td>${repLog.rlIt }</td>
												<td>${repLog.rlDt }</td>
												<td>${repLog.zone.zoneFloor }층${repLog.zone.zoneCtgr }</td>
												<td class="content">${repLog.facility.fcNm }</td>
												<td>${repLog.rlUpdTs.toString().split(':')[0].replace('T', ' ')}:${repLog.rlUpdTs.toString().split(':')[1]}</td>
												<td>${repLog.rlIc }</td>
												<td>${repLog.common.codeNm2 }</td>
												<td>${repLog.common.codeNm1 }</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						<div class="tab-pane fade ${tabs[4]}" id="pills-profile" role="tabpanel" aria-labelledby="profile-tab">
							<table class="table Default Table">
								<thead class="table-light">
									<tr>
										<th>점검명</th>
										<th>점검일자</th>
										<th>구역</th>
										<th>시설</th>
										<th>수정시간</th>
										<th>점검주기</th>
										<th>점검결과</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody id="table1">
									<c:set var="rncReq" value="${paging.dataList }" />
									<c:if test="${empty wtLog }">
										<tr>
											<td colspan="10">요청내용 없음.</td>
										</tr>
									</c:if>
									<c:if test="${not empty wtLog}">
										<c:forEach items="${wtLog }" var="wtLog">
											<input type="hidden" value="${wtLog}" />
											<tr onClick="location.href='${path}/infra/repLogView?what=${wtLog.rlNo }'">
												<td>${wtLog.rlIt }</td>
												<td>${wtLog.rlDt }</td>
												<td>${wtLog.zone.zoneFloor }층${wtLog.zone.zoneCtgr }</td>
												<td class="content">${wtLog.facility.fcNm }</td>
												<td>${wtLog.rlUpdTs.toString().split(':')[0].replace('T', ' ')}:${wtLog.rlUpdTs.toString().split(':')[1]}</td>
												<td>${wtLog.rlIc }</td>
												<td>${wtLog.common.codeNm2 }</td>
												<td>${wtLog.common.codeNm1 }</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						<div class="tab-pane fade ${tabs[5]}" id="pills-contact" role="tabpanel" aria-labelledby="contact-tab">
							<table class="table Default Table">
								<thead class="table-light">
									<tr>
										<th>점검명</th>
										<th>점검일자</th>
										<th>구역</th>
										<th>시설</th>
										<th>수정시간</th>
										<th>점검주기</th>
										<th>점검결과</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody id="table1">
									<c:set var="rncReq" value="${paging.dataList }" />
									<c:if test="${empty nnLog }">
										<tr>
											<td colspan="10">요청내용 없음.</td>
										</tr>
									</c:if>
									<c:if test="${not empty nnLog}">
										<c:forEach items="${nnLog }" var="nnLog">
											<input type="hidden" value="${nnLog}" />
											<tr onClick="location.href='${path}/infra/repLogView?what=${nnLog.rlNo }'">
												<td>${nnLog.rlIt }</td>
												<td>${nnLog.rlDt }</td>
												<td>${nnLog.zone.zoneFloor }층${nnLog.zone.zoneCtgr }</td>
												<td class="content">${nnLog.facility.fcNm }</td>
												<td>${nnLog.rlUpdTs.toString().split(':')[0].replace('T', ' ')}:${nnLog.rlUpdTs.toString().split(':')[1]}</td>
												<td>${nnLog.rlIc }</td>
												<td>${nnLog.common.codeNm2 }</td>
												<td>${nnLog.common.codeNm1 }</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<!-- End Pills Tabs -->
								<table style="margin: 0 auto;">
									<tr>
										<td colspan="5">
											<div class="d-flex justify-content-center mb-5">
												${paging.pagingHTML }
												<!-- a태그 동작 -->
											</div>

											<div id="searchUI" class="row justify-content-center">
												<div class="col-auto">
													<form:select path="simpleCondition.searchType" class="form-select">

														<form:option value="" label="전체" />
														<form:option value="name" label="점검명" />
														<form:option value="loc" label="위치" />
														<form:option value="obj" label="시설" />
														<form:option value="ir" label="상태" />
													</form:select>

												</div>
												<div class="col-auto">
													<form:input path="simpleCondition.searchWord" class="form-control" />
												</div>
												<div class="col-auto">
													<input type="button" value="검색" id="searchBtn" class="btn-outline-dark deletebtn" />
												</div>
											</div>
										</td>
									</tr>
								</table>

					<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
						<!--  데이터 전송 용도  -->
						<form:hidden path="searchType" />
						<form:hidden path="searchWord" />
						<input type="hidden" name="mode" value="${param.mode }" />
						<input type="hidden" name="page" />
						<input type="hidden" name="tabs" />
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


<script type="text/javascript">
	// 데이터 입력 결과 메세지
	$(document).ready(function() {
		var msg = "${resMap.msg}";
		console.log("msg", msg);
		if (msg != "")
			Swal.fire({
				  icon: 'success',
				  title: msg
				})
	});
	// 데이터 엑셀 등록
	function _onSubmit() {
		if ($("#file").val() == "") {
			Swal.fire({
				  icon: 'warning',
				  title: "파일을 업로드해주세요.",
				})
			$("#file").focus();
			return false;
		}

		if (!confirm(gTxt("confirm.save"))) {
			return false;
		}
		return true;
	}
	var ariaSelectedValue = 0;
	
	function fn_paging(page) {
		for (var i = 0; i < 3; i++) {
	        if ($("button[name='tabsBtn']").eq(i).attr("aria-selected") === "true") {
	            ariaSelectedValue = i;
	            break; // 값을 찾았으면 루프 중단
	        }
	    }
		// form의 hidden input 값으로 ariaSelectedValue 설정
	    $("input[name='tabs']").val(ariaSelectedValue);
		
		searchForm.page.value = page;
		$(searchForm).submit();
		//     searchForm.requestSubmit();
	}

	// searchUI에서 입력을 받은 데이터를 searchForm으로 옮겨야함
	$(searchBtn).on("click", function(event) {
		//     $ find : children을 찾겠다. name속성을 가지고 있는 input태그 중에서 모든 input태그
		$(searchUI).find(":input[name]").each(function(idx, input) { //셀렉트/ input
			let name = input.name; //하나의 input태그의 name속성
			let value = $(input).val();
			$(searchForm).find(`[name=\${name}]`).val(value);
		});
		for (var i = 0; i < 3; i++) {
	        if ($("button[name='tabsBtn']").eq(i).attr("aria-selected") === "true") {
	            ariaSelectedValue = i;
	            break; // 값을 찾았으면 루프 중단
	        }
	    }
		// form의 hidden input 값으로 ariaSelectedValue 설정
	    $("input[name='tabs']").val(ariaSelectedValue);
		$(searchForm).submit();
	});

	function triggerSearch() {
		const type = "stts";
		const word = $("#dept1").val();

		$(searchType).val(type);
		$(searchWord).val(word);
		$(searchForm).submit();
	}

</script>
