<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body" style="padding-top: 40px;">


					<table class="table Default Table">
						<tr>
							<th>여권번호</th>
							<td>${pperson.ppPno }</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${pperson.ppNm }</td>
						</tr>
						<tr>
							<th>금지사유</th>
							<td>${pperson.ppRes }</td>
						</tr>
						<tr>
							<th>금지기간</th>
							<td>${pperson.ppPer }</td>
						</tr>
					</table>

					<div class="d-flex justify-content-end">
						<c:url value="/safety/enterUpdate.do" var="updateURL">
							<c:param name="what" value="${pperson.ppPno}" />
							<c:param name="ppWw" value="${pperson.ppWw}" />
						</c:url>
						<a class="btn btn-primary" href="${updateURL}" style="margin-right:4px;">수정</a> 
						<a class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal" style="margin-right:4px;">삭제</a>
						<a class="btn btn-secondary gray_btn" href="<c:url value='/safety/exitPerson.do'/>">목록으로</a>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>




<!-- Modal -->
<div class="modal fade" data-url="${viewURL }" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form method="post" action="<c:url value='/safety/PPersonDelete.do'/>">
				<div class="modal-body">
					삭제하시겠습니까? <input type="hidden" name="ppPno" value="${pperson.ppPno}" /> <input type="hidden" name="ppWw" value="${pperson.ppWw}" />
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger">삭제</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>