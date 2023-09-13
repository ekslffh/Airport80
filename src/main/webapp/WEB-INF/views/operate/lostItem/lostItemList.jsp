<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  




    

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    




					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">분실물 관리</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">고객</a></li>
					        <li class="breadcrumb-item active">분실물 관리</li>
					      </ol>
					    </nav>
						 </div>
					 
					 <div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							<span data-bs-toggle="tooltip" data-bs-placement="top" >
							습득한 분실물을 등록하고, 등록된 분실물의 상태를 변경할 수 있습니다.</span>
						</p>
					</div>		
					 
					 
    
    
	 <button type="button"  class="btn btn-outline-secondary btn-lg" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-controls="flush-collapseOne" 
					style="background-color: transparent; border: none;" id="toggleButton"><i class="bi bi-plus-circle" id="icon"></i>
		    등록
	</button>
		<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
			<div class="accordion-body">
       
       
       
         <section id="lostForm" class="get-started section-bg">
            <div id="lostForm"></div>
         </section>
         
         </div>
         </div>
     
     
     
     
     
     
     
      <div>
         <section id="conentlist">

               <div class="card">
                  <div class="card-header" style="padding: 9px 15px 9px; color: #787878; background: #c5d0e3; color: white; font-size: 17px;">
                  <i class="bi bi-card-list"></i> 분실물 리스트</div>
                	<div class="card-body" >
                  <table class="table Default Table" style="margin-top: 10px; margin-bottom: 10px;">

                     <tr>
                        <th class="table-light" style="text-align: center">분실물 아이디</th>
                        <th class="table-light" style="text-align: center">분실물 이름</th>
                        <th class="table-light" style="text-align: center">분실물 종류</th>
                        <th class="table-light" style="text-align: center">분실자 이름</th>
                        <th class="table-light" style="text-align: center">등록일자</th>
                        <th class="table-light" style="text-align: center">상태</th>
                     </tr>

                     <tbody>
                        <c:set value="${paging.dataList }" var="lostItemList" />
                        <c:if test="${empty lostItemList }">
                           <tr>
                              <td colspan="6">분실물 없음</td>

                           </tr>
                        </c:if>
                        <c:if test="${not empty lostItemList }">
                           <c:forEach items="${lostItemList }" var="lostItem">
                              <c:url value="/lostItem/lostItemView.do" var="viewURL">
                                 <c:param name="what" value="${lostItem.liId }" />
                              </c:url>

                              <tr>
                                 <td class="text-center"><a href="${viewURL }">${lostItem.liId }</a></td>
                                 <td class="text-center">${lostItem.liNm }</td>
                                 <td class="text-center">${lostItem.liCtgr}</td>
                                 <td class="text-center">
							        <c:choose>
							            <c:when test="${empty lostItem.liPsNm}">
							                알수없음
							            </c:when>
							            <c:otherwise>
							                ${lostItem.liPsNm}
							            </c:otherwise>
							        </c:choose>
							   	 </td>
                                 
                                 
                                 
                                 <td class="text-center">${lostItem.liCrtTs }</td>
                                 <%--             <td>${lostItem.liStatus }</td> --%>

                                 <td class="text-center"><a href=""
                                    class="btn btn-light graybd li-button btn-sm"
                                    data-bs-toggle="modal" data-bs-target="#verticalycentered"
                                    data-liid="${lostItem.liId}" style="background-color: white;"> <c:choose>
                                          <c:when test="${lostItem.liStatus == '등록'}">
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
                                 </a></td>


                              </tr>
                           </c:forEach>
                        </c:if>
                     </tbody>

                  </table>
                     <tfoot>
                        <tr>
                           <td colspan="6">
                              <div class="d-flex justify-content-center mb-3">
                                 ${paging.pagingHTML}</div>
                              <div id="searchUI" class="row justify-content-center">
                                 <div class="col-auto">
                                    <form:select path="simpleCondition.searchType"
                                       class="form-select">
                                       <form:option value="" label="전체" />
                                       <form:option value="liCtgr" label="종류" />
                                       <form:option value="liStatus" label="상태" />
                                    </form:select>
                                 </div>
                                 <div class="col-auto">
                                    <form:input path="simpleCondition.searchWord"
                                       class="form-control" />
                                 </div>
                                 <div class="col-auto">
                                    <input type="button" value="검색" id="searchBtn"
                                       class="btn btn-secondary" />
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

<!-- Vertically centered Modal             -->
<div class="modal fade" id="verticalycentered" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title">상태변경</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
               aria-label="Close"></button>
         </div>
         <div class="modal-body">
            <form:form method="post"
               action="${pageContext.request.contextPath }/lostItem/liStatusUpdate.do"
               modelAttribute="lostItem">
               <form:hidden path="liId" value="" id="liidValue" />
               <span>상태</span>
               <form:select class="form-select" type="text" path="liStatus"
                  style="display:inline; width:70%; margin-left: 40px;">
                  <form:option value="" label="상태변경" />
                  <form:option value="등록" label="등록" />
                  <form:option value="반환" label="반환" />
                  <form:option value="만료" label="만료" />
                  <form:option value="폐기" label="폐기" />
               </form:select>
               <form:errors path="liStatus" class="error" />
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

<script>
   function fn_paging(page) {
      searchForm.page.value = page;
      searchForm.requestSubmit();
   }
   $(searchBtn).on("click", function(event) {
      $(searchUI).find(":input[name]").each(function(idx, input) {
         let name = input.name;
         let value = $(input).val();
         $(searchForm).find(`[name=\${name}]`).val(value);
      });
      $(searchForm).submit();
   });
   
   let selectLiId;
   
   const buttons = document.querySelectorAll('.li-button');
   buttons.forEach(button =>{
      button.addEventListener('click', function(){
         selectLiId = this.getAttribute('data-liid');
         $('#liidValue').val(selectLiId);
      });
   });
   
   
</script>
<script>
$(document).ready(function() {
   lostForm();
 });

 function lostForm() {
    $.ajax({
       url : '<c:url value="/lostItem/ajaj/lostItemInsert.do"/>',
       method : 'get',
       dataType : 'html',
       success : function(data) {
          $('#lostForm').html(data);
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





