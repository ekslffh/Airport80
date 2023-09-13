<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<c:url value='/infra/ocUpdate.do' var="updateURL">
	<c:param name="what" value="${supplier.sprId }" />
</c:url>
<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">업체상세정보</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">업체관리</a></li>
					        <li class="breadcrumb-item"><a href="#">외주업체</a></li>
					        <li class="breadcrumb-item active">업체상세정보</li>
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
					<a class="btn btn-primary"
						href="<c:choose>
								<c:when test='${supplier.sprType eq "CC" }'>
									<c:url value='/infra/ccUpdate.do'>
										<c:param name="what" value="${supplier.sprId }" />
									</c:url>
								</c:when>
								<c:otherwise>
									<c:url value='/infra/ocUpdate.do' >
										<c:param name="what" value="${supplier.sprId }" />
									</c:url>
								</c:otherwise>
							</c:choose>"> 업체수정</a>
					 <a class="btn btn-secondary" 
					   href="<c:choose>
					            <c:when test='${supplier.sprType eq "CC"}'>
					                <c:url value="/infra/ccList.do"/>
					            </c:when>
					            
					            <c:otherwise>
					                <c:url value="/infra/orderCompanyList.do"/>
					            </c:otherwise>
					        </c:choose>">
					    목록으로
					</a>

					<table class="table table-border">
						<tr>
							<th>업체아이디</th>
							<td>${supplier.sprId}</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${supplier.sprNm}</td>
						</tr>
						<tr>
							<th>분류</th>
							<td>${supplier.commonCode.codeNm}</td>
						</tr>
						<tr>
							<th>대표전화번호</th>
							<td>${supplier.sprContact}</td>
						</tr>
						<tr>
							<th>주소지</th>
							<td>${supplier.sprAddr}</td>
						</tr>
						<tr>
							<th>사업자등록번호</th>
							<td>${supplier.sprNum}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${supplier.sprEmail}</td>
						</tr>
						<tr>
							<th>계약상태</th>
							<td>${supplier.sprStatus}</td>
						</tr>
						<tr>
							<th>계약아이디</th>
							<td>${supplier.ctrId}</td>
						</tr>

					</table>
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