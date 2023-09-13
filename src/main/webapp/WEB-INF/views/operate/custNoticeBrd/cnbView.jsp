<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
    .table-title {
        font-size: 25px; 
        margin-bottom: 10px; 
        color: deepskyblue;
        
    }
    .table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
  }



  .table th {
    white-space: nowrap;
	width: 200px;

  }
  
  .cnbno{
		color: red;
	}

</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

				<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<h5 class="card-tit">내용 상세보기</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">고객</a></li>
					        <li class="breadcrumb-item ">공지게시판 관리</li>
					        <li class="breadcrumb-item active">No. ${cnb.cnbNo }</li>
					      </ol>
					    </nav>
				 </div>
				 
					 <div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							고객 공지게시판의 글을 상세조회 할 수 있습니다.</span>
						</p>
					</div>			

<table class="table table-bordered">
	
	<tr>
		<th class="table-light">제목</th>
		<td>${cnb.cnbTitle }</td>
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
			</c:if>
			</td>
	</tr>
	</c:if>
	<tr>
	<th class="table-light">내용</th>
		<td colspan="3">${cnb.cnbContent }</td>
	</tr>
	
	

	<c:url value="/operate/custNoticeBrd/cnbUpdate.do" var="updateURL">
		<c:param name="what" value="${cnb.cnbNo }" />
	</c:url>
	<c:url value="/operate/custNoticeBrd/cnbDelete.do" var="deleteURL">
		<c:param name="cnbNo" value="${cnb.cnbNo }" />
	</c:url>
	</table>
	
					</div>
			</div>
		</div>
	</div>
</section>
	
	 <div style="text-align: right; margin-top: 10px;">
			<a href="${updateURL }" class="btn btn-primary">수정</a>
			<a href="#" class="btn btn-dark" onclick="confirmDelete('${deleteURL}')">삭제</a>
			<a class="btn btn-secondary" href="<c:url value='/operate/custNoticeBrd/cnbList.do'/>">목록</a>
	</div>
	
<script>	
// 삭제 링크 클릭 시 실행될 함수
function confirmDelete(deleteURL) {
    Swal.fire({
        title: '정말 삭제하시겠습니까?',
        text: '삭제한 데이터는 복구할 수 없습니다.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: '삭제',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            // 확인 버튼을 클릭하면 삭제 링크로 이동
            window.location.href = deleteURL;
        }
    });
}
</script>


