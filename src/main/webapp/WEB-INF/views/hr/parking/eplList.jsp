<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
#divA{
	 width: 99%; 
	 transition: width 0.2s;
}
.bdiv{
 	width: 0;
}

.dbivTit {
	 display: none;
}

.count_zone ul {
	padding-left: 20px;
}
.user_wrap {
	position : relative;
/* 	width: 100%; */
}

.user_wrap img {
/* 	width : 100%; */
}
.tooltip {
  position: absolute;
  background-color: rgba(0, 0, 0, 0.7);
  color: white;
  padding: 5px;
  border-radius: 5px;
  display: none;
}
</style>


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">사내 주차장 관리</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">사내 주차장</a></li>
					        <li class="breadcrumb-item active">신청 내역</li>
					      </ol>
					    </nav>

					    <div class="d-flex" style="padding: 0px 15px 0px; margin-bottom: -10px; border: 0;" id="searchUI">
							<div class="d-flex" style="margin-left: auto;">
								<p>
									<input type="search" class="form-control" placeholder="search"
										style="padding: 4px 0px 4px 14px; border: 1px solid rgb(0 0 0/ 30%);"
										id="searchInput" />
								</p>
								<span>
									<button type="submit" id="searchBtn" style="border: 0; padding: 0; margin-left: -30px; background: none; margin-top: 4px;">
										<i class="bi bi-search"></i>
									</button>
								</span>
							</div>
						</div>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->

<table class="table table-bordered">
	<tr>
		<th>주차장</th>
		<th>잔여 주차 공간</th>
	</tr>
	<c:forEach items="${parkArea}" var="area">
		<tr>
			<th>${area.codeNm}(${area.codeId})</th>
			<td>${area.codeVal - area.apprCount}</td>
		</tr>
	</c:forEach>
</table>
</div>

<div class="d-flex">	
<div id="divA"> 
   <div class="card-body">
      <table class="table table-bordered" id="eplList" style="height:355px;">
         <thead class="table-light">
            <tr style="text-align:center">
               <th>신청 번호</th>
               <th>주차장 ID</th>
               <th>신청자</th>
               <th>희망 구역</th>
               <th>신청 날짜</th>
               <th>처리 현황</th>
            </tr>
         </thead>
         <tbody style="text-align:center">
            <c:set var="eplStatusList" value="${paging.dataList }" />
            
            <c:forEach items="${eplStatusList }" var="eplStatus">
               <tr>
                  <td>${eplStatus.rnum }</td>
                  <td onclick="getEplView('${eplStatus.eplId}')" 
                  	style="color: blue; text-decoration: underline; cursor: pointer;">${eplStatus.eplId }</td>
                  <td>${eplStatus.empNm }</td>
                  <td>${eplStatus.eplCd }</td>
                  <td>${eplStatus.esCrtDt }</td>
                  <td> 
                     <c:choose>
		                <c:when test="${eplStatus.esStatus == 'APP'}">
		                	<span style="color: blue;">신청</span>
		                </c:when>
						<c:when test="${eplStatus.esStatus == 'APPR'}">
							<span style="color: green;">승인</span>
						</c:when>
						<c:when test="${eplStatus.esStatus == 'REJ'}">
							<span style="color: red;">반려</span>
						</c:when>
						<c:when test="${eplStatus.esStatus == 'CAN'}">
							<span style="color: gold;">취소</span>
						</c:when>
					</c:choose>   
                   </td>
               </tr>
            </c:forEach>
         </tbody>
         <tfoot>
            <tr>
               <td colspan="6">
                  <div class="d-flex justify-content-center mb-3">
                  ${paging.pagingHTML }
                  </div>
               </td>
            </tr>
         </tfoot>
      </table>
   </div>
</div>


<!-- <div class="card bdiv" id="divB"> -->
<div id="divB">
       <div class="card-header dbivTit">상세보기(수정)</div>
       <div class="card-body" id="eplView">
       </div>
</div>

</div>

				</div>
			</div>
		</div>
	</div>
</section>






<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
   <form:hidden path="searchType" />
   <form:hidden path="searchWord" />
   <input type="hidden" name="page" />
</form:form>


<script src="<c:url value='/resources/js/app/hr/eplStatusList.js'/>"></script>


<script>
//상세보기 View
function getEplView(eplId) {
	$("#divA").css("width", "75%");
    $("#divB").css({
        "width" : "25%",
        "margin-left" : "10px"
    });
	console.log("eplIdzz", eplId);
    let settings = {
        url : "${pageContext.request.contextPath}/hr/parking/eplView.do?what=" + eplId,
        method : "get",
        dataType : "html",
        success : function(resp) {
            console.log("resp", resp);
            $("#eplView").html(resp);
        },
        error : function(jqXHR, status, error) {
            console.log(jqXHR);
            console.log(status);
            console.log(error);
        }
    };
    $.ajax(settings);
}

const areas = document.querySelectorAll('area');
areas.forEach(area => {
  area.addEventListener('mouseover', (event) => {
    const coords = area.coords.split(',').map(Number); // 좌표를 배열로 변환
    const tooltip = document.createElement('div');
    tooltip.className = 'tooltip';
    tooltip.textContent = event.target.title; // 툴팁 텍스트 설정
    tooltip.style.left = coords[0] + 'px'; // X 좌표 설정
    tooltip.style.top = coords[1] + 'px'; // Y 좌표 설정
    document.body.appendChild(tooltip); // 툴팁을 body 요소에 추가
  });

  area.addEventListener('mouseout', () => {
    const tooltips = document.querySelectorAll('.tooltip');
    tooltips.forEach(tooltip => {
      tooltip.remove(); // 툴팁 제거
    });
  });
});
</script>