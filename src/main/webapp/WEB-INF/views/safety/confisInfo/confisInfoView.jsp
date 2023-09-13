<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">반입불가 물품관리</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item">보안검색</li>
					        <li class="breadcrumb-item">반입불가 물품관리</li>
					        <li class="breadcrumb-item active">반입불가 물품 상세보기</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->
					

<table class="table table-bordered">
	<tr>
		<th>ID</th>
		<td>${confisInfo.ciNo }</td>
	</tr>
	<tr>
		<th>구분</th>
		<td>${confisInfo.ciGubun }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${confisInfo.ciCarryBan }</td>
	</tr>
	<tr>
		<th>기내반입</th>
		<td>${confisInfo.ciCabin }</td>
	</tr>
	<tr>
		<th>수화물반입</th>
		<td>${confisInfo.ciTrust }</td>
	</tr>

</table>

	<div class="d-flex justify-content-end">
	<c:url value="/safety/confisInfoUpdate.do" var="updateURL">
		<c:param name="what" value="${confisInfo.ciNo}"/>
	</c:url>
		<a class="btn btn-primary" href="${updateURL}" style="margin-right:3px">수정</a>
		<a class="btn btn-dark" data-bs-toggle="modal"
			data-bs-target="#exampleModal" style="margin-right:3px">삭제</a>
		<a class="btn btn-secondary gray_btn" href="<c:url value='/safety/ConfisInfo.do' />">목록으로</a>
	</div>

<!-- Modal -->
<div class="modal fade" data-url="${viewURL }" id="exampleModal"
	tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">반입불가물품 삭제</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form method="post"
				action="<c:url value='/safety/confisInfoDelete.do'/>">
				<div class="modal-body">
					삭제하시겠습니까? <input type="hidden" name="ciNo"
						value="${confisInfo.ciNo}" /> 
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger">삭제</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>

				</div>
			</div>
		</div>
	</div>
</section>