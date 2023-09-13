<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <script src="https://code.jquery.com/jquery-X.X.X.min.js"></script> -->
<!-- <script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
<!-- <script src="https://code.jquery.com/jquery-X.X.X.min.js"></script> -->
<style>
.collapsed-accordion {
	background-color: white;
}

.accordion-button:not(.collapsed) {
	background-color: white; /* 선택된 아코디언 버튼의 배경색 */
}

.accordion {
	max-height: 770px; /* 최대 높이 설정 */
	overflow-y: auto; /* 세로 방향 스크롤 적용 */
	/* 필요한 경우 추가적인 스타일링을 적용할 수 있음 */
}


.image-cell {
	width: 300px;
	height: 200px;
	/* 다른 필요한 스타일들 */
}
</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">



			<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">모집공고</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item ">입점</li>
					        <li class="breadcrumb-item active">모집공고</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->
				    
					<div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							입점업체를 모집하고 해당 공고의 상태를 변경할 수 있습니다.  공고별 입찰현황을 조회할 수 있습니다. </span>
						</p>
					</div>				    
					    

			<button type="button"  class="btn btn-outline-secondary btn-lg" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-controls="flush-collapseOne" 
			style="background-color: transparent; border: none;" id="toggleButton"><i class="bi bi-plus-circle" id="icon"></i>
			    등록
			</button>
		<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
			<div class="accordion-body">

	<section id="bnForm" class="get-started section-bg">
		<div class="container">
			<div id="bnForm"></div>
		</div>

	</section>
	
	</div>
	</div>


<div>
	<section id="conentlist">
		 <div class="card">
                  <div class="card-header" style="padding: 9px 15px 9px; color: #787878; background: #c5d0e3; color: white; font-size: 19px;">모집공고 리스트
                  <a href="#balist" title="goToList"
						style="display: inline-block; font-size: 15px;"> &nbsp;&nbsp;>전체입찰현황</a>
                  </div>

			<!-- <div class="parent-container"> -->
			<div class="accordion" id="accordionExample" style="height:500px;">
				<c:forEach items="${bnList}" var="bn">

					<div class="accordion-item">
						<%--                 <h2 class="accordion-header" id="heading${bn.bnNo}"> --%>
						<button class="accordion-button collapsed-accordion" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapse${bn.bnNo}"
							aria-expanded="true" aria-controls="collapse${bn.bnNo}">

							<span class="bn-number">${bn.bnNo}</span> &nbsp;&nbsp;
							${bn.bnTitle} &nbsp;&nbsp; 
							<a href="" class="btn btn-light graybd bn-button btn-sm"
								data-bs-toggle="modal" data-bs-target="#bnStatusModal"
								data-bnno="${bn.bnNo}" style="background-color: white;"> 
								<c:choose>
									<c:when test="${bn.bnStatus == '모집중'}">
										<span style="color: orange;">${bn.bnStatus}</span>
									</c:when>
									<c:when test="${bn.bnStatus == '모집완료'}">
										<span style="color: limegreen;">${bn.bnStatus}</span>
									</c:when>
									<c:otherwise>${bn.bnStatus}</c:otherwise>
								</c:choose>
							</a>



						</button>



						<div id="collapse${bn.bnNo}" class="accordion-collapse collapse "
							aria-labelledby="heading${bn.bnNo}"
							data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<%--                         <strong>${bn.bnEnterLoc}</strong><br> --%>
								<%--                         운영시간 : ${bn.bnStartTime} 부터 ${bn.bnEndTime} 까지<br> --%>
								<%--                         예상금액: <fmt:formatNumber value="${bn.bnAmt}" type="number" pattern="#,### 원" /><br> --%>
								<%--                         마감일 : ${bn.bnDeadline }<br> --%>



								<table style="border-collapse: collapse; width: 100%;">


				<tr style="border-bottom: 1px solid #ccc; ">
                           	<th class="image-cell" rowspan="5">
										<img src="${pageContext.request.contextPath }/resources/images/bn/${bn.fileGroup.detailList[0].fiNm}" 
											style="width:500px; height:500px;"/>
							</th>
                              
                              
                              <th style="text-align: center; border-top:1px solid #ccc;">입찰 위치 </th>
                              <td style=" border-top:1px solid #ccc;"><strong>${bn.bnEnterLoc}
                              <a href="javascript:;" data-bs-toggle="modal"
                                    data-bs-target="#noBaList" class="noBa" data-source="${bn.bnNo}">
                                    입찰 현황</a>
                              
                              </strong></td>
                           </tr>
                           <tr style="border-bottom: 1px solid #ccc; ">
                              <th style="text-align: center; ">운영시간</th>
                              <td>${bn.bnStartTime} 부터 ${bn.bnEndTime} 까지</td>
                           </tr>
                           <tr style="border-bottom: 1px solid #ccc;">
                              <th style="text-align: center; ">예상금액</th>
                              <td><fmt:formatNumber value="${bn.bnAmt}" type="number"
                                     pattern="#,### 원" /></td> 
                           </tr>
                           <tr style="border-bottom: 1px solid #ccc;">
                              <th style="text-align: center; ">마감일</th>
                              <td>${bn.bnDeadline}</td>
                           </tr>
                          <tr>

										<!--                            <tr> -->
										<!-- 							    <th colspan="2" style="text-align: center; " > -->
										<%-- 							      <td >${bn.bnImg}</td> --%>
										<!-- 							    </th> -->
										<!-- 							  </tr> -->
								</table>
								<c:url value="/operate/bidNotice/bnUpdate.do" var="updateURL">
									<c:param name="what" value="${bn.bnNo } " />
								</c:url>
								<c:url value="/operate/bidNotice/bnDelete.do" var="deleteURL">
									<c:param name="bnNo" value="${bn.bnNo }" />
								</c:url>
								<div style="text-align: right; margin-top: 10px;">
									<a href="${updateURL }">수정</a> &nbsp; 
									<a href="#"  onclick="confirmDelete('${deleteURL}')">삭제</a>
								</div>
								

							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

