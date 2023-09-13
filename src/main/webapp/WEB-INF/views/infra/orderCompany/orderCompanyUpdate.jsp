<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">업체정보수정</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">업체관리</a></li>
					        <li class="breadcrumb-item"><a href="#">외주업체</a></li>
					        <li class="breadcrumb-item active">업체정보수정</li>
					      </ol>
					    </nav>
					 </div>
<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title"></h5>
					<p></p>
					<form:form method="post" modelAttribute="supplier">

						<form:hidden path="sprId" />
						<form:hidden path="sprType" />
						<table class="table table-border">
							<tr>
								<th>업체이름</th>
								<td><input class="form-control" type="text" name="sprNm"
									value="${supplier.sprNm }" /><span class="error">${errors["sprNm"]}</span></td>
							</tr>
							<tr>
								<th>분류</th>
								<td><form:select path="sprGu" class="form-control">
										<form:option value="" label="분류선택" />
										<form:options items="${commonCode }" itemLabel="codeNm"
											itemValue="codeId" />
									</form:select> <form:errors path="sprGu" class="error" /></td>
							</tr>
							<tr>
								<th>대표전화번호</th>
								<td><input class="form-control" type="text"
									name="sprContact" value="${supplier.sprContact }" /><span
									class="error">${errors["sprContact"]}</span></td>
							</tr>
							<tr>
								<th>사업장소재지</th>
								<td><input class="form-control" type="text" name="sprAddr"
									value="${supplier.sprAddr }" /><span class="error">${errors["sprAddr"]}</span></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input class="form-control" type="text" name="sprEmail"
									value="${supplier.sprEmail }" /><span class="error">${errors["sprEmail"]}</span></td>
							</tr>
							<tr>
								<th>사업자등록번호</th>
								<td><input class="form-control" type="text" name="sprNum"
									value="${supplier.sprNum }" /><span class="error">${errors["sprNum"]}</span></td>
							</tr>
							<tr>
								<th>계약상태</th>
								<td><input class="form-control" type="text"
									name="sprStatus" value="${supplier.sprStatus }" /><span
									class="error">${errors["sprStatus"]}</span></td>
							</tr>
							<tr>
								<th>계약아이디</th>
								<td><input class="form-control" type="text" name="ctrId"
									value="${supplier.ctrId }" /><span class="error">${errors["ctrId"]}</span></td>
							</tr>
							<tr>
								<td colspan="2"><input class="btn btn-success"
									type="submit" value="수정"> <input class="btn btn-danger"
									type="reset" value="취소"> <input
									class="btn btn-secondary" type="button" value="뒤로가기"
									onclick="history.back();"></td>
							</tr>
						</table>
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