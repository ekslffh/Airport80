<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h5 class="card-tit">반입불가 물품관리</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item"><a href="#">보안검색</a></li>
								<li class="breadcrumb-item active">반입불가 물품관리</li>
								<li class="breadcrumb-item active">반입불가 물품등록</li>
							</ol>
						</nav>
					</div>
					<!-- 게시판 헤더 영역 끝 -->
					
<form:form method="post" modelAttribute="confisInfo">
	<form:hidden path="ciNo" />
	<table class="table table-border">
		<tr>
			<th class="col-sm-2">구분</th>
			<td class="col-sm-5">
			<input class="form-control" type="text" name="ciGubun"
				value="${confisInfo.ciGubun }" /><span class="error">${errors["ciGubun"]}</span></td>
			<td class="col-sm-5"></td>
		</tr>
		<tr>
			<th class="col-sm-2">내용</th>
			<td class="col-sm-5"><input class="form-control" type="text" name="ciCarryBan"
				value="${confisInfo.ciCarryBan }" /><span class="error">${errors["ciCarryBan"]}</span></td>
			<td class="col-sm-5"></td>
		</tr>
		<tr>
			<th class="col-sm-2" style="height: 52px;">기내 반입</th>
			<td class="col-sm-5">
			<input type="radio" name="ciCabin" id="ciCabinYes" value="Y" ${confisInfo.ciCabin == 'Y' ? 'checked' : ''}>
			<label for="ciCabinYes" style="margin-right: 40px;">반입 가능</label>
			
			<input type="radio" name="ciCabin" id="ciCabinNo" value="N" ${confisInfo.ciCabin == 'N' ? 'checked' : ''}>
			<label for="ciCabinNo">반입 불가능</label>
			<span class="error">${errors["ciCabin"]}</span>
			</td>
			<td class="col-sm-5"></td>
		</tr>
		<tr>
			<th class="col-sm-2" style="height: 52px;">수화물 반입</th>
			<td class="col-sm-5">
			<input type="radio" name="ciTrust" id="ciTrustYes" value="Y" ${confisInfo.ciTrust == 'Y' ? 'checked' : ''}>
			<label for="ciTrustYes" style="margin-right: 40px;">반입 가능</label>
			
			<input type="radio" name="ciTrust" id="ciTrustNo" value="N" ${confisInfo.ciTrust == 'N' ? 'checked' : ''}>
			<label for="ciTrustNo">반입 불가능</label>
			<span class="error">${errors["ciTrust"]}</span></td>
			<td class="col-sm-5"></td>
		</tr>
	</table>
			<div class="d-flex justify-content-end">
			<input type="submit" value="등록" class="btn btn-primary" style="margin-right:4px;"/> 
			<input type="reset" value="취소" class="btn btn-dark" style="margin-right:4px;"/>
			<a class="btn btn-secondary gray_btn" href="<c:url value='/safety/ConfisInfo.do' />">목록으로</a>
			</div>
			
	</form:form>
	
				</div>
			</div>
		</div>
	</div>
</section>