</div>

<div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							전체 입찰현황과 입찰 상세정보를 확인할 수 있습니다. 계약상황을 변경할 수 있습니다.</span>
						</p>
					</div>				    


<section id="balist" class="get-started section-bg">

		<div id="balist" ></div>

</section>






<div class="modal fade" id="bnStatusModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">상태변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<form:form method="post"
					action="${pageContext.request.contextPath }/operate/bidNotice/bnStatusUpdate.do"
					modelAttribute="bn">

					<form:hidden path="bnNo" value="" id="bnnoValue" />

					<span>상태</span>
					<form:select class="form-select" type="text" path="bnStatus"
						style="display:inline; width:70%; margin-left: 40px;">
						<form:option value="" label="상태변경" />
						<form:option value="모집중" label="모집중" />
						<form:option value="모집완료" label="모집완료" />
					</form:select>
					<form:errors path="bnStatus" class="error" />
					<br>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<button type="submit" class="btn btn-primary">변경</button>
			</div>

			</form:form>

		</div>
	</div>
</div>



				</div>
			</div>
		</div>
	</div>
</section>


<c:url value="/operate/bidApplication/ajaj/noBaList.do" var="viewURL" />

<!--입찰현황 모달  -->
<div class="modal fade" data-url="${viewURL}" id="noBaList" tabindex="-1"
   data-bs-backdrop="false">
   <div class="modal-dialog"
>
      <div class="modal-content" style="width:500px;"
         style="box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3); width:700px;" >
      
         <div class="modal-body">...</div>
         <div style="text-align: right; ">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal" style="margin-bottom:20px; margin-right:20px;" >취소</button>
        </div>
      </div>
   </div>
</div>


<script>
	
	
	let selectBnNo;
	
	const bnButtons = document.querySelectorAll('.bn-button');
	bnButtons.forEach(button =>{
		button.addEventListener('click', function(){
			selectBnNo = this.getAttribute('data-bnno');
			$('#bnnoValue').val(selectBnNo);
		});
	});
	
	
</script>


