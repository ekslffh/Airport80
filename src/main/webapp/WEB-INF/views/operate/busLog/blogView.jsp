<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
      .table th {
    white-space: nowrap;
	width: 200px;

  }
        
    

</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    




					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">운행일지</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">셔틀버스</a></li>
					        <li class="breadcrumb-item"><a href="#">운행일지</a></li>
					        <li class="breadcrumb-item active">상세조회</li>
					      </ol>
					    </nav>
					 </div>
					 <div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							일별 운행일지를 조회할 수 있습니다.</span>
						</p>
					</div>						 



<table class="table table-border">
 
 

  <tr>
    <th class="table-light">아이디</th>
    <td>${blog.blogId }</td>
  </tr>
  <tr>
    <th class="table-light">제목</th>
    <td>${blog.blogTitle }</td>
  </tr>
  <tr>
    <th class="table-light">내용</th>
    <td>${blog.blogContent }</td>
  </tr>
  <tr>
    <th class="table-light">작성일자</th>
    <td>${blog.blogCrtTs }</td>
  </tr>   
  <tr>
    <th class="table-light">작성자</th>
    <td>${blog.blogWriter }</td>
  </tr>   


  
  <c:url value="/operate/busLog/blogUpdate.do" var="updateURL">
				<c:param name="what" value="${blog.blogId }" />
  </c:url>
  <c:url value="/operate/busLog/blogDelete.do" var="deleteURL">
		<c:param name="blogId" value="${blog.blogId }" />
  </c:url>



<tr align="right">
	<td colspan="2">

		<a href="${updateURL}" class="btn btn-primary">수정</a>
		<a href="${deleteURL }" class="btn btn-dark">삭제</a>
		<a href="<c:url value="/operate/busLog/blogList.do" />" class="btn btn-secondary">목록</a>
	</td>
</tr>

</table>

				</div>
			</div>
		</div>
	</div>
</section>


