<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<div class="card">
	<div class="card-body">
		<h5 class="card-title">청소 요청</h5>

		<!-- Pills Tabs -->
		<ul class="nav nav-pills mb-3" id="sttsNav" role="tablist">

			<li class="nav-item" role="presentation">
				<button
					class="nav-link  ${paging.simpleCondition.ctab == 0 ? 'active show' : ''}"
					id="cUnStts" data-bs-toggle="pill" data-bs-target="#pills-chome"
					type="button" role="ctab" aria-controls="pills-chome"
					aria-selected="true">미등록</button>
			</li>

			<li class="nav-item" role="presentation">
				<button
					class="nav-link ${paging.simpleCondition.ctab == 1 ? 'active show' : ''}"
					id="cCpStts" data-bs-toggle="pill" data-bs-target="#pills-cx"
					type="button" role="ctab" aria-controls="pills-cx"
					aria-selected="false">반려</button>
			</li>

			<li class="nav-item" role="presentation">
				<button
					class="nav-link${paging.simpleCondition.ctab == 2 ? 'active show' : ''}"
					id="cAllStts" data-bs-toggle="pill"
					data-bs-target="#pills-cprofile" type="button" role="ctab"
					aria-controls="pills-cprofile" aria-selected="false">전체조회</button>
			</li>
		</ul>

		<!-- 검색하는 부분 -->
		<div class="searchUI2 row justify-content-end"
			data-target-form="#tab2Form" data-target-tbody="#ctable1">
			<div class="col-auto">
				<form:select path="simpleCondition.searchType" class="form-select">
					<form:option value="" label="전체" />
					<form:option value="id" label="요청ID" />
					<form:option value="loc" label="위치" />
					<form:option value="stts" label="상태" />
					<form:option value="content" label="내용" />
				</form:select>
			</div>
			<div class="col-auto">
				<form:input path="simpleCondition.searchWord" class="form-control" />
			</div>
			<div class="col-auto">
				<input type="button" value="검색" class="searchBtn2 btn btn-outline-dark gray_btn" />
			</div>
		</div>

		<!-- 미등록 탭 -->
		<div class="tab-content pt-2" id="pills-ctab-content">
			<div
				class="tab-pane fade ${paging.simpleCondition.ctab == 0 ? 'active show' : ''}"
				id="pills-chome" role="tabpanel" aria-labelledby="home-tab">
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

					<tbody id="ctable1">
						<c:set var="cUnList" value="${paging.dataList }" />
						<c:if test="${empty cUnList }">
							<tr>
								<td colspan="10">요청내용 없음.</td>
							</tr>
						</c:if>
						<c:if test="${not empty cUnList}">
							<c:forEach items="${cUnList }" var="cun">
								<input type="hidden" name="rrType" value="${cun.rrType}" />
								<tr>
									<td>${cun.rrId }</td>
									<td>${cun.zone.zoneFloor }층${cun.zone.zoneCtgr }</td>
									<td class="content"
										style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										${cun.rrContent}</td>

									<td>${cun.rrTs.toString().split(':')[0].replace('T', ' ')}:${cun.rrTs.toString().split(':')[1]}</td>
									<td>${cun.employee.empNm }</td>
									<td>${cun.common.codeNm }</td>
									<td><c:choose>
											<c:when test="${cun.rrStts eq 'UN'}">
												<button onclick="javascript:;" data-who="${cun.rrId}"
													data-where="${cun.zone.zoneCd}"
													data-ca="${cun.common.codeNm}" data-bs-toggle="modal"
													data-bs-target="#Cdisablebackdrop" class="recReqid  btn btn-outline-dark gray_btn">상세</button>
												<button onclick="javascript:;" data-what="${cwt}"
													data-rrid="${cun.rrId }"
													data-rr-content="${cun.rrContent }"
													data-rr-stts="${cun.rrStts }" data-bs-toggle="modal"
													data-bs-target="#Ccompanion" class="recReqid btn btn-dark">반려</button>
											</c:when>
											<c:when test="${cun.rrStts eq 'CP' }">
												<button onclick="javascript:;" data-who="${cun.rrId}"
													data-where="${cun.zone.zoneCd}"
													data-ca="${cun.common.codeNm}" data-bs-toggle="modal"
													data-bs-target="#Cdisablebackdrop" class="recReqid btn btn-outline-dark deletebtn">상세</button>
											</c:when>
										</c:choose></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>

				<div class="d-flex justify-content-center mb-5 pagingArea"
					data-target-form="#tab2Form">
					${paging.pagingHTML }
					<!-- a태그 동작 -->
				</div>
			</div>
			<!-- 미등록 탭 끝 -->

			<!-- 반려 탭 -->
			<div
				class="tab-pane fade ${paging.simpleCondition.ctab == 1 ? 'active show' : ''}"
				id="pills-cx" role="tabpanel" aria-labelledby="pills-x">
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
					<tbody id="ctable2">
						<c:set var="recList" value="${paging.dataList }" />
						<c:if test="${empty recList }">
							<tr>
								<td colspan="10">요청내용 없음.</td>
							</tr>
						</c:if>
						<c:if test="${not empty recList}">
							<c:forEach items="${recList }" var="ccp">
								<input type="hidden" value="${ccp.rrType}" />
								<tr>
									<td>${ccp.rrId }</td>
									<td>${ccp.zone.zoneFloor }층${ccp.zone.zoneCtgr }</td>
									<td class="content">${ccp.rrContent }</td>
									<td>${ccp.rrTs.toString().split(':')[0].replace('T', ' ')}:${ccp.rrTs.toString().split(':')[1]}</td>
									<td>${ccp.employee.empNm }</td>
									<td>${ccp.common.codeNm }</td>
									<td><c:choose>
											<c:when test="${ccp.rrStts eq 'UN'}">
												<button onclick="javascript:;" data-who="${ccp.rrId}"
													data-where="${ccp.zone.zoneCd}"
													data-ca="${ccp.common.codeNm}" data-bs-toggle="modal"
													data-bs-target="#Cdisablebackdrop" class="recReqid btn btn-outline-dark gray_btn">상세</button>
												<button onclick="javascript:;" data-what="${ccp}"
													data-rrid="${ccp.rrId }"
													data-rr-content="${ccp.rrContent }"
													data-rr-stts="${ccp.rrStts }" data-bs-toggle="modal"
													data-bs-target="#Ccompanion" class="recReqid btn btn-dark">반려</button>
											</c:when>
											<c:when test="${ccp.rrStts eq 'CP' }">
												<button onclick="javascript:;" data-who="${ccp.rrId}"
													data-where="${ccp.zone.zoneCd}"
													data-ca="${ccp.common.codeNm}" data-bs-toggle="modal"
													data-bs-target="#Cdisablebackdrop2" class="recReqid btn btn-outline-dark deletebtn">상세</button>
											</c:when>
										</c:choose></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5">
								<div class="d-flex justify-content-center mb-5 pagingArea"
									data-target-form="#tab2Form">
									${paging.pagingHTML }
									<!-- a태그 동작 -->
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<!-- 반려 탭 끝 -->

			<!-- 전체조회 탭 -->
			<div
				class="tab-pane fade ${paging.simpleCondition.ctab == 2 ? 'active show' : ''}"
				id="cpills-profile" role="tabpanel" aria-labelledby="profile-tab">
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
					<tbody id="ctable3">
						<c:set var="recList" value="${paging.dataList }" />
						<c:if test="${empty recList }">
							<tr>
								<td colspan="10">요청내용 없음.</td>
							</tr>
						</c:if>
						<c:if test="${not empty recList}">
							<c:forEach items="${recList }" var="rec">
								<input type="hidden" value="${rec.rrType}" />
								<tr>
									<td>${rec.rrId }</td>
									<td>${rec.zone.zoneFloor }층${rec.zone.zoneCtgr }</td>
									<td class="content">${rec.rrContent }</td>
									<td>${rec.rrTs.toString().split(':')[0].replace('T', ' ')}:${rec.rrTs.toString().split(':')[1]}</td>
									<td>${rec.employee.empNm }</td>
									<td>${rec.common.codeNm }</td>
									<td><c:choose>
    <c:when test="${rec.rrStts eq 'UN' and rec.rrType eq 'REF'}">
        <button onclick="javascript:;" data-who="${rec.rrId}"
            data-where="${rec.zone.zoneCd}"
            data-ca="${rec.common.codeNm}" data-bs-toggle="modal"
            data-bs-target="#Cdisablebackdrop" class="recReqid btn btn-outline-dark gray_btn">상세</button>
    </c:when>
    <c:when test="${rec.rrStts eq 'UN'}">
        <button onclick="javascript:;" data-what="${rec}"
            data-rrid="${rec.rrId }"
            data-rr-content="${rec.rrContent }"
            data-rr-stts="${rec.rrStts }" data-bs-toggle="modal"
            data-bs-target="#Ccompanion" class="recReqid btn btn-dark">반려</button>
    </c:when>
    <c:when test="${rec.rrStts eq 'CP' }">
        <button onclick="javascript:;" data-who="${rec.rrId}"
            data-where="${rec.zone.zoneCd}"
            data-ca="${rec.common.codeNm}" data-bs-toggle="modal"
            data-bs-target="#Cdisablebackdrop2" class="recReqid btn btn-outline-dark deletebtn">상세</button>
    </c:when>
