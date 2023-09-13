<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<security:authentication property="principal.realUser" var="authMember" />

<style>
.upbtn{
    margin-top: 12px;
    margin-left: 7px;
    border: 1px solid #dbdbdb;
}

.wid {
    width: 15%;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}

.adiv{
	 width: 99%; 
	 transition: width 0.2s;
}
.bdiv{
 	width: 0;
}

.dbivTit {
	 display: none;
}

.total {
    display: block;
    font-size: 28px;
    margin-bottom: -8px;
}

.btnArea{
    display: inline-block;
    width: 100%;
    height: 60px;
}

.imgwarp {
	width: 125px;
	height : 125px;
}

.imgcss {
	width: 100%;
	height: 100%;
	border-radius: 3px;
}

</style>





<div class="d-flex">
<section class="section adiv" id="divA" >
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">요청목록</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">지원요청</a></li>
					        <li class="breadcrumb-item active">요청목록 조회</li>
					      </ol>
					    </nav>
					 </div>



<!-- 1. 요청목록 리스트 -->
<ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist" style="margin-top: 20px; font-weight: 600;">
	<li class="nav-item flex-fill" role="presentation">
		<button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="true">
		<span id="allBtn" class="btnArea">전체
		<span id="totalCount" class="total"></span></span> 
		</button>
	</li>
	<li class="nav-item flex-fill" role="presentation">
		<button class="nav-link w-100" id="profile-tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">
		<span id="getAllDataBtn" class="btnArea">요청(대기중) 
		<span id="reqCount" class="total"></span></sapn></button>
	</li>
	<li class="nav-item flex-fill" role="presentation">
		<button class="nav-link w-100" id="contact-tab" data-bs-target="#bordered-contact" type="button" role="tab" aria-controls="contact" aria-selected="false">
		<span id="proBtn" class="btnArea">접수(처리)
		<span id="proCount" class="total"></span></sapn></button>
	</li>
	<li class="nav-item flex-fill" role="presentation">
		<button class="nav-link w-100" id="complete-tab" data-bs-target="#bordered-complete" type="button" role="tab" aria-controls="complete" aria-selected="false">
		<span id="comBtn" class="btnArea">완료
		<span id="comCount" class="total"></span></sapn></button>
	</li>
	<li class="nav-item flex-fill" role="presentation">
		<button class="nav-link w-100" id="reject-tab" data-bs-target="#bordered-reject" type="button" role="tab" aria-controls="reject" aria-selected="false">
		<span id="rejBtn" class="btnArea">반려
		<span id="rejCount" class="total"></span></sapn></button>
	</li>
</ul>


