<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.table {
    width: 800px;
    margin: 0 auto; /* 가로 중앙 정렬을 위한 margin 속성 추가 */
    
}
</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header"
						style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">사내 게시판</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i
										class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">게시판</a></li>
								<li class="breadcrumb-item"><a href="#">사내 게시판</a></li>
								<li class="breadcrumb-item active">No.${empbrd.ebNo }</li>
							</ol>
						</nav>
					</div>
					<!-- 게시판 헤더 영역 끝 -->

					<div class="table">
						<br>
						<table class="table table-bordered">
							<tr>
								<th width=20% class="table-light text-center warning">사번</th>
								<td width=30% class="text-center">${empbrd.empNo }</td>
								<th width=20% class="table-light text-center warning">작성일</th>
								<td width=30% class="text-center">${empbrd.ebCrtDt }</td>
							</tr>
							<tr>
								<th width=20% class="table-light text-center warning">이름</th>
								<td width=30% class="text-center">${empbrd.empNm }</td>
								<th width=20% class="table-light text-center warning">조회수</th>
								<td width=30% class="text-center">${empbrd.ebVws }</td>
							</tr>
							<tr>
							<tr>
								<th width=20% class="table-light text-center warning">제목</th>
								<td colspan="3">${empbrd.ebTitle }</td>
							</tr>
							<tr>
								<td colspan="4" class="text-left" valign="top" height="200">
									<%-- 								<pre style="white-space: pre-wrap; border: none; background-color: white;">${empbrd.ebContent }</pre> --%>
									<p
										style="white-space: pre-wrap; border: none; background-color: white;">${empbrd.ebContent }</p>
								</td>
							</tr>
							<c:if test="${not empty empbrd.fileGroup and not empty empbrd.fileGroup.detailList}">
								<tr>
									<th class="table-light text-center warning" colspan="1">첨부파일</th>
									<td colspan="3"><c:if
											test="${not empty empbrd.fileGroup and not empty empbrd.fileGroup.detailList }">
											<c:forEach items="${empbrd.fileGroup.detailList }"
												var="fileDetail">
												<c:url value="/download.do" var="downloadURL">
													<c:param name="atchFileId"
														value="${fileDetail.atchFileId }" />
													<c:param name="fiSn" value="${fileDetail.fiSn }" />
												</c:url>
												<i class="bi bi-paperclip"> <a href="${downloadURL }">${fileDetail.fiOriginNm }</a>
												</i>
											</c:forEach>
										</c:if></td>
								</tr>
							</c:if>
						</table>
						<div
							style="text-align: right; height: 100px; padding: 20px 0px 20px 20px; width: 800px;">
							<a class="btn btn-dark" data-bs-toggle="modal" 
								data-bs-target="#exampleModal" id="deleteBtn">삭제</a>
<%-- 							<input type="button" value="삭제" class="btn btn-dark" id="deleteBtn" data-source="${empbrd.ebNo }"> --%>
<%-- 							<a href="<c:url value='/hr/empbrd/empbrdDelete.do'/>" class="btn btn-dark" style="height: 39px;">삭제</a> --%>
							
							<c:url value='/hr/empbrd/empbrdUpdate.do' var="updateURL">
								<c:param name="what" value="${empbrd.ebNo }" />
							</c:url>
							<a href="${updateURL }" class="btn btn-primary">수정</a> <a
								class="btn gray_btn"
								href="<c:url value='/hr/empbrd/empbrdList.do'/>">목록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<!-- 삭제 Modal -->
<div class="modal fade" data-url="${viewURL }" id="exampleModal"
	tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">warning!</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form method="post" action="<c:url value='/hr/empbrd/empbrdDelete.do'/>">
				<div class="modal-body">
					<input type="hidden" name="ebNo" value="${empbrd.ebNo }" />
					<h6>한 번 삭제된 게시물은 복구되지 않습니다. 정말 삭제하시겠습니까?</h6>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-danger">삭제</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
// $("#deleteBtn").on("click", function(){
//     let ebNo = $(this).data("source");
//     console.log("삭제할 글 번호", ebNo);

//     Swal.fire({
//         icon: 'question',
//         title: '알림',
//         confirmButtonColor: '#3085d6',
//         cancelButtonColor: '#d33',
//         confirmButtonText: '삭제',
//         cancelButtonText: '취소',
//         text: '한 번 삭제된 내용은 복구되지 않습니다. 정말 삭제하시겠습니까?',
//     })
//     .then((result) => {
//         if (result.isConfirmed) {
//             let settings = {
//                 url: "<c:url value='/hr/empbrd/empbrdDelete.do' />", // 쉼표 추가
//                 data: { // 쉼표 추가
//                     ebNo: ebNo
//                 },
//                 dataType: "json" // 쉼표 추가
//             };

//             $.ajax(settings).done(resp => {
//                 console.log("삭제응답:", resp);
//                 ebNoValue = resp.ebNo;

//                 if (resp.resp == "OK") // 괄호 수정
//                     $(ebNoValue).remove();
//             });

//             Swal.fire(
//                 '삭제',
//                 '삭제가 완료되었습니다.',
//                 'success'
//             )
//         }
//     })
// });

</script>