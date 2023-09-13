<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
  

<style>
.table-title {
        font-size: 25px; 
        margin-bottom: 10px; 
        color: white;
}
.parent-container {
    display: flex;
    flex-direction: column;
    max-height: 800px;
    overflow: auto;

  }

  .table {
    border-collapse: collapse;
    width: 100%;
  }
  .table th,
  .table td {
    border: 1px solid #adadad;
  }
.table th {
    white-space: nowrap;
	width: 150px;

  }
.btn-outline-dark {
        background-color: white; 
        color: black; 
        border-color: black; 

    }
.hero .info p{
	color : black;
}
 
</style>

<main>
<section id="hero" class="hero">

	<div class="info d-flex align-items-center">
		<div class="container">
		
		<br><br>
		
		<nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="http://localhost/Airport80/"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item" style="color:white;">게시판</li>
					        <li class="breadcrumb-item" style="color:white;">공지 게시판</li>
					      </ol>
					    </nav>
<div class="table-title">공지(<span class="cnbno" style="font-size:20px; color:orange;">${cnb.cnbNo }</span>)</div>
		<div class="parent-container" style="height:700px;">
				<table class="table table-border " >
		
	<tr>
		<th class="table-light">제목</th>
		<td  style="width: 750px;">${cnb.cnbTitle }</td>
		<th class="table-light">조회수</th>
		<td>${cnb.cnbVws }</td>
	</tr>


	<tr> 
		<th class="table-light">작성자</th>
		<td colspan="3">${cnb.cnbWriter }</td>
	</tr>

	<c:if test="${not empty cnb.fileGroup and not empty cnb.fileGroup.detailList}">
	<tr>
		<th class="table-light">첨부파일</th>
		<td colspan="3"><c:if
				test="${not empty cnb.fileGroup and not empty cnb.fileGroup.detailList }">
				<c:forEach items="${cnb.fileGroup.detailList }" var="fileDetail"><br>
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
	<tr>
	<th class="table-light">내용</th>
		<td colspan="3">${cnb.cnbContent }</td>
	</tr>
	
	

	
	</table>
	
	</div>
	 <div style="text-align: right; margin-top: 10px;">
			
			<a class="btn btn-outline-dark" href="<c:url value='/open/operate/cnbList.do'/>">목록</a>
	</div>
	
	

</div>
</div>



<div id="hero-carousel" class="carousel slide" data-bs-ride="carousel"
		data-bs-interval="5000">
	


		<div class="carousel-item active"
			style="background-image: url(resources/open/assets/img/hero-carousel/airport1.jpg)"></div>
</div>




</section>

</main>