<!-- 탭내용 영역 -->
<div class="tab-content pt-2" id="borderedTabJustifiedContent">




	<!-- 1. 전체 요청 목록 -->
	<div class="tab-pane fade show active" id="bordered-home" role="tabpanel" aria-labelledby="home-tab">

		<!-- 내용시작 -->
		<!-- 검색 UI -->
		<div id="dateSearch" style="margin-top: 20px;">
			<!-- 요청부서별 필터링 -->
			<form id="searchUi" class="d-flex">
				<div>
					<select id="departSelect" class="form-select-sm" style="border: 1px solid rgb(0 0 0/ 30%); height: 30px; width: 104px;" name="departSelect">
						<option value="">요청구분</option>
						<option value="수리청소">수리청소</option>
						<option value="추가예산">추가예산</option>
						<option value="보안지원">보안지원</option>
					</select>
				</div>

				<div class="d-flex" style="justify-content: end; width: 100%;">
					<!-- 날짜선택  -->
					<div class="d-flex">
						<input type="date" id="startDate" class="form-select-sm" style="padding: 4px 10px 4px 14px; border: 1px solid rgb(0 0 0/ 30%); height: 30px; margin-right: 7px;" /> <span style="color: gray; margin-top: 5px;">~</span> <input type="date" id="endDate" class="form-select-sm" style="padding: 4px 10px 4px 14px; border: 1px solid rgb(0 0 0/ 30%); height: 30px; margin-left: 7px; margin-right: 10px;" />
					</div>
					<div id="searchUII" class="d-flex">
						<div class="col-auto">
							<select class="form-select-sm" id="searchType" style="border: 1px solid rgb(0 0 0/ 30%); height: 30px;">
								<option value="" label="전체" />
								<option value="content" label="요청내용" />
								<option value="reqId" label="요청ID" />
							</select>
						</div>
						<div class="col-auto">
							<input type="search" id="searchWord" class="form-select-sm" placeholder="search" style="padding: 4px 0px 4px 14px; margin-left: 5px; width: 150px; border: 1px solid rgb(0 0 0/ 30%);  height: 30px;" /> 
							<!-- 페이지 hidden으로 전송-->
							<input type="hidden" name="page" id="page" />
							<!-- 페이지 hidden으로 전송 끝-->
							<!-- 상태 조건으로 전송 시작 -->
							<input type="hidden" name="reqStatus" id="reqStatus" />
							<!-- 상태 조건으로 전송 끝 -->
						</div>
						<div class="col-auto">
							<input type="button" value="검색" id="searchBtn" class="btn btn-secondary" style="padding: 3px 8px; background: silver; border: 1px solid #a7a7a7; margin-left: 2px; margin-top: -1px;" />

						</div>
					</div>
				</div>
					
			</form>
		</div>

		<!-- 전체요청목록 list -->
		<table class="table table-hover" style="margin-top: 12px; table-layout: fixed; width: 100%;">
			<thead class="table-primary">
				<tr class="font-sm" style="vertical-align : middle;">
					<th class="text-center" style="width: 50px;">번호</th>
					<th class="text-center">요청ID</th>
					<th class="text-center">구분<i class="bi bi-caret-up-fill"></i></th>
					<th class="text-center">요청내용</th>
					<th class="text-center">위치/금액</th>
					<th class="text-center" style="width: 14%;">요청일시</th>
					<th class="text-center" style="width: 80px;">작성자</th>
					<th class="text-center" style="width: 85px;">상태</th>
					<th class="text-center" style="width: 97px;">요청상세</th>
				</tr>
			</thead>
			<tbody id="allreqList"></tbody>
		</table>
		<div id="pagingHTML" class="d-flex justify-content-center"></div>
		<!-- 내용끝 -->
	
	</div>
	<!-- 1.전체 요청 목록 끝 -->


</div>
<!-- End Bordered Tabs -->


				</div>
			</div>
		</div>
	</div>
</section>


<!-- 상세보기(수정) -->
 <div class="card bdiv" id="divB">
	 <div class="card-header dbivTit">
	      요청 상세보기
	</div>
	<div class="card-body" id="viewBody"></div>
</div>

<!-- 수정모달 -->
<div class="modal fade" id="verticalycentered" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title">요청 수정</h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       </div>
       <div class="modal-body" id="modalBody">
       </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
     </div>
   </div>
</div>

</div>
			
              
<script>
let empNo = "${authMember.empNo }";
let paging;
let tempDataList;
let reqStatus;

getAllData();

//날짜 시간 출력데이터(초 빼고 표시) 
function formatDate(dateArray) {
  const year = dateArray[0];
  const month = String(dateArray[1]).padStart(2, '0');
  const day = String(dateArray[2]).padStart(2, '0');
  const hours = String(dateArray[3]).padStart(2, '0');
  const minutes = String(dateArray[4]).padStart(2, '0');
  
  return year + '-' + month + '-' + day + " " + hours + ":" + minutes;
}