</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5">
								<div class="d-flex justify-content-center mb-5 pagingArea "
									data-target-form="#tab2Form">
									${paging.pagingHTML }
									<!-- a태그 동작 -->
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<!-- 전체조회 탭 끝 -->
		<!-- End Pills Tabs -->
		<form:form class="searchForm2" modelAttribute="simpleCondition"
			id="tab2Form" method="get">
			<!--  데이터 전송 용도  -->
			<form:hidden path="searchType" />
			<form:hidden path="searchWord" />
			<form:hidden path="ctab" />
			<input type="hidden" name="page" />
		</form:form>
	</div>
</div>

<c:url value="/infra/rncReqView.do" var="viewURL" />
<c:url value="/infra/rncReqCompanion.do" var="viewURL2" />


<!--유지보수 모달창 -->
<div class="modal fade" data-url="${viewURL}" id="Cdisablebackdrop"
	tabindex="-1" data-bs-backdrop="false">
	<div class="modal-dialog"
		style="margin-top: 200px; margin-right: 350px;">
		<div class="modal-content"
			style="box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);">
			<div class="modal-header">
				<h5 class="modal-title">유지보수 접수</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					onclick="redirectToOtherForm()" data-bs-dismiss="modal">등록</button>
				<button type="button" class="btn btn-secondary" id="closemodal"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- End Disabled Backdrop Modal-->

