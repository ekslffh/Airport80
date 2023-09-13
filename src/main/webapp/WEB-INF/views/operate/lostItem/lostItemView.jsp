<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.liid{
		color: red;
	}
</style>


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				

				<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<h5 class="card-tit">분실물 상세보기</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">고객</a></li>
					        <li class="breadcrumb-item ">분실물관리</li>
					        <li class="breadcrumb-item active">분실물 상세보기(<span class="liid">${lostItem.liId}</span>)</li>
					      </ol>
					    </nav>
				 </div>
				 
					 <div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							등록된 분실물의 상세정보를 확인할 수 있습니다.</span>
						</p>
					</div>						 


<table class="table table-border" style="height: 80%;" >
 

    <tr>
    <th rowspan="8" style="text-align: center;"><img
				src="${pageContext.request.contextPath }/resources/images/li/${lostItem.fileGroup.detailList[0].fiNm}" 
				style="width:auto; height:500px;"
				/></th>
    <th>분실물이름</th>
    <td>${lostItem.liNm }</td>
  </tr>
    <tr>
    <th>분실물종류</th>
    <td>${lostItem.liCtgr }</td>
  </tr>
    <tr>
    <th>습득장소</th>
    <td>${lostItem.liLoc }</td>
  </tr>
    <tr>
    <th>습득일시</th>
    <td>${lostItem.liFndTs }</td>
  </tr>

    <tr>
    <th>등록일자</th>
    <td>${lostItem.liCrtTs }</td>
  </tr>
    <tr>
    
  <tr>
    <th>분실자명</th>
    <td>
        <c:choose>
            <c:when test="${empty lostItem.liPsNm}">
                알수없음
            </c:when>
            <c:otherwise>
                ${lostItem.liPsNm}
            </c:otherwise>
        </c:choose>
    </td>
</tr>

  <tr>
    <th>상태</th>
    			<td>
				    <c:choose>
				        <c:when test="${lostItem.liStatus == '등록'}" >
				            <span style="color: red;">${lostItem.liStatus}</span>
				        </c:when>
				        <c:when test="${lostItem.liStatus == '반환'}">
				            <span style="color: limegreen;">${lostItem.liStatus}</span>
				        </c:when>
				        <c:when test="${lostItem.liStatus == '만료'}">
				            <span style="color: orange;">${lostItem.liStatus}</span>
				        </c:when>
				        <c:otherwise>${lostItem.liStatus}</c:otherwise>
				    </c:choose>
				</td>
  </tr>

  
<!--   <tr> -->
<!--     <th>분실물이미지</th> -->
<%--     <td>${lostItem.liImg }</td> --%>
<!--   </tr> -->
  
  <c:url value="/lostItem/lostItemUpdate.do" var="updateURL">
				<c:param name="what" value="${lostItem.liId }" />
			</c:url>
<tr>
<th colspan="3" style="text-align: center;">분실하신 분께서는 본인을 증명할 수 있는 서류를 지참하여 분실물 보관센터에 방문하여 주시기 바랍니다.</th>
</tr>

</table>

				</div>
			</div>
		</div>
	</div>
</section>




<div style="text-align: right; margin-top: 10px;">
<a href="${updateURL}" class="btn btn-primary">수정</a>
<a href="<c:url value="/lostItem/lostItemList.do" />" class="btn btn-secondary">목록</a>
</div>