//파라미터 다 가져오기
function getAllData() {
	let tData = {};
	
	console.log($(searchUi).find(":input[id]"));
	
	$(searchUi).find(":input[id]").each(function(idx, element){
		if ($(element).attr('type') == 'button') return;
		let name = $(element).attr("id");
		let value = $(element).val();
		tData[name] = value;
	});
	
	let page = $('#page').val();
	let departSelectValue = $(departSelect).val();
	tData.departSelect = departSelectValue;

    let startDateValue = $("#startDate").val();
    let endDateValue = $("#endDate").val();
    tData.startDate = startDateValue;
    tData.endDate = endDateValue;

    let searchTypeValue = $("#searchType").val();
    let searchWordValue = $("#searchWord").val();
    let searchStatusValue = $("#reqStatus").val();
    tData.searchType = searchTypeValue;
    tData.searchWord = searchWordValue;
    
    if(searchStatusValue=='reqStatus'){
    	tData.reqStatus = searchStatusValue;
    }else if(searchStatusValue=='proStatus'){
    	tData.reqStatus = searchStatusValue;
    }else if(searchStatusValue=='comStatus'){
    	tData.reqStatus = searchStatusValue;
    }else if(searchStatusValue=='rejStatus'){
    	tData.reqStatus = searchStatusValue;
    }
    
	tData.page = page;
	tData.empNo = empNo;
	
	console.log("reqStatus 파라미터로 넘어가니 : ", tData);
	console.log("reqStatus 파라미터로 넘어가니 : ", tData.reqStatus);
	
    var viewURL = "<c:url value='/common/requestAllList.do' />";
    $.ajax({
        type: "GET",
        url: viewURL,
        data: tData,
        success: function(paging) {
       	   tempDataList = paging.paging.dataList;
           console.log(paging);
           pageLoad(paging);
           $("#page").val('');
           
           // 상태별 갯수 화면에 출력 
           let reqCnt = paging.allCount.requestCnt;
           let proCnt = paging.allCount.processCnt;
           let comCnt = paging.allCount.completeCnt;
           let rejCnt = paging.allCount.rejectCnt;
           
           $(reqCount).html(reqCnt);
           $(proCount).html(proCnt);
           $(comCount).html(comCnt);
           $(rejCount).html(rejCnt);
           
           // 요청목록 총갯수 화면에 출력
           $(totalCount).html(paging.reqAllCount);
           
        },
        error: function() {
            alert("해당되는 게시물이 없습니다.");
        }
    });
    
	console.log("tData", tData);
}



//필터링, 검색버튼 눌렀을떄 파라미터 전달 
$(document).ready(function(){
	
	
	    // 탭 버튼 클릭 이벤트 리스너 설정
	    $('.nav-link').on('click', function() {
	        // 모든 탭 버튼의 스타일 초기화
	        $('.nav-link').removeClass('active');
	        $('.nav-link').css('border-color', '');
	        
	        // 클릭한 탭 버튼 스타일 변경
	        $(this).addClass('active');
	        $(this).css('border-color', 'blue'); // 파란색으로 변경
	        
	        // 탭에 해당하는 내용 표시/숨김
// 	        var targetTab = $(this).attr('data-bs-target');
// 	        $('.tab-pane').removeClass('show active');
// 	        $(targetTab).addClass('show active');
	    });

	
	
	// 전체목록 조회
	$("#allBtn").on('click', function(){
		$("#reqStatus").val('');
		getAllData();
	});
	

	 //필터링
	 $(departSelect).on("change", function(event){
		 getAllData();
     });

 
	 //검색 버튼 클릭 이벤트 핸들러
	 $(searchBtn).on("click", function(event){
	     startDate = $(startDate).val(); // 시작날짜
	     endDate = $(endDate).val(); // 종료날짜
	     searchType = $(searchType).val(); // 검색조건
	     searchWord = $(searchWord).val(); // 검색어 
	
	 	getAllData();
	
	    });
 
 
	// 요청(대기중) 조회
	$("#getAllDataBtn").on('click', function () {
		$("#reqStatus").val('reqStatus');
		
		getAllData();
	});
    
	
 	// 접수(처리) 조회
	$("#proBtn").on('click', function () {
		$("#reqStatus").val('proStatus');
		
		getAllData();
	});
 	
 	// 완료 조회
	$("#comBtn").on('click', function () {
		$("#reqStatus").val('comStatus');
		
		getAllData();
	});
 	
 	// 반려 조회
	$("#rejBtn").on('click', function () {
		$("#reqStatus").val('rejStatus');
		
		getAllData();
	});
	
	
    
});