<!--청소 등록 모달창 -->
<div class="modal fade" data-url="${viewURL}" id="Cdisablebackdrop2"
	tabindex="-1" data-bs-backdrop="false">
	<div class="modal-dialog"
		style="margin-top: 200px; margin-right: 350px;">
		<div class="modal-content"
			style="box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);">
			<div class="modal-header">
				<h5 class="modal-title">청소 접수</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					onclick="redirectToOtherForm()" data-bs-dismiss="modal">등록</button>
				<button type="button" class="btn btn-secondary" id="closemodal"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- End Disabled Backdrop Modal-->

<!--반려시 상세보기모달창 -->
<div class="modal fade" data-url="${viewURL}" id="Cdisablebackdrop2"
	tabindex="-1" data-bs-backdrop="false">
	<div class="modal-dialog"
		style="margin-top: 200px; margin-right: 120px;">
		<div class="modal-content"
			style="box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);">
			<div class="modal-header">
				<h5 class="modal-title">청소 접수</h5>
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
<!-- End Disabled Backdrop Modal -->

<!-- 반려사유모달창 -->
<div class="modal fade" data-url="${viewURL2}" id="Ccompanion"
	tabindex="-1" data-bs-backdrop="false">
	<div class="modal-dialog"
		style="margin-top: 200px; margin-right: 200px;">
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


<script>
	//등록버튼 클릭시 나타나는 상세정보
	$(document).ready(
			function() {
				// 모달이 처음 로딩될 때 한 번만 등록
				$("#Cdisablebackdrop, #Cdisablebackdrop2").on("show.bs.modal",
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

				console.log('clicked')
				$("#pills-x-ctab").trigger('click');
				$("#pills-chome-tab").trigger('click');
			});

	//반려
	$(document).ready(function() {
		// 모달이 처음 로딩될 때 한 번만 등록
		$("#Ccompanion").on("show.bs.modal", function(event) {
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
		searchForm2.page.value = page;
		$(searchForm2).submit();
		//     searsearchForm22uestSubmit();
	}

	// searchUI2에서 입력을 받은 데이터를 searchForm2으로 옮겨야함
	$(searchBtn2).on("click", function(event) {
		//     $ find : children을 찾겠다. name속성을 가지고 있는 input태그 중에서 모든 input태그
		$(searchUI2).find(":input[name]").each(function(idx, input) { //셀렉트/ input
			let name = input.name; //하나의 input태그의 name속성
			let value = $(input).val();
			$(searchForm2).find(`[name=\${name}]`).val(value);
		});
		$(searchForm2).submit();
	});

	$(document).ready(function() {
		if ("${simpleCondition.searchType }" == "stts") {
			$("#dept1").val("${simpleCondition.searchWord }");
		}

		$(".content").each(function() {
			var content = $(this).text();
			if (content.length > 15) {
				var truncatedContent = content.substring(0, 10) + "...";
				$(this).text(truncatedContent);
			}
		});
	});

	function triggerSearch() {
		const type = "stts";
		const word = $("#dept1").val();

		$(searchType).val(type);
		$(searchWord).val(word);
		$(searchForm2).submit();
	}

	// 	function redirectToOtherForm() {
	// 		var rrTypeValue = $("input[name='rrType']").val();
	// 		console.log(rrTypeValue);
	// 		if (rrTypeValue === "REF") {
	// 	        window.location.href = "rncRegistraction.do"; // REF 경우 처리
	// 	    } else if (rrTypeValue === "REC") {
	// 	        window.location.href = "recRegistraction.do"; // REC 경우 처리
	// 	    } 
	// 	}
</script>