<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/jquery-X.X.X.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
<style>
 h1 {
    color: white;
  }
  button{
     background-color:white;
  }
 .parent-container {
  max-height: 700px; /* 최대 높이 설정 */
  overflow-y: auto; /* 세로 방향 스크롤 적용 */
  /* 필요한 경우 추가적인 스타일링을 적용할 수 있음 */
  width: 1000px;
} 

.bn-number {

        font-size: 20px;
    }
    
 .image-cell {
	width: 300px;
	height: 200px;
	/* 다른 필요한 스타일들 */
}



</style>



   
   <!-- ======= Hero Section ======= -->
   <section id="hero" class="hero">
   
   

      <div class="info d-flex align-items-center" style="margin-left:200px;">
          <div>  

					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="http://localhost/Airport80/"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item active" style="color:white;">모집 공고</li>
					      </ol>
					    </nav>
			<div class="d-flex">
		    <h1 style="font-size: 25px;">모집 공고 </h1>&nbsp;&nbsp;<a href="#balist" title="goToList" style="display:inline-block; margin-top:5px;" >
		      <i class="bi bi-arrow-right";"></i>전체입찰현황</a>
		      </div>
         <div class="card">
</div>

<div class="parent-container" style="width:1100px;">
    <div class="accordion" id="accordionExample">
        <c:forEach items="${bnList}" var="bn">

            <div class="accordion-item">
<%--                 <h2 class="accordion-header" id="heading${bn.bnNo}"> --%>
                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapse${bn.bnNo}" aria-expanded="true"
                            aria-controls="collapse${bn.bnNo}">
                         
                        <span class="bn-number">${bn.bnNo}</span>
                        &nbsp;&nbsp; ${bn.bnTitle} &nbsp;&nbsp;
                        
                          <c:choose>
                                <c:when test="${bn.bnStatus == '모집중'}">
                                    <span style="background: lightsteelblue; color: white; padding: 2px 6px; border-radius: 6px;">${bn.bnStatus}</span>
                                </c:when>
                                <c:when test="${bn.bnStatus == '모집완료'}">
                                    <span style="background: steelblue; color: white; padding: 2px 6px; border-radius: 6px; letter-spacing: -1.1px;">${bn.bnStatus}</span>
                                </c:when>
                                <c:otherwise>${bn.bnStatus}</c:otherwise>
                            </c:choose>
                     

   
                    </button>
                    
                

                <div id="collapse${bn.bnNo}" class="accordion-collapse collapse "
                     aria-labelledby="heading${bn.bnNo}" data-bs-parent="#accordionExample">
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
                              
                              
                              <th style="text-align: center; border-top:1px solid #ccc; ">입찰 위치</th>
                              <td style="border-top: 1px solid #ccc; ">${bn.bnEnterLoc}  
                              <a href="javascript:;" data-bs-toggle="modal"
                                    data-bs-target="#noBaList" class="noBa" data-source="${bn.bnNo}">
                                    입찰 현황</a>
                              
                              </td>
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
                         

                        
                        
                        
                        
                        <!-- 모달버튼 -->
                        <c:choose>
                           <c:when test="${bn.bnStatus == '모집중' }">
                              <div style="text-align: right; margin-top: 10px;">
                                 <a href="javascript:;" data-bs-toggle="modal"
                                    data-bs-target="#baform" class="ba" data-source="${bn.bnNo}">
                                    입찰 신청</a>
                              </div>
                           </c:when>
                        </c:choose>
                        
 
                        
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


   
   
  

</div>
      

            
                  
                  
                  
                  
               </div>


      <div id="hero-carousel" class="carousel slide" data-bs-ride="carousel"
         data-bs-interval="5000"></div>

         <div class="carousel-item active"
            style="background-image: url(resources/open/assets/img/hero-carousel/airport1.jpg)"></div>


      
   </section>
   
   <br><br>
   

   
   

   <section id="hero" class="hero">
   </section>


<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
   <form:hidden path="searchType" />
   <form:hidden path="searchWord" />
   <input type="hidden" name="page" />
</form:form>


   
   
<br><br>
   
   
   
<!-- ======= Get Started Section ======= -->
<section id="balist" class="get-started section-bg" >
   <div class="container">

      <div id="balist"></div>


      </div>
</section>


<c:url value="/open/operate/ajaj/baInsert.do?what=${bn.bnNo}" var="viewURL" />

<!--입찰신청 모달  -->
<div class="modal fade" data-url="${viewURL}" id="baform" tabindex="-1"
   data-bs-backdrop="false">
   <div class="modal-dialog"
      style="margin-top: 130px; margin-right: 300px;">
      <div class="modal-content"
         style="box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3); width:600px;" >
      
         <div class="modal-body">...</div>
        
      </div>
   </div>
</div>


<c:url value="/open/operate/ajaj/noBaList.do" var="viewURL" />

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
					data-bs-dismiss="modal" style="margin-bottom:20px; margin-right:20px;">취소</button>
			</div>
        
      </div>
   </div>
</div>









<script>


$(document).ready(function() {
    // 모든 섹션을 접는 함수
    function collapseAllSections() {
       $(".accordion-button").addClass("collapsed");
       $(".accordion-collapse").removeClass("show");
    }

    // 페이지 로드시 모든 섹션 접기
    collapseAllSections();

    // 섹션 클릭 시 다른 섹션 접기
    $(".accordion-button").click(function() {
       collapseAllSections();
    });
 });
 
 

$(baform).on("show.bs.modal", function(event) {
    let bnNo = event.relatedTarget.dataset['source'];
    console.log("id값 나오나유", bnNo);

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
 
 
 


 
 
 
$(document).ready(function() {
    baList();
 });
 
 function changBaList(data) {
	 $.ajax({
	       url : '<c:url value="/open/operate/ajaj/baList.do"/>',
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
$(function(){

	$('#baform').draggable();

	});


</script>


