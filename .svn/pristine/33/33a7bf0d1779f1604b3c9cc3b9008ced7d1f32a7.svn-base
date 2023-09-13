<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<section class="section">
	<div class="row">
		<div class="col-lg-12">

			<div class="card">
				<div class="card-body">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">입출국금지자 관리</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">보안검색</a></li>
								<li class="breadcrumb-item"><a href="#">입출국금지자 관리</a></li>
								<li class="breadcrumb-item active">출국금지자 수정</li>
							</ol>
						</nav>
					</div>
					<!-- 게시판 헤더 영역 끝 -->

					<!-- General Form Elements -->
					<form:form method="post" action="${pageContext.request.contextPath }/safety/ppersonUpdate.do" modelAttribute="enterPerson">
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-3">
								<form:input path="ppNm" class="form-control"/>
								<form:errors path="ppNm" class="error" />
							</div>
						</div>
						
						<input type="hidden" name="ppPno"  value="${enterPerson.ppPno }">
						
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">출국금지사유</label>
							<div class="col-sm-3">
								<form:textarea path="ppRes" class="form-control" style="height: 100px" />
								<form:errors path="ppRes" class="error" />
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputDate" class="col-sm-2 col-form-label">출국금지지간</label>
							<div class="col-sm-3">
								<form:input path="ppPer" type="date" class="form-control" />
								<form:errors path="ppPer" class="error" />
							</div>
						</div>
						
						<input type="hidden" name="ppWw"  value="out">
						
						<!-- 전송버튼 -->
						<div class="d-flex">
						<label for="inputDate" class="col-sm-2 col-form-label"></label>
							<div class="row mb-3">
								<label class="col-sm-2 col-form-label"></label>
								<div class="col-sm-10">
									<form:button type="submit" class="btn btn-primary">저장</form:button>
								</div>
							</div>
							<div class="row mb-3">
								<label class="col-sm-2 col-form-label"></label>
								<div class="col-sm-10">
									<form:button type="reset" class="btn btn-secondary btn-block">취소</form:button>
								</div>
							</div>
						</div>

					</form:form>
				</div>

			</div>
		</div>

	</div>

</section>

