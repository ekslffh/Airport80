<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<%-- ${paging.simpleCondition.tab == 1 ? true : false} --%>
<%-- ${paging.dataList } --%>
<section class="section">
	<div class="row">

		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="card-header"
						style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">유지보수/청소요청내역</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i
										class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">접수</a></li>
								<li class="breadcrumb-item active">유지보수/청소요청내역</li>
							</ol>
						</nav>
					</div>


							<h5 class="card-title">유지보수 요청</h5>

							<!-- Pills Tabs -->
							<ul class="nav nav-pills mb-3" id="sttsNav" role="tablist">

								<li class="nav-item" role="presentation">
									<button
										class="nav-link ${paging.simpleCondition.tab == 0 ? 'active show' : ''}"
										id="unStts" data-bs-toggle="pill" data-bs-target="#pills-home"
										type="button" role="tab" aria-controls="pills-home"
										aria-selected="true">미등록</button>
								</li>

								<li class="nav-item" role="presentation">
									<button
										class="nav-link ${paging.simpleCondition.tab == 1 ? 'active show' : ''}"
										id="cpStts" data-bs-toggle="pill" data-bs-target="#pills-x"
										type="button" role="tab" aria-controls="pills-x"
										aria-selected="false">반려</button>
								</li>

								<li class="nav-item" role="presentation">
									<button
										class="nav-link ${paging.simpleCondition.tab == 2 ? 'active show' : ''}"
										id="allStts" data-bs-toggle="pill"
										data-bs-target="#pills-profile" type="button" role="tab"
										aria-controls="pills-profile" aria-selected="false">전체조회</button>
								</li>
							</ul>

							<!-- 검색하는 부분 -->
							<div class="searchUI row justify-content-end"
								data-target-form="#tab1Form" data-target-tbody="#table1">
								<div class="col-auto">
									<form:select path="simpleCondition.searchType"
										class="form-select">
										<form:option value="" label="전체" />
										<form:option value="id" label="요청ID" />
										<form:option value="loc" label="위치" />
										<form:option value="stts" label="상태" />
										<form:option value="content" label="내용" />
									</form:select>
								</div>
								<div class="col-auto">
									<form:input path="simpleCondition.searchWord"
										class="form-control" />
								</div>
								<div class="col-auto">
									<input type="button" value="검색"
										class="btn btn-outline-dark gray_btn" />
								</div>
							</div>

							<!-- 미등록 탭  -->
							<div class="tab-content pt-2" id="pills-tab-content">
								<div
									class="tab-pane fade ${paging.simpleCondition.tab == 0 ? 'active show' : ''}"
									id="pills-home" role="tabpanel" aria-labelledby="home-tab">
									<table class="table Default Table">
										<thead class="table-light">
											<tr>
												<th>요청ID</th>
												<th>위치</th>
												<th>고장내용</th>
												<th>요청일시</th>
												<th>작성자</th>
												<th>상태</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="table1">
											<c:set var="unList" value="${paging.dataList }" />
											<c:if test="${empty unList }">
												<tr>
													<td colspan="10">요청내용 없음.</td>
												</tr>
											</c:if>
											<c:if test="${not empty unList }">
												<c:forEach items="${unList }" var="un">
													<input type="hidden" name="rrType" value="${un.rrType}" />
													<tr>
														<td class="center-text">${un.rrId }</td>
														<td>${un.zone.zoneFloor }층${un.zone.zoneCtgr }</td>
														<td class="content">${un.rrContent }</td>
														<td>${un.rrTs.toString().split(':')[0].replace('T', ' ')}:${un.rrTs.toString().split(':')[1]}</td>
														<td>${un.employee.empNm }</td>
														<td>${un.common.codeNm }</td>
														<td><c:choose>
																<c:when test="${un.rrStts == 'UN'}">
																	<button onclick="javascript:;" data-who="${un.rrId}"
																		data-where="${un.zone.zoneCd}"
																		data-ca="${un.common.codeNm}" data-bs-toggle="modal"
																		data-bs-target="#disablebackdrop" class="rncReqid btn btn-outline-dark gray_btn">상세</button>
																	<button onclick="javascript:;" data-what="${un}"
																		data-rrid="${un.rrId }"
																		data-rr-content="${un.rrContent }"
																		data-rr-stts="${un.rrStts }" data-bs-toggle="modal"
																		data-bs-target="#companion" class="rncReqid btn btn-dark">반려</button>
																</c:when>
																<c:when test="${un.rrStts == 'CP' }">
																	<button onclick="javascript:;" data-who="${un.rrId}"
																		data-where="${un.zone.zoneCd}"
																		data-ca="${un.common.codeNm}" data-bs-toggle="modal"
																		data-bs-target="#disablebackdrop2" class="rncReqid btn btn-outline-dark gray_btn">상세</button>
																</c:when>
															</c:choose></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
									<div class="d-flex justify-content-center mb-5 pagingArea"
										data-target-form="#tab1Form">
										${paging.pagingHTML }
										<!-- a태그 동작 -->
									</div>
								</div>
								<!-- 미등록 탭  끝 -->

								<!-- 반려 탭  -->
								<div
									class="tab-pane fade ${paging.simpleCondition.tab == 1 ? 'active show' : ''}"
									id="pills-x" role="tabpanel" aria-labelledby="pills-x">
									<table class="table Default Table">
										<thead class="table-light">
											<tr>
												<th>요청ID</th>
												<th>위치</th>
												<th>고장내용</th>
												<th>요청일시</th>
												<th>작성자</th>
												<th>상태</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="table2">
											<c:set var="rncReq" value="${paging.dataList }" />
											<c:if test="${empty rncReq }">
												<tr>
													<td colspan="10">요청내용 없음.</td>
												</tr>
											</c:if>
											<c:if test="${not empty rncReq}">
												<c:forEach items="${rncReq }" var="cp">
													<input type="hidden" value="${cp.rrType}" />
													<tr>
														<td>${cp.rrId }</td>
														<td>${cp.zone.zoneFloor }층${cp.zone.zoneCtgr }</td>
														<td class="content">${cp.rrContent }</td>
														<td>${cp.rrTs.toString().split(':')[0].replace('T', ' ')}:${cp.rrTs.toString().split(':')[1]}</td>
														<td>${cp.employee.empNm }</td>
														<td>${cp.common.codeNm }</td>
														<td><c:choose>
																<c:when test="${cp.rrStts == 'UN'}">
																	<button onclick="javascript:;" data-who="${cp.rrId}"
																		data-where="${cp.zone.zoneCd}"
																		data-ca="${cp.common.codeNm}" data-bs-toggle="modal"
																		data-bs-target="#disablebackdrop" class="rncReqid btn btn-outline-dark gray_btn">상세</button>
																	<button onclick="javascript:;" data-what="${cp}"
																		data-rrid="${cp.rrId }"
																		data-rr-content="${cp.rrContent }"
																		data-rr-stts="${cp.rrStts }" data-bs-toggle="modal"
																		data-bs-target="#companion" class="rncReqid btn btn-dark">반려</button>
																</c:when>
																<c:when test="${cp.rrStts == 'CP' }">
																	<button onclick="javascript:;" data-who="${cp.rrId}"
																		data-where="${cp.zone.zoneCd}"
																		data-ca="${cp.common.codeNm}" data-bs-toggle="modal"
																		data-bs-target="#disablebackdrop2" class="rncReqid btn btn-outline-dark gray_btn">상세</button>
																</c:when>
															</c:choose></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
											<div class="d-flex justify-content-center mb-5 pagingArea"
												data-target-form="#tab1Form">
												${paging.pagingHTML }
												<!-- a태그 동작 -->
											</div>
										</div>
								<!-- 반려 탭 끝-->

								<!-- 전체조회 탭  -->
								<div
									class="tab-pane fade ${paging.simpleCondition.tab == 2 ? 'active show' : ''}"
									id="pills-profile" role="tabpanel"
									aria-labelledby="profile-tab">
									<table class="table Default Table">
										<thead class="table-light">
											<tr>
												<th>요청ID</th>
												<th>위치</th>
												<th>고장내용</th>
												<th>요청일시</th>
												<th>작성자</th>
												<th>상태</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="table3">
											<c:set var="rncReq" value="${paging.dataList }" />
											<c:if test="${empty rncReq }">
												<tr>
													<td colspan="10">요청내용 없음.</td>
												</tr>
											</c:if>
											<c:if test="${not empty rncReq}">
												<c:forEach items="${rncReq }" var="rnc">
													<input type="hidden" value="${rnc.rrType}" />
													<tr>
														<td>${rnc.rrId }</td>
														<td>${rnc.zone.zoneFloor }층${rnc.zone.zoneCtgr }</td>
														<td class="content">${rnc.rrContent }</td>
														<td>${rnc.rrTs.toString().split(':')[0].replace('T', ' ')}:${rnc.rrTs.toString().split(':')[1]}</td>
														<td>${rnc.employee.empNm }</td>
														<td>${rnc.common.codeNm }</td>
														<td><c:choose>
																<c:when test="${rnc.rrStts == 'UN'}">
																	<button onclick="javascript:;" data-who="${rnc.rrId}"
																		data-where="${rnc.zone.zoneCd}"
																		data-ca="${rnc.common.codeNm}" data-bs-toggle="modal"
																		data-bs-target="#disablebackdrop" class="rncReqid btn btn-outline-dark gray_btn">상세</button>
																	<button onclick="javascript:;" data-what="${rnc}"
																		data-rrid="${rnc.rrId }"
																		data-rr-content="${rnc.rrContent }"
																		data-rr-stts="${rnc.rrStts }" data-bs-toggle="modal"
																		data-bs-target="#companion" class="rncReqid btn btn-dark">반려</button>
																</c:when>
																<c:when test="${rnc.rrStts == 'CP' }">
																	<button onclick="javascript:;" data-who="${rnc.rrId}"
																		data-where="${rnc.zone.zoneCd}"
																		data-ca="${rnc.common.codeNm}" data-bs-toggle="modal"
																		data-bs-target="#disablebackdrop2" class="rncReqid btn btn-outline-dark gray_btn">상세</button>
																</c:when>
															</c:choose></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
										</table>
											<div class="d-flex justify-content-center mb-5 pagingArea"
												data-target-form="#tab1Form">
												${paging.pagingHTML }
												<!-- a태그 동작 -->
											</div>
										</div>
							<!-- 전체조회 탭  끝-->
							<!-- End Pills Tabs -->
							<form:form class="searchForm" modelAttribute="simpleCondition"
								id="tab1Form" method="get">
								<!--  데이터 전송 용도  -->
								<form:hidden path="tab" />
								<form:hidden path="searchType" />
								<form:hidden path="searchWord" />
								<input type="hidden" name="page" />
							</form:form>
						</div>
					</div>

					<div id="dynamicContent">
						<%-- <jsp:include page='/WEB-INF/views/infra/rncReq/cleaningReqList.jsp' /> --%>
					</div>

					<c:url value="/infra/rncReqView.do" var="viewURL" />
					<c:url value="/infra/rncReqCompanion.do" var="viewURL2" />

					<!--등록 모달창 -->
					<div class="modal fade" data-url="${viewURL}" id="disablebackdrop"
						tabindex="-1" data-bs-backdrop="false">
						<div class="modal-dialog"
							style="margin-top: 200px; margin-right: 120px;">
							<div class="modal-content"
								style="box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);">
								<div class="modal-header">
									<h5 class="modal-title">유지보수 접수</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">...</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary"
										onclick="redirectToOtherForm()" data-bs-dismiss="modal">등록</button>
									<button type="button" class="btn btn-secondary" id="closemodal"
										data-bs-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End Disabled Backdrop Modal-->

					<!--반려시 상세보기모달창-->
					<div class="modal fade" data-url="${viewURL}" id="disablebackdrop2"
						tabindex="-1" data-bs-backdrop="false">
						<div class="modal-dialog"
							style="margin-top: 200px; margin-right: 120px;">
							<div class="modal-content"
								style="box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);">
								<div class="modal-header">
									<h5 class="modal-title">반려 상세보기</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">...</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" id="closemodal"
										data-bs-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End Disabled Backdrop Modal-->

					<!-- 반려사유모달창 -->
					<div class="modal fade" data-url="${viewURL2}" id="companion"
						tabindex="-1" data-bs-backdrop="false">
						<div class="modal-dialog"
							style="margin-top: 200px; margin-right: 100px;">
							<div class="modal-content"
								style="box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);">
								<div class="modal-header">
									<h5 class="modal-title">반려</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">...</div>
								<div class="modal-footer">
									<!--         <button type="button" class="btn btn-secondary" onclick="redirectToUpdateForm()" data-bs-dismiss="modal">등록</button> -->
									<button type="button" class="btn btn-secondary" id="closemodal"
										data-bs-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End Disabled Backdrop Modal-->

				</div>
			</div>
		</div>
