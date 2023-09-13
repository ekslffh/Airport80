<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
<%-- <c:url value="/operate/custNoticeBrd/cnbInsert.do" var="insertURL" /> --%>



<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
				<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
 					<h5 class="card-tit">공지게시판 관리</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">고객</a></li>
					        <li class="breadcrumb-item active">공지게시판</li>
					      </ol>
					    </nav>
				 </div>
				 
					 <div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							하단 공지게시판에 등록한 게시글은 비로그인 게시판에 등록되며 비로그인 사용자들은 게시판에 접속하여 이 글을 조회할 수 있습니다.</span>
						</p>
					</div>					




			
			<button type="button"  class="btn btn-outline-secondary btn-lg" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-controls="flush-collapseOne" 
			style="background-color: transparent; border: none;" id="toggleButton"><i class="bi bi-plus-circle" id="icon"></i>
			    등록
			</button>
		<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
			<div class="accordion-body">
				
				
							
							
							<section id="cnbForm" class="get-started section-bg">
								<div class="container">
									<div id="cnbForm" ></div>
								</div>
							
							</section>

			</div>
		</div>






<div>
<section id="conentlist">
	<div class="card">
<div class="card-header" style="padding: 9px 15px 9px; color: #787878; background: #c5d0e3; color: white; font-size: 19px;">공지 리스트</div>
<div class="card-body" style="height: 600px;">

<table class="table Default Table" style="margin-top: 10px; margin-bottom: 10px;" >
		
		<tr>
			<th class="table-light" >번호</th>
			<th class="table-light" >제목</th>
			<th class="table-light" >작성자</th>
			<th class="table-light" >작성일</th>
			<th class="table-light" >조회수</th>
		</tr>
	<tbody>
		<c:set value="${paging.dataList }" var="cnbList" />
		<c:if test="${empty cnbList }">
			<tr>
				<td colspan="5">등록된 글 없음.</td>
			</tr>
		</c:if>	
		<c:if test="${not empty cnbList }">
			<c:forEach items="${cnbList }" var="cnb">
				<c:url value="/operate/custNoticeBrd/cnbView.do" var="viewURL">
					<c:param name="what" value="${cnb.cnbNo }" />
				</c:url>
				<tr>
					<td>${cnb.cnbNo }</td>
					<td><a href="${viewURL }">${cnb.cnbTitle }</a></td>
					<td>${cnb.cnbWriter }</td>
					<td>${cnb.cnbCrtTs }</td>
					<td>${cnb.cnbVws }</td>
				</tr>
				
			</c:forEach>
		</c:if>
		
		
	</tbody>
	
	
</table>
<tfoot>
		<tr>
			<td colspan="5">
				<div class="d-flex justify-content-center mb-3">
				${paging.pagingHTML }
				</div>
				<div id="searchUI" class="row justify-content-center">
					<div  class="col-auto">
						<form:select path="simpleCondition.searchType" class="form-select">
							<form:option value="" label="전체" />
							<form:option value="cnbWriter" label="작성자" />
							<form:option value="cnbTitle" label="제목" />
						</form:select>
					</div>
					<div  class="col-auto">
						<form:input path="simpleCondition.searchWord" class="form-control"/>
					</div>
					<div class="col-auto">
                    <input type="button" value="검색" id="searchBtn" class="btn btn-secondary" />
                </div>
						
				</div>
			</td>
		</tr>
	</tfoot>
</div>
		</div>
</section>
	</div>












<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
	<form:hidden path="searchType" />
	<form:hidden path="searchWord" />
	<input type="hidden" name="page" />
</form:form>

				</div>
			</div>
		</div>
	</div>
</section>





<script>
	function fn_paging(page){
		searchForm.page.value = page;
		searchForm.requestSubmit();
	}
	$(searchBtn).on("click", function(event){
		$(searchUI).find(":input[name]").each(function(idx, input){
			let name = input.name;
			let value = $(input).val();
			$(searchForm).find(`[name=\${name}]`).val(value);
		});
		$(searchForm).submit();
	});
</script>
<script>
$(document).ready(function() {
	cnbForm();
 });

 function cnbForm() {
	    $.ajax({
	       url : '<c:url value="/operate/custNoticeBrd/ajaj/cnbInsert.do"/>',
	       method : 'get',
	       dataType : 'html',
	       success : function(data) {
	          $('#cnbForm').html(data);
	       },
	       error : function(jqXHR, status, error) {
	          console.log(jqXHR);
	          console.log(status);
	          console.log(error);
	       }
	    });

	 }
 
 $(document).on("keydown", function(event) {
	    if (event.key === "Enter") {
	        event.preventDefault(); // 기본 동작(페이지 새로고침) 방지
	        $('#searchBtn').click(); // 검색 버튼 클릭
	    }
	});
 </script>
 <script>
$(document).ready(function() {
  // 버튼 클릭 시 이벤트 핸들러 등록
  $("#your-button-id").click(function() {
    // 아래 폼을 토글(나타났다가 사라졌다가)합니다.
    $("#contAreaBox").toggle();
  });
});

document.getElementById('toggleButton').addEventListener('click', function () {
    var icon = document.getElementById('icon');
    
    // 폼이 열려있을 때와 닫혀있을 때의 아이콘을 토글합니다.
    if (icon.classList.contains('bi-plus-circle')) {
        icon.classList.remove('bi-plus-circle');
        icon.classList.add('bi-dash-circle');
    } else {
        icon.classList.remove('bi-dash-circle');
        icon.classList.add('bi-plus-circle');
    }
});
</script>

