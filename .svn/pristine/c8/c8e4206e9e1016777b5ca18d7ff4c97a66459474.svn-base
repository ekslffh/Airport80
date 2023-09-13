<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    



<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">사내 게시판</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">게시판</a></li>
					        <li class="breadcrumb-item active">사내 게시판</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->
				    
				    <button type="button"  class="btn btn-outline-secondary btn-lg" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-controls="flush-collapseOne" 
			style="background-color: transparent; border: none;" id="toggleButton"><i class="bi bi-plus-circle" id="icon"></i>
			    등록
			</button>
		<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
			<div class="accordion-body">
				
				
							
							
							<section id="empbrdForm" class="get-started section-bg">
								<div class="container">
									<div id="empbrdForm" ></div>
								</div>
							
							</section>

			</div>
		</div>
					
					
					
<div>
<section id="conentlist">
	<div class="card">
<div class="card-header" style="padding: 9px 15px 9px; color: #787878; background: #c5d0e3; color: white; font-size: 19px;">공지 리스트</div>
<div class="card-body">
				
<table class="table Default Table" style="margin-top: 10px; margin-bottom: 10px;" >

		<tr>
			<th><spring:message code="empbrd.ebNo"/></th>
			<th><spring:message code="empbrd.ebTitle"/></th>
			<th>작성자</th>
			<th><spring:message code="empbrd.ebCrtDt"/></th>
			<th><spring:message code="empbrd.ebVws"/></th>
		</tr>

	<tbody>
		<c:forEach items="${pubList }" var="pub">
			<tr>
				<c:url value="/hr/empbrd/empbrdView.do" var="viewURL">
					<c:param name="what" value="${pub.ebNo }" />
				</c:url>
				<td style="color: red;">필독</td>
				<td><a href="${viewURL }">${pub.ebTitle }</a></td>
				<td>${pub.empNm }</td>
				<td>${pub.ebCrtDt }</td>
				<td>${pub.ebVws }</td>
			</tr>
		</c:forEach>
		<c:set var="empbrdList" value="${paging.dataList }" />
			<c:forEach items="${empbrdList }" var="empbrd">
				<tr>
					<c:url value="/hr/empbrd/empbrdView.do" var="viewURL">
						<c:param name="what" value="${empbrd.ebNo }" />
					</c:url>
					<td>${empbrd.ebNo }</td>
					<td><a href="${viewURL }">${empbrd.ebTitle }</a></td>
					<td>${empbrd.empNm }</td>
					<td>${empbrd.ebCrtDt }</td>
					<td>${empbrd.ebVws }</td>
				</tr>
			</c:forEach>
	</tbody>

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
							<form:option value="empNo" label="작성자" />
							<form:option value="ebPub" label="필독 공지" />
							<form:option value="ebTitle" label="제목" />
						</form:select>
					</div>
					<div  class="col-auto">
						<form:input path="simpleCondition.searchWord" class="form-control"/>
					</div>
					<div  class="col-auto">
						<input type="button" value="검색" id="searchBtn" class="btn btn-primary"/>
						
					</div>
				</div>
			</td>
		</tr>
	</tfoot>
		</table>
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
		empbrdForm();
	 });

	 function empbrdForm() {
		    $.ajax({
		       url : '<c:url value="/hr/empbrd/ajax/empbrdInsert.do"/>',
		       method : 'get',
		       dataType : 'html',
		       success : function(data) {
		          $('#empbrdForm').html(data);
		       },
		       error : function(jqXHR, status, error) {
		          console.log(jqXHR);
		          console.log(status);
		          console.log(error);
		       }
		    });

		 }
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
