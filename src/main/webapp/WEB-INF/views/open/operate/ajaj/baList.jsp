<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div class="card" style="margin-left:200px; margin-right:200px;">
	<div class="card-header" style="padding: 9px 15px 9px; color: #787878; background: #c5d0e3; color: white; font-size: 19px;">입찰 현황</div>
<div>
<table class="table Default Table" style="margin-top:20px;">
	<tr>
		<th class="table-light" ></th>
		<th class="table-light" style="text-align: center">신청아이디</th>
		<th class="table-light" style="text-align: center">공고번호</th>
		<th class="table-light" style="text-align: center">위치</th>
		<th class="table-light" style="text-align: center">신청일시</th>
		<th class="table-light" style="text-align: center">상태</th>
 	</tr>

<tbody>
	<c:set value="${paging.dataList }" var="baList" />
	<c:if test="${empty baList }">
		<tr>
			<td colspan="5"/>
		</tr>
	</c:if>
	<c:if test="${not empty baList }">
		<c:forEach items="${baList }" var="ba">
			<c:url value="/open/operate/baView.do" var="viewURL">
				<c:param name="what" value="${ba.baId }" />
			</c:url>

			<tr>
				<td class="text-center"><i class="bx bx-lock" style="color:black;"></i></td>
				<td class="text-center"><a href="javascript:void(0);" onclick="promptForPassword('${ba.baPassword}', '${viewURL}', '${ba.baId}')">&nbsp;${ba.baId}</a></td>
				<td class="text-center">${ba.baBnNo }</td>
				<td class="text-center">${ba.baReqSpace }</td>
				<td class="text-center">${ba.baCrtTs }</td>                                                                                                                                                                                                                                        
				
				
				<td class="text-center">
				
				    <c:choose>
				        <c:when test="${ba.baStatus == '신청접수'}" >
				            <span style="color: orange;">${ba.baStatus}</span>
				        </c:when>
				        <c:when test="${ba.baStatus == '계약진행'}">
				            <span style="color: limegreen;">${ba.baStatus }</span>
				        </c:when>
				        <c:when test="${ba.baStatus == '계약완료'}">
				            <span style="color: limegreen;">${ba.baStatus}</span>
				        </c:when>
				        <c:otherwise>${ba.baStatus}</c:otherwise>
				    </c:choose>
				   
				</td>
			</tr>
		</c:forEach>
	</c:if>
</tbody>
</table>
<tfoot>
		<tr>
			<td colspan="5">
				<div class="d-flex justify-content-center mb-3">
				${paging.pagingHTML }
				</div>
				<div id="searchUI" class="row justify-content-center">
					<div  class="col-auto">
						<form:select path="simpleCondition.searchType" class="form-select">
							<form:option value="" label="전체" />
							<form:option value="baBnNo" label="공고번호" />
							<form:option value="baStatus" label="상태" />
						</form:select>
					</div>
					<div  class="col-auto">
						<form:input path="simpleCondition.searchWord" class="form-control"/>
					</div>
					<div  class="col-auto" style="margin-bottom:10px;">
						<input type="button" value="검색" id="searchBtn" class="btn btn-outline-dark"/>

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




<script>
// 	function fn_paging(page){
// 		searchForm.page.value = page;
// 		searchForm.requestSubmit();
// 	}
// 	$(searchBtn).on("click", function(event){
// 		$(searchUI).find(":input[name]").each(function(idx, input){
// 			let name = input.name;
// 			let value = $(input).val();
// 			$(searchForm).find(`[name=\${name}]`).val(value);
// 		});
// 		$(searchForm).submit();
// 	});






function promptForPassword(expectedPassword, url, baId) {
    function getPasswordInput() {
        return Swal.fire({
            title: '비밀번호를 입력하세요',
            input: 'password', // 입력 필드의 유형을 password로 설정
            inputAttributes: {
                autocapitalize: 'off'
            },
            showCancelButton: true, // 취소 버튼 표시
            confirmButtonText: '확인', // 확인 버튼 텍스트
            cancelButtonText: '취소', // 취소 버튼 텍스트
            allowOutsideClick: () => !Swal.isLoading(),
            customClass: {
                popup: 'custom-prompt-modal', // 사용자 정의 CSS 클래스
                input: 'custom-input', // 입력 필드에 대한 사용자 정의 CSS 클래스
            },
        });
    }

    getPasswordInput().then((result) => {
        if (result.isConfirmed) {
            const enteredPassword = result.value;
            if (enteredPassword.trim() === expectedPassword) {
                window.location.href = url; // 비밀번호가 일치하면 URL로 이동
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: '잘못된 비밀번호입니다.',
                    showCancelButton: false, // 취소 버튼 표시 안 함
                    confirmButtonText: '다시 시도', // 확인 버튼 텍스트 변경
                }).then(() => {
                    // 비밀번호가 틀렸을 경우, 다시 getPasswordInput 함수를 호출하여 재입력 요청
                    getPasswordInput().then((retryResult) => {
                        if (retryResult.isConfirmed) {
                            const retryPassword = retryResult.value;
                            if (retryPassword.trim() === expectedPassword) {
                                window.location.href = url;
                            } else {
                                // 재시도 후에도 틀린 경우 오류 메시지 창을 띄움
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Oops...',
                                    text: '잘못된 비밀번호입니다.',
                                    showCancelButton: false,
                                    confirmButtonText: '확인',
                                });
                            }
                        }
                    });
                });
            }
        }
    });
}


	$(document).on("keydown", function(event) {
	    if (event.key === "Enter") {
	        event.preventDefault(); // 기본 동작(페이지 새로고침) 방지
	        $('#searchBtn').click(); // 검색 버튼 클릭
	    }
	});
</script>