<script>
$(document).ready(function() {
	bnForm();
 });

 function bnForm() {
    $.ajax({
       url : '<c:url value="/operate/bidNotice/ajaj/bnInsert.do"/>',
       method : 'get',
       dataType : 'html',
       success : function(data) {
          $('#bnForm').html(data);
       },
       error : function(jqXHR, status, error) {
          console.log(jqXHR);
          console.log(status);
          console.log(error);
       }
    });

 }
                                                                  

 $(document).ready(function() {
    baList();
 });
 
 function changBaList(data) {
	 $.ajax({
	       url : '<c:url value="/operate/bidApplication/ajaj/baList.do"/>',
	       method : 'get',
	       data: data,
	       dataType : 'html',
	       success : function(data) {
	          $('#balist').html(data);
	       },
	       error : function(jqXHR, status, error) {
	          console.log(jqXHR);
	          console.log(status);
	          console.log(error);
	       }
	    });

 }

 function baList() {
	 changBaList();
 }
 
</script>
<script>
function fn_paging(page){
	var data = {};
	data.page = page;
	data.searchType = $(searchForm).find('[name = searchType]').val();
	data.searchWord = $(searchForm).find('[name = searchWord]').val();
	changBaList(data);
}

$("#balist").on("click", function(event){
		const target = event.target;
		// 클릭된 요소가 특정 자식 요소인 경우 처리
        if ($(target).is("#searchBtn")) {
			$(searchUI).find(":input[name]").each(function(idx, input){
				let name = input.name;
				let value = $(input).val();
				$(searchForm).find(`[name=\${name}]`).val(value);
			});
			var data = {};
			data.searchType = $(searchForm).find('[name = searchType]').val();
			data.searchWord = $(searchForm).find('[name = searchWord]').val();
		// 	data.page = $(searchForm).find('[name = page]').val();
			
			console.log("data", data);
		// 	$(searchForm).submit();
		
			changBaList(data);
    }
});

$(document).ready(function() {
    // 부모 요소에서 자식 버튼의 클릭 이벤트 처리
    $("#balist")
    	.on("click", ".ba-button", function() {
    		selectBaId = this.getAttribute('data-baid');
			$('#baidValue').val(selectBaId);
    	})
    	.on("click", "#changeBtn", function () {
    		const $baForm = $("#baForm");
    		const url = $(baForm).attr("action");
    		const method = $(baForm).attr("method");
    		const data = $(baForm).serialize();
    		console.log(url);
    		$("#cancelBtn").trigger("click");

    		$.ajax({
    		       url : url,
    		       method : method,
    		       data: data,
    		       dataType : 'html',
    		       success : function(data) {
    		    	  console.log("성공");
    		    	  console.log(data);
    		    	  console.log("baLISD", $('#balist'));
    		          $('#balist').html(data);
    		       },
    		       error : function(jqXHR, status, error) {
    		          console.log(jqXHR);
    		          console.log(status);
    		          console.log(error);
    		       }
    		    });
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
<script>
$(noBaList).on("show.bs.modal", function(event) {
    let bnNo = event.relatedTarget.dataset['source'];
    console.log("리스트값 나오나유", noBaList);

    let $modalBody = $(this).find(".modal-body");
    let viewURL = this.dataset['url'];
    if (bnNo) {
       let settings = {
          url : viewURL,
          dataType : "html",
          data : {
             bnNo : bnNo
          },
          success : function(resp) {

             $modalBody.html(resp);
          }
       }
       $.ajax(settings);
    }
 }).on("hidden.bs.modal", function(event) {
    let $modalBody = $(this).find(".modal-body");
    $modalBody.empty();
 });
$(function(){

	$('#noBaList').draggable();

	});


</script>
<script>	
// 삭제 링크 클릭 시 실행될 함수
function confirmDelete(deleteURL) {
    Swal.fire({
        title: '정말 삭제하시겠습니까?',
        text: '삭제한 데이터는 복구할 수 없습니다.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#212529',
        cancelButtonColor: '#6c757d',
        confirmButtonText: '삭제',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            // 확인 버튼을 클릭하면 삭제 링크로 이동
            window.location.href = deleteURL;
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