</section>


<script>
	//페이지가 로드될 때 기본 탭을 설정합니다.
	// document.addEventListener("DOMContentLoaded", function () {
	//     // 기본 탭을 미등록 탭으로 설정
	//     document.getElementById("unStts").click();
	// });

	// 탭을 클릭했을 때 실행할 함수
	function handleTabClick(tabId) {
		// 각 탭에 대한 작업을 수행합니다.
		switch (tabId) {
		case "unStts":
			// 미등록 탭을 클릭했을 때 수행할 작업
			// 예: 미등록 데이터를 로드하거나 다른 동작 수행
			console.log("미등록 탭을 클릭했습니다.");
			$(tab1Form).find("[name=tab]").val(0);
			break;
		case "cpStts":
			// 반려 탭을 클릭했을 때 수행할 작업
			// 예: 반려 데이터를 로드하거나 다른 동작 수행
			console.log("반려 탭을 클릭했습니다.");
			$(tab1Form).find("[name=tab]").val(1);
			break;
		case "allStts":
			// 전체조회 탭을 클릭했을 때 수행할 작업
			// 예: 전체 데이터를 로드하거나 다른 동작 수행
			console.log("전체조회 탭을 클릭했습니다.");
			$(tab1Form).find("[name=tab]").val(2);
			break;
		default:
			// 다른 탭을 클릭한 경우 기본 작업을 수행하거나 아무 작업도 하지 않습니다.
			console.log("알 수 없는 탭을 클릭했습니다.");
			break;
		}

		// form제출
		$(tab1Form).submit();
	}

	// 각 탭 버튼에 클릭 이벤트 핸들러를 추가합니다.
	document.getElementById("unStts").addEventListener("click", function() {
		handleTabClick("unStts");
	});

	document.getElementById("cpStts").addEventListener("click", function() {
		handleTabClick("cpStts");
	});

	document.getElementById("allStts").addEventListener("click", function() {
		handleTabClick("allStts");
	});

	//등록버튼 클릭시 나타나는 상세정보
	$(document).ready(
			function() {
				// 모달이 처음 로딩될 때 한 번만 등록
				$("#disablebackdrop, #disablebackdrop2").on("show.bs.modal",
						function(event) {
							let who = event.relatedTarget.dataset['who'];
							let $modalBody = $(this).find(".modal-body");
							let viewURL = this.dataset['url'];
							if (who) {
								let settings = {
									url : viewURL,
									dataType : "html",
									data : {
										who : who
									},
									success : function(resp) {
										$modalBody.html(resp);
									}
								};
								$.ajax(settings);
							}
						}).on("hidden.bs.modal", function(event) {
					let $modalBody = $(this).find(".modal-body");
					$modalBody.empty();
				});
			});

	//반려
	$(document).ready(function() {
		// 모달이 처음 로딩될 때 한 번만 등록
		$("#companion").on("show.bs.modal", function(event) {
			let rrid = event.relatedTarget.dataset['rrid'];
			let $modalBody = $(this).find(".modal-body");
			let viewURL = this.dataset['url'];

			console.log("id값", rrid);
			console.log("주소값", viewURL);

			if (rrid) {
				let settings = {
					url : viewURL,
					dataType : "html",
					data : {
						rrid : rrid
					},
					success : function(resp) {
						$modalBody.html(resp);
					}
				};
				$.ajax(settings);
			}
		}).on("hidden.bs.modal", function(event) {
			let $modalBody = $(this).find(".modal-body");
			$modalBody.empty();
		});
	});

	function fn_paging(page) {
		return false;
	}

	//페이징, 검색
	$(".pagingArea").on("click", "a.page-link", function(event) {
		let page = $(this).data("page");
		let pagingArea = $(this).parents(".pagingArea");
		let serchFormId = $(pagingArea).data("targetForm");
		$(serchFormId).find("[name=page]").val(page);
		$(serchFormId).submit();

	});

	// searchUI에서 입력을 받은 데이터를 searchForm으로 옮겨야함
	$(".searchUI").on("click", ".searchBtn", function(event) {
		let searchUI = $(this).parents(".searchUI");
		let serchFormId = $(searchUI).data("targetForm");

		$(searchUI).find(":input[name]").each(function(idx, input) { //셀렉트/ input
			let name = input.name; //하나의 input태그의 name속성
			let value = $(input).val();
			$(serchFormId).find(`[name=\${name}]`).val(value);
		});
		$(serchFormId).submit();
	});

	$(document).ready(function() {
		if ("${simpleCondition.searchType }" == "stts") {
			$("#dept1").val("${simpleCondition.searchWord }");
		}

		$(".content").each(function() {
			var content = $(this).text();
			if (content.length > 15) {
				var truncatedContent = content.substring(0, 15) + "...";
				$(this).text(truncatedContent);
			}
		});
	});

	function triggerSearch() {
		const type = "stts";
		const word = $("#dept1").val();

		$(searchType).val(type);
		$(searchWord).val(word);
		$(searchForm).submit();
	}

	function redirectToOtherForm() {
		var typeVal = $(".modal-body").find("input[name='rrType']").val();
		// 		var rrTypeValue = $("input[name='rrType']");
		// 		console.log(rrTypeValue);
		if (typeVal === "REF") {
			window.location.href = "rncRegistraction.do"; // REF 경우 처리
		} else if (typeVal === "REC") {
			window.location.href = "recRegistraction.do"; // REC 경우 처리
		}
	}

	$(document).ready(function() {
		// AJAX 요청 생성
		$.ajax({
			url : '${pageContext.request.contextPath }/infra/recReqList.do', // 서버 컨트롤러 URL을 입력해주세요
			type : 'GET',
			success : function(data) {
				// 받아온 JSP 파일 내용을 특정 엘리먼트에 추가
				var dynamicContent = $('#dynamicContent');
				dynamicContent.html(data);
			},
			error : function(error) {
				console.error('Error:', error);
			}
		});
	});

	// 	//청소 tbody찍어주는 함수 
	// 	$(document).ready(function() {
	// 	    // Ajax 요청을 보내고 다른 JSP 파일의 내용을 가져옴
	// 	    $.ajax({
	// 	        url: '${pageContext.request.contextPath }/infra/recReqList.do', // 가져올 JSP 파일의 경로
	// 	        method: 'GET', // 또는 POST, 적절한 HTTP 메서드를 선택
	// 	        success: function(response) {
	// 	            // 가져온 내용을 특정 위치에 삽입
	// 	            $('#table2').html(response);
	// 	        },
	// 	        error: function() {
	// 	            // 에러 처리 로직
	// 	            console.log('Error occurred during Ajax request');
	// 	        }
	// 	    });
	// 	});	
	// 	//청소 tbody찍어주는 함수 
	// 	$(document).ready(function() {
	// 	    // Ajax 요청을 보내고 다른 JSP 파일의 내용을 가져옴
	// 	    $.ajax({
	// 	        url: '${pageContext.request.contextPath }/infra/recReqList.do', // 가져올 JSP 파일의 경로
	// 	        method: 'GET', // 또는 POST, 적절한 HTTP 메서드를 선택
	// 	        success: function(response) {
	// 	            // 가져온 내용을 특정 위치에 삽입
	// 	            $('#table3').html(response);
	// 	        },
	// 	        error: function() {
	// 	            // 에러 처리 로직
	// 	            console.log('Error occurred during Ajax request');
	// 	        }
	// 	    });
	// 	});	
	// 	//청소 tbody찍어주는 함수 
	// 	$(document).ready(function() {
	// 	    // Ajax 요청을 보내고 다른 JSP 파일의 내용을 가져옴
	// 	    $.ajax({
	// 	        url: '${pageContext.request.contextPath }/infra/recReqList.do', // 가져올 JSP 파일의 경로
	// 	        method: 'GET', // 또는 POST, 적절한 HTTP 메서드를 선택
	// 	        success: function(response) {
	// 	            // 가져온 내용을 특정 위치에 삽입
	// 	            console.log(response);
	// 	            $('#table4').html(response);
	// 	        },
	// 	        error: function() {
	// 	            // 에러 처리 로직
	// 	            console.log('Error occurred during Ajax request');
	// 	        }
	// 	    });
	// 	});	

	// 	$("#tab1").on("click",function(){
	// 		let tab = $(this).val();

	// 		$.getJSON("<c:url value='/infra/recReqList.do' />" , {tab:tab}).done(function(resp){
	// 			let tbody = $("#table2");
	// 			tbody.empty();
	// 			  if (resp.length === 0) {
	// 		            tbody.append('<tr><td colspan="7">요청내용 없음.</td></tr>');
	// 		        } else {
	// 		            $.each(resp, function(idx, res) {
	// 		                let tr = $("<tr>").append(
	// 		                    $("<td>").text(res.ccp.rrId),
	// 		                    $("<td>").text(res.ccp.zone.zoneFloor + "층 " + res.ccp.zone.zoneCtgr),
	// 		                    $("<td>").text(res.ccp.rrContent),
	// 		                    $("<td>").text(res.ccp.rrTs.split("T")[0] + " " + res.ccp.rrTs.split("T")[1].split(":")[0] + ":" + res.ccp.rrTs.split("T")[1].split(":")[1]),
	// 		                    $("<td>").text(res.ccp.employee.empNm),
	// 		                    $("<td>").text(res.ccp.common.codeNm),
	// 		                    $("<td>").append(
	// 		                        '<button onclick="javascript:;" data-who="' + res.ccp.rrId + '" data-where="' + res.ccp.zone.zoneCd + '" data-ca="' + res.ccp.common.codeNm + '" data-bs-toggle="modal" data-bs-target="#disablebackdrop2" class="rncReqid">상세보기</button>'
	// 		                    )
	// 		                );
	// 		                tbody.append(tr);
	// 		            });
	// 		        }
	// 		    }).fail(function() {
	// 		        console.log('Error occurred during Ajax request');
	// 		    });
	// 		});	

	// 	$(document).ready(function() {
	// 	    // 페이지 로드 시 '미등록' 탭의 내용을 가져와서 추가
	// 	    loadTabContent('pills-chome', 'table2');

	// 	    // 탭 버튼 클릭 이벤트
	// 	    $('button[role="ctab"]').click(function() {
	// 	        var tabId = $(this).attr('data-bs-target');
	// 	        var tableId = $(tabId).find('tbody').attr('id');

	// 	        // 이미 내용이 있는 경우에는 가져오지 않고, 없는 경우에만 가져와서 추가
	// 	        if ($('#' + tableId).is(':empty')) {
	// 	            loadTabContent(tabId, tableId);
	// 	        }
	// 	    });

	// 	    // Ajax를 통해 탭 내용 가져오는 함수
	// 	    function loadTabContent(tabId, tableId) {
	// 	        $.ajax({
	// 	            url: $(tabId).attr('data-bs-target'), // 탭 버튼의 data-bs-target 속성에 해당 JSP의 경로가 들어있어야 합니다.
	// 	            method: 'GET',
	// 	            success: function(response) {
	// 	                $('#' + tableId).html(response);
	// 	            },
	// 	            error: function() {
	// 	                console.log('Error occurred during Ajax request');
	// 	            }
	// 	        });
	// 	    }
	// 	});
	// 	function redirectToUpdateForm() {
	// 	   // var redirectToUrl = "rncReqCompanion.do"; 
	// 	   var formData = new FormData();

	// 	// 모달 내의 form 요소들에 접근하기 위해 모달 선택자 사용
	// 	    var $modal = $('#companion');  // 모달 선택자

	// 	    // rrId 값 추가
	// 	    var rrId = $modal.find('[name="rncReq.rrId"]').val();
	// 	    formData.append('rncReq.rrId', rrId);
	// 	    // rrStts 값 추가
	// 	    var rrStts = $modal.find('[name="rncReq.rrStts"]').val();
	// 	    formData.append('rncReq.rrStts', rrStts);

	// 	    // rrContent 값 추가
	// 	    var rrContent = $modal.find('[name="rncReq.rrContent"]').val();
	// 	    formData.append('rncReq.rrContent', rrContent);

	// 	    console.log(formData);

	// 	 // AJAX 요청을 보냄
	// 	    $.ajax({
	// 	        type: "POST",
	// 	        url: "/infra/rncReqUpdate.do",
	// 	        data: formData,
	// 	        success: function(resp) {
	// 	        	  $modalBody.html(resp);
	// 	        }
	// 	    });
	// 	}

	// //반려버튼 클릭시 나타나는 상세정보
	// $(document).ready(function() {
	//	     // 모달이 처음 로딩될 때 한 번만 등록
	//	     $("#companion").on("show.bs.modal", function(event){
	//	         let rrId = event.relatedTarget.dataset['rrId']; 
	//	         let rrContent = event.relatedTarget.dataset['rrContent']; 
	//	         let rrStts = event.relatedTarget.dataset['rrStts']; 

	//	         console.log("rrId", rrId);
	//	         console.log("rrContent", rrContent);
	//	         console.log("rrStts", rrStts);

	//	         let obj = {};
	//	         obj.rrId = rrId;
	//	         obj.rrContent = rrContent;
	//	         obj.rrStts = rrStts;

	//	         console.log("obj:", obj);
	//	         let $modalBody = $(this).find(".modal-body");
	//	         let viewURL = this.dataset['url'];

	//	         if(rrId){
	//	             let settings = {
	//	                 url : viewURL,
	//	                 method : 'POST',
	//	                 dataType : "json",
	//	                 data : JSON.stringify(obj),
	//	                 contentType: "application/json",
	//	                 success : function(resp){
	//	                     $modalBody.html(resp);
	//	                 }
	//	             };
	//	             $.ajax(settings);
	//	         }
	//	     }).on("hidden.bs.modal", function(event){
	//	         let $modalBody = $(this).find(".modal-body");
	//	         $modalBody.empty();
	//	     });
	// });
</script>