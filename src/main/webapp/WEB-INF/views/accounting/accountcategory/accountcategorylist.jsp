<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<section class="section">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <!-- 게시판 헤더 영역 시작 -->
                    <div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;">
                       <h5 class="card-tit">계정 과목 관리</h5>

                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/in"><i class="bi bi-house-door"></i></a></li>
                                <li class="breadcrumb-item"><a href="#">예산</a></li>
                                <li class="breadcrumb-item active">계정 과목 관리</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="info" style="width: 100%; padding-bottom: 1px;">
					    <p class="cofistooltip">
					        <i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
					        <span data-bs-toggle="tooltip" data-bs-placement="top">
					            목록을 클릭하면 상세정보가 표시됩니다.<br>
					            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;하단 버튼으로 추가 및 삭제를 할 수 있습니다.<br>
					            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이미 책정된 계정과목은 삭제할 수 없습니다.
					        </span>
					    </p>
					</div>
					<p><p>
                    <!-- 게시판 헤더 영역 끝 -->

                    <table class="table table-hover">
                        <thead class="table-light">
                            <tr>
                                <th><input type="checkbox" id="selectAll" /></th>
                                <th>계정과목 아이디</th>
                                <th>계정과목 이름</th>
                                <th>계정과목 생성일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="accountCategories" value="${paging.dataList }" />
                            <c:choose>
                                <c:when test="${empty accountCategories }">
                                    <tr>
                                        <td colspan="5">조건에 맞는 게시글 없음.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${accountCategories }" var="account">
                                        <tr>
                                            <c:url value="/accounting/accountcategory/AcccView.do" var="viewURL">
                                                <c:param name="what" value="${account.acaId }" />
                                            </c:url>
                                            <td><input type="checkbox" name="accountId" value="${account.acaId }" /></td>
                                            <td><a class="d-block bk" href="${viewURL }">${account.acaId }</a></td>
                                            <td><a class="d-block bk" href="${viewURL }">${account.acaNm }</a></td>
                                            <td><a class="d-block bk" href="${viewURL }">${account.acaCrtDt }</a></td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="5">
                                    <div class="d-flex justify-content-center mb-3">
                                        ${paging.pagingHTML }</div>
                                    <div id="searchUI" class="row justify-content-center">
                                        <div class="col-auto">
                                            <form:select path="simpleCondition.searchType"
                                                class="form-select">
                                                <form:option value="" label="전체" />
                                                <form:option value="id" label="계정과목 아이디" />
                                                <form:option value="name" label="계정과목 이름" />
                                            </form:select>
                                        </div>
                                        <div class="col-auto">
                                            <form:input path="simpleCondition.searchWord"
                                                class="form-control" />
                                        </div>
                                        <div class="col-auto">
                                            <input type="button" value="검색" id="searchBtn" class="btn btn-secondary" />
                                        </div>
                                        <div class="d-flex justify-content-end ">
                                           <a href="<c:url value='/accounting/accountcategory/AcccInsertForm.do'/>" class="btn btn-primary">새항목 추가</a>
                                           <button type="button" id="deleteSelected" class="btn btn-dark" style="margin-left: 10px;">선택 항목 삭제</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
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

<script>
    function fn_paging(page) {
        searchForm.page.value = page;
        searchForm.requestSubmit();
    }

    $(searchBtn).on("click", function(event) {
        $(searchUI).find(":input[name]").each(function(idx, input) {
            let name = input.name;
            let value = $(input).val();
            $(searchForm).find(`[name=\${name}]`).val(value);
        });
        $(searchForm).submit();
    });

    $("#selectAll").on("change", function() {
        const isChecked = $(this).prop("checked");
        $("input[name='accountId']").prop("checked", isChecked);
    });

    $("#deleteSelected").on("click", function(event) {
        const selectedAccountIds = $("input[name='accountId']:checked")
            .map(function() {
                return $(this).val();
            })
            .get();
        if (selectedAccountIds.length === 0) {
            Swal.fire({
                icon: 'info',
                title: '알림',
                text: '삭제할 항목을 선택하세요.',
            });
            return;
        }

        Swal.fire({
            icon: 'question',
            title: '확인',
            text: '선택한 항목을 삭제하시겠습니까?',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
        }).then((result) => {
            if (result.isConfirmed) {
                var deleteURL = "${pageContext.request.contextPath}/accounting/accountcategory/AcccDeleteMultiple.do";

                $.ajax({
                    url: deleteURL,
                    type: "POST",
                    data: JSON.stringify(selectedAccountIds), // 선택한 계정 ID 목록을 JSON 형식으로 전달
                    contentType: "application/json", // Content-Type 설정
                    success: function(data) {
                        if (data === "Success") {
                            Swal.fire({
                                icon: 'success',
                                title: '성공',
                                text: '선택한 항목이 삭제되었습니다.',
                            }).then(() => {
                                location.reload();
                            });
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: '오류',
                                text: '삭제 중 오류가 발생했습니다.',
                            });
                        }
                    },
                    error: function(xhr, status, error) {
                        Swal.fire({
                            icon: 'error',
                            title: '오류',
                            text: '오류 발생: 이미 책정되어 있는 과목은 삭제불가합니다. ' + error,
                        });
                    },
                });
            }
        });
    });

    //preScript에서 할 예정
//     window.onload = function() {
//         var urlParams = new URLSearchParams(window.location.search);
//         var message = urlParams.get("message");

//         if (message !== null && message !== "") {
//             // 메시지를 표시
//             Swal.fire({
//                 icon: 'info',
//                 title: '알림',
//                 text: message,
//             });

//             // 메시지를 표시한 후, 쿼리 파라미터 'message'를 삭제
//             var newUrl = window.location.href.replace(/[?&]message=([^&#]*)/, '');
//             window.history.replaceState({}, document.title, newUrl);
//         }
//     };

</script>