/*페이지를 선택해서 검색하면 페이지 번호 값을 가져옴  */
$("#searchUi").on("submit", function (event) { /*폼 버튼 타입이 버튼이어야 해, 서브밋 안대  */
    event.preventDefault();
    
    const data = $("#searchUi").serialize(); /*page  */
      console.log("data", data);
     
      var viewURL = "<c:url value='/common/requestAllList.do' />";
      $.ajax({
          type: "GET",
          url: viewURL,
          data: data,
          success: function(paging) {
              console.log(paging);
              pageLoad(paging);
          },
          error: function() {
             
          }
      });
});



let reqCount1 = 0;
let proCount1 = 0;
let comCount1 = 0;
let rejCount1 = 0;
let status1;
//페이지, 또는 검색어 검색 시 받은 결과물 게시물 목록 데이터를 로드  최초에 페이징 값을 깔아주는 코드 말고, 검색어, 페이지를 파라미터로 보냈을 때 조건에 따라 출력해주는 코드 
function pageLoad(paging){
	
	let tbody= $(allreqList);
	tbody.empty();
	
	let	tableList= paging.paging.dataList;
	
	let pagingHTML = paging.paging.pagingHTML;
	$("#pagingHTML").html(pagingHTML);
	
	
	console.log("pagingq받아오는값",paging);
	if (tableList.length > 0){
		$.each(tableList, function(index, reqList){
			
			
			let reqFloor = reqList.reqFloor; // reqList.reqFloor 값
			let reqLo = reqList.reqLo; // reqList.reqLo 값
			

			let formattedValue = "";

			if (reqFloor == null) {
			    // reqFloor 값이 'null층'일 경우 reqLo 값을 포맷합니다.
			    reqLo = '₩ ' + parseFloat(reqLo).toLocaleString();
			    formattedValue = reqLo;
			    
			} else {
			    // reqFloor 값이 'null층'이 아닌 경우 '층' 문자열을 추가하여 포맷합니다.
			    formattedValue = reqFloor + '층 ' + reqLo;
			}
			
			let tr = $("<tr>").append(
				$("<td>").addClass("text-center").html(reqList.rnum),
				$("<td>").addClass("text-center").html(reqList.reqId),
				$("<td>").addClass("text-center").html(reqList.reqCtgr),
				$("<td>").addClass("wid text-center").html(reqList.reqCont),
				$("<td>").addClass("text-center").html(formattedValue),
				$("<td>").addClass("text-center").html(formatDate(reqList.reqTs)),
				$("<td>").addClass("text-center").html(reqList.reqWriter),
				$("<td>").addClass("text-center").html(reqList.reqStatus),
				$("<td>").addClass("text-center").html($("<button type='button'>").text("요청상세")
						 .addClass("btn btn-outline-secondary btn-sm"))
				)
				.addClass("datatr")
				.prop("id",reqList.reqId)
				.data("source", reqList.reqId)
				.data("status", reqList.reqStatus);
				
				tr.css("cursor", "pointer");
				tbody.append(tr);
				
				status1 = reqList.reqStatus;
				
			});
					} else {
						tbody.append("<tr><td colspan='9' style='text-align: center;'>요청목록이 없습니다.</td></tr>");
					}

	}
	


//페이징처리 (2번 3번 클릭)
function fn_paging(page) {
// 	searchUi.page.value = page; // 노트북에서는 동작안함 
	$("#page").val(page); //노트북에서 동작
	getAllData();
}




