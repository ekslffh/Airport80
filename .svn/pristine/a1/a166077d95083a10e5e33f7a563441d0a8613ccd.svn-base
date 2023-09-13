<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

    .center-image {
    display: flex;
    justify-content: center;
    align-items: center;

    }
    th{
    	width: 200px;
    }
</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

				<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<h5 class="card-tit">입찰신청 정보</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">입점</a></li>
					        <li class="breadcrumb-item ">입찰현황</li>
					        <li class="breadcrumb-item active">입찰신청 정보</li>
					      </ol>
					    </nav>
				</div>
					<div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							입찰신청한 업체의 상세정보를 확인할 수 있습니다.</span>
						</p>
					</div>	



<table class="table table-border">
 
 

  <tr>
    <th class="table-light">공고 번호</th>
    <td>${ba.baBnNo }</td>
    <th class="table-light">위치</th>
    <td>${ba.baReqSpace }</td>
  </tr>
  <tr>
    <th class="table-light">신청 아이디</th>
    <td colspan="3">${ba.baId }</td>
  </tr>
    <tr>
    <th class="table-light">업체명</th>
    <td colspan="3">${ba.baCoNm }</td>
  </tr>
   <tr>
    <th class="table-light">운영시간</th>
    <td colspan="3">${ba.baStartTime } ~  ${ba.baEndTime } </td>
  </tr>
   <tr>
    <th class="table-light">금액(원)</th>
    <td colspan="3">${ba.baAmt }</td>
  </tr>
  
    <tr>
    <th class="table-light">이메일</th>
    <td>${ba.baEmail }@${ba.baEmailDo }</td>

    <th class="table-light">전화번호</th>
    <td>${ba.baContact }</td>
  </tr>
  <c:if test="${not empty ba.fileGroup and not empty ba.fileGroup.detailList}">
  	<tr>
		<th class="table-light">사업자등록증</th>
		<td colspan="3"><c:if
				test="${not empty ba.fileGroup and not empty ba.fileGroup.detailList }">
				<c:forEach items="${ba.fileGroup.detailList }" var="fileDetail">
					<c:url value="/download.do" var="downloadURL">
						<c:param name="atchFileId" value="${fileDetail.atchFileId }" />
						<c:param name="fiSn" value="${fileDetail.fiSn }" />
					</c:url>
					<i class="bi bi-paperclip">
					<a href="${downloadURL }">${fileDetail.fiOriginNm }</a>
					</i>
				</c:forEach>
			</c:if></td>
	</tr>
	</c:if>
  
  


</table>

					</div>
			</div>
		</div>
	</div>
</section>
<div style="text-align: right; margin-top: 10px;">

<a href="<c:url value="/operate/bidNotice/bnList.do#balist" />" class="btn btn-secondary">목록</a>
</div>