//상세보기 view 
$(allreqList).on("click","tr", function(event) {
	event.stopPropagation();
	
	$("#divA").css("width", "75%");
	$("#divB").css({
		"width" : "25%",
		"margin-left" : "10px"
	});
	$(".dbivTit").css("display", "block");

	let tr = $(this);
	let what = tr.data("source");
	let reqView = $(viewBody);
	let viewURL = "${pageContext.request.contextPath}/common/requestView.do";
		
	
	$.ajax({
	    url: viewURL,
	    data: {
	        what: what
	    },
	    dataType: "json",
	    success: function(data) {
	        console.log("view 응답 데이터", data);

	        let requestView = data;

	        if (requestView) {
	            if (requestView && requestView.srId && requestView.srId.startsWith("SR")) {
	                console.log("srId 처리", requestView.srId);

	                let h5 = $("<h5>")
	                    .html("보안지원요청")
	                    .addClass("card-title")
	                    .css("font-weight", "600");
	                let table = $("<table>")
	                    .addClass("table table-borderless");
	                let tbody = $("<tbody>");
	                let tr1 = $("<tr>")
	                    .append($("<th>").html("요청ID").css("width", "40%"), $("<td>").css("color", "gray").html(requestView.srId));

	                let tr2 = $("<tr>")
	                    .append($("<th>").html("작성자"), $("<td>").css("color", "gray").html(requestView.srReqMem));

	                let tr3 = $("<tr>")
	                    .append($("<th>").html("카테고리"), $("<td>").css("color", "gray").html(requestView.srCa));

	                let tr4 = $("<tr>")
	                    .append($("<th>").html("위치"), $("<td>").css("color", "gray").html(requestView.zone.zoneFloor + "층 " + requestView.zone.zoneCtgr));

	                let tr5 = $("<tr>")
	                    .append($("<th>").html("요청일시"), $("<td>").css("color", "gray").html(formatDate(requestView.srTs)));

	                let tr6 = $("<tr>")
	                    .append($("<th>").html("요청내용"), $("<td>").css("color", "gray").html(requestView.srContent));

// 	                let updBtn = $("<button type='button' data-bs-toggle='modal' data-bs-target='#verticalycentered'>")
// 	                    .addClass("btn btn-light upbtn").data("source", requestView.srId)
// 	                    .text("수정").attr("id", "upbtn");
	                
	                
	                
	                
	                tbody.append(tr1, tr2, tr3, tr4, tr5, tr6);
	                table.append(tbody);

	                let view = $("<div>").append(h5, table);

	                reqView.html(view);
	            } else if (requestView && requestView.rrId && requestView.rrId.startsWith("RR")) {
	                console.log("rrId 처리", requestView.rrId);

	                let h5 = $("<h5>")
	                    .html("수리청소요청")
	                    .addClass("card-title")
	                    .css("font-weight", "600");
	                let table = $("<table>")
	                    .addClass("table table-borderless");
	                let tbody = $("<tbody>");
	                let tr1 = $("<tr>")
	                    .append($("<th>").html("요청ID").css("width", "40%"), $("<td>").css("color", "gray").html(requestView.rrId));

	                let tr2 = $("<tr>")
	                    .append($("<th>").html("작성자"), $("<td>").css("color", "gray").html(requestView.rrAcc));

	                let tr3 = $("<tr>")
	                    .append($("<th>").html("카테고리"), $("<td>").css("color", "gray").html(requestView.common.codeNm));

	                let tr4 = $("<tr>")
	                    .append($("<th>").html("위치"), $("<td>").css("color", "gray").html(requestView.zone.zoneFloor + "층 " + requestView.zone.zoneCtgr));

	                let tr5 = $("<tr>")
	                    .append($("<th>").html("발생일시"), $("<td>").css("color", "gray").html(formatDate(requestView.rrOccurTs)));

	                let tr6 = $("<tr>")
	                    .append($("<th>").html("요청일시"), $("<td>").css("color", "gray").html(formatDate(requestView.rrTs)));

	                let tr7 = $("<tr>")
	                    .append($("<th>").html("요청내용"), $("<td>").css("color", "gray").html(requestView.rrContent));

	                let contextPath = "${pageContext.request.contextPath}";
	                let imgSrc = "/resources/images/rncReq/";

// 	                let updBtn = $("<button type='button' data-bs-toggle='modal' data-bs-target='#verticalycentered'>")
// 	                .addClass("btn btn-light upbtn").data("source", requestView.rrId)
// 	                .text("수정").attr("id", "upbtn");

		            if (requestView.fileGroup && requestView.fileGroup.detailList && requestView.fileGroup.detailList.length > 0) {
		            	let tr8 = $("<tr>")
		                .append($("<th>").html("첨부이미지"))
		                .append($("<td>").append(
		                    $("<div>").addClass("imgwarp").append(
		                        $("<img>").addClass("imgcss").attr("src", contextPath + imgSrc + requestView.fileGroup.detailList[0].fiNm).attr("alt", "첨부이미지")
		                    )
		                ));

		                tbody.append(tr1, tr2, tr3, tr4, tr5, tr6, tr7, tr8);
		            } else {
		                tbody.append(tr1, tr2, tr3, tr4, tr5, tr6, tr7);
		            }

	                table.append(tbody);
	                let view = $("<div>").append(h5, table);

	                reqView.html(view);
	            } else if (requestView && requestView.bgRId && requestView.bgRId.startsWith("BG")) {
	                console.log("bgRId 처리", requestView.bgRId);

	                let h5 = $("<h5>")
	                    .html("추가예산신청")
	                    .addClass("card-title")
	                    .css("font-weight", "600");
	                let table = $("<table>")
	                    .addClass("table table-borderless");
	                let tbody = $("<tbody>");
	                let tr1 = $("<tr>")
	                    .append($("<th>").html("신청ID").css("width", "40%"), $("<td>").css("color", "gray").html(requestView.bgRId));

	                let tr2 = $("<tr>")
	                    .append($("<th>").html("금액"), $("<td>").css("color", "gray").html(new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(requestView.bgRAmt)));

	                let tr3 = $("<tr>")
	                    .append($("<th>").html("사유"), $("<td>").css("color", "gray").html(requestView.bgRRsn));

	                let tr4 = $("<tr>")
	                    .append($("<th>").html("계정과목"), $("<td>").css("color", "gray").html(requestView.acaNm));

	                let tr5 = $("<tr>")
	                    .append($("<th>").html("상태"), $("<td>").css("color", "gray").html(requestView.bgRStatus));

	                let tr6 = $("<tr>")
	                    .append($("<th>").html("신청직원"), $("<td>").css("color", "gray").html(requestView.empEmpNm));

	                let tr7 = $("<tr>")
	                    .append($("<th>").html("접수일"), $("<td>").css("color", "gray").html((requestView.bgRTs).split(":").slice(0, 2).join(":")));

	                let tr8 = $("<tr>")
	                    .append($("<th>").html("처리직원"), $("<td>").css("color", "gray").text(!requestView.salEmpNm ? "승인대기중" : requestView.salEmpNm));

	                let tr9 = $("<tr>")
	                    .append($("<th>").html("처리일"), $("<td>").css("color", "gray").text(!requestView.bgRResTs ? "승인대기중" : (requestView.bgRResTs).split(":").slice(0, 2).join(":")));

	                let tr10 = $("<tr>")
	                    .append($("<th>").html("처리직원"), $("<td>").css("color", "gray").text(!requestView.bgRResRsn ? "승인대기중" : requestView.bgRResRsn));

// 	                let updBtn = $("<button type='button' data-bs-toggle='modal' data-bs-target='#verticalycentered'>")
// 	                    .addClass("btn btn-light upbtn").data("source", requestView.bgRId)
// 	                    .text("수정").attr("id", "upbtn");

	                tbody.append(tr1, tr2, tr3, tr4, tr5, tr6, tr7, tr8, tr9, tr10);
	                table.append(tbody);

	                let view = $("<div>").append(h5, table);

	                reqView.html(view);
	            } else {
	                console.log("요청된 view가 없습니다.");
	            }
	        }
	    }
	});

});



//보안 수정폼 모달창 
$(document).on("click", "#upbtn", function(event) {
	event.stopPropagation();
	
	let reqId = $(this).data("source");
	
	let viewURL = "${pageContext.request.contextPath}/common/requestUpdate.do";
	
	$.ajax({
		type: "get",
		url: viewURL,
		data : { reqId : reqId},
		dataType : "html",
		success: function(resp){
			
		$(modalBody).html(resp);
			
		},
		error: function(xhr, status, error) {
            console.error(error);
            alert("수정폼열기 실패")
      }
	});
});



</script>
