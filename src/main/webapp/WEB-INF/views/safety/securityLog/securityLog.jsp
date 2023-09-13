<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<security:authentication property="principal.realUser" var="authMember" />

<style>
.count_zone {
	margin-top: 10px;
	margin-bottom: -10px;
}

.count_zone ul li {
	list-style: none;
	margin-right: 10px;
}

.count_zone ul {
	padding-left: 0;
}

.choice{
	font-weight: 100;
    color: #878787;
    font-size: 13px;
}
</style>
<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">보안관리 일지</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item active">보안관리 일지</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->

					<!-- info영역 시작-->
					<div class="info" style="width: 100%; padding-bottom: 1px;">
						<p class="cofistooltip">
							<i class="bi bi-exclamation-circle" style="margin-right: 4px;"></i><span data-bs-toggle="tooltip" data-bs-placement="top" >
							보안지원 접수에서 '완료'된 요청은 자동으로 보안관리 일지 메뉴에 보안접수 내역으로 들어갑니다.</span>
						</p>
					</div>
					<!-- info영역 끝 -->
				

<!-- 보안관리 일지 작성 -->
<div class="card">
	<div class="card-header" style="padding: 9px 15px 9px; color: #787878; background: #c5d0e3; color: white; font-size: 17px;">
	
	<a data-bs-toggle="collapse" href="#collapseBody" aria-expanded="false" aria-controls="collapseBody" class="d-block" style="color:white;">
	<i class="bi bi-pencil-square"></i> 보안관리일지 작성</a></div>
	<div id="collapseBody" class="collapse">
		<div class="card-body" style="height: 385px;">
	
			<form:form method="post" modelAttribute="secLog" id="insertForm">
				<form:hidden path="slogWriter" value="${authMember.empNo }" />
	
				<table class="table table-bordered" style="margin-top: 10px; margin-bottom: 10px;">
					<tr>
						<th class="table-light">제목</th>
						<td colspan="3"><form:input path="slogTitle" class="form-control" type="text" placeholder="YYYYMMDD_보안일지" /> <form:errors path="slogTitle" class="error" /></td>
					</tr>
					<tr>
						<th class="table-light">보안접수 내역<span class="choice">(선택)</span></th>
						<td><form:input path="slogSrId" class="form-control" type="text" style="width: 160px; display: inline-block;" id="srIdInput" /> 
						<form:hidden path="slogCa" value="COMM" id="slogCaInput" />
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable" style="border: 1px solid #e0e0e0; border-radius: 3px; padding: 5px 9px; background: #e8eeff;">
								<i class="bi bi-search"></i>
							</button></td>
						<th class="table-light">처리일시</th>
						<td><form:input class="form-control" type="datetime-local" path="slogPrcDt" id="srTsInput" /> <form:errors class="error" path="slogPrcDt" /></td>
					</tr>
	
					<c:choose>
						<c:when test="${not empty slogSrId }">
							<form:hidden path="slogCa" value="REQ" />
						</c:when>
						<c:otherwise>
							<form:hidden path="slogCa" value="COMM" />
						</c:otherwise>
					</c:choose>
	
					<tr>
						<th class="table-light">보안이슈</th>
						<td colspan="3"><form:input path="slogIssue" class="form-control" type="text" id="srCtInput" /> <form:errors path="slogIssue" class="error" /></td>
					</tr>
					<tr>
	
						<th class="table-light">위치</th>
						<td>
						<select class="form-select" type="text" id="floorSelect" style="width: 120px; display: inline-block;">
								<option value="" label="층수선택" />
								<c:set var="previousFloor" value="" />
								<c:forEach items="${zoneList}" var="zone">
									<c:if test="${zone.zoneFloor != previousFloor}">
										<option value="${zone.zoneFloor}" label="${zone.zoneFloor}" />
										<c:set var="previousFloor" value="${zone.zoneFloor}" />
									</c:if>
								</c:forEach>
						</select> 
						<form:select class="form-select" type="text" path="slogFc" id="zoneSelect" style="width: 120px; display: inline-block;">
								<form:option value="" label="구역선택" />
								<c:forEach items="${zoneList }" var="zone">
									<form:option value="${zone.zoneCd }" class="${zone.zoneFloor}" label="${zone.zoneCtgr }" />
								</c:forEach>
						</form:select> <form:errors path="" class="error" /></td>
						<th class="table-light">압수품 여부</th>
						<td><form:select path="slogConfis" class="form-select">
								<form:option value="" label="압수품여부 선택" />
								<form:option value="Y" label="있음" />
								<form:option value="N" label="없음" />
							</form:select></td>
					</tr>
					<tr>
						<th class="table-light">처리내용</th>
						<td colspan="3"><form:textarea class="form-control" path="slogContent" id="srPrcCtInput" /> <form:errors path="slogContent" class="error" /></td>
					</tr>
					<tr>
						<th class="table-light">개선내용<span class="choice">(선택)</span></th>
						<td colspan="3">
							<div class="d-flex">
								<form:input class="form-control" path="slogInh" type="text" style="width: 85%; margin-right: 5px;" />
								<form:errors path="slogInh" class="error" />
								<button class="btn btn-dark" id="test" type="button"><i class="bi bi-folder"></i></button>
								<button type="submit" class="btn btn-primary btn-sm" style="font-size: 15px; padding: 4px 10px; margin-left: auto;">등록</button>
							</div>
						</td>
					</tr>
				</table>
	
			</form:form>
	
		</div>
	</div>
</div>
<!-- 보안관리 일지 작성 끝 -->


<!-- 보안관리 일지 영역 -->
<div class="card" style="height: 600px;">
	<div class="card-header" style="padding: 9px 15px 9px; border: 0; background: #b7c7de; border-bottom: 1px solid #d0d0d0; z-index: 3; padding-bottom:0;" id="searchUI">
		<p style="color: #ffffff; font-size: 17px; margin-bottom:10px;"><i class="bi bi-card-list"></i> 보안관리 일지</p>
	</div>

	<div class="card-body">
	

	
	
		<!-- 검색 UI 시작 -->
		<div class="d-flex justify-content-end" style="margin-top: 7px; margin-bottom: -22px;" >
			<div style="margin-right: 5px;">
				<select id="dept1" class="form-select" style="padding: 2px 20px; border: 1px solid rgb(0 0 0/ 30%);">
					<option value="">상태</option>
					<option value="COMM">일반(비요청)</option>
					<option value="REQ">요청</option>
				</select>
			</div>
			
			<p style="width: 180px;">
				<input type="search" class="form-control" placeholder="search" style="padding: 2px 0px 2px 14px; border: 1px solid rgb(0 0 0/ 30%);" id="searchInput" />
			</p>
			<span>
				<button type="submit" id="searchBtn" style="border: 0; padding: 0; margin-left: -30px; background: none; margin-top: 4px;">
					<i class="bi bi-search"></i>
				</button>
			</span>
		</div>
		<!-- 검색 UI 끝 -->
		
	
		<div class="d-flex" style="justify-content: space-between;">
			<!-- 총갯수 영역 -->
			<div class="count_zone">
				<ul class="d-flex">
				 <li><i class="bi bi-clipboard-check" style="font-size: 13px;"></i><span>총 </span><span id="countAll" class="totalcolor"></span><span>개</span></li>
				 <li data-bs-toggle="tooltip" data-bs-placement="top" title="보안지원접수에서 '완료'된 요청 일지"><i class="bi bi-exclamation-circle-fill" style="font-size: 13px;"></i><span>요청:</span><span id="countReq" class="totalcolor"></span><span>개</span></li>
				 <li data-bs-toggle="tooltip" data-bs-placement="top" title="담당직원이 매일 작성하는 보안관리일지"><i class="bi bi-exclamation-circle-fill" style="font-size: 13px;"></i><span>일반(비요청):</span><span id="countNonReq" class="totalcolor"></span><span>개</span></li>
				</ul>
			</div>
			<!-- 총갯수 영역 끝 -->
	
			<!-- 범례 영역 -->
			<ul class="d-flex align-items-end reqstus" style="margin-bottom: 7px;">
				<li style="font-size: 14.5px;"><span class="req"></span>일반(비요청)</li>
				<li style="font-size: 14.5px;"><span class="rec"></span>요청</li>
			</ul>
			<!-- 범례 영역 끝 -->
		</div>


		<div>
			<table class="table Default Table" >
				<tbody class="table-light">
					<tr>
						<th class="text-center">일지ID</th>
						<th class="text-center">제목</th>
						<th class="text-center">위치</th>
						<th class="text-center">처리일시</th>
						<th class="text-center">점검자</th>
						<th class="text-center">상태</th>
						<th class="text-center">삭제</th>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="req-body" style="height: 370px;">
			<table class="table table-hover">
				<tbody id="secLogListBody">
				</tbody>
			</table>
		</div>
	</div>
</div>
<!-- 보안관리 일지 끝 -->

				</div>
			</div>
		</div>
	</div>
</section>



<c:url value="/safety/secReqList.do" var="viewURL" />

<!-- 보안접수내역 모달 -->
<div class="modal fade" id="modalDialogScrollable" tabindex="-1" data-url="${viewURL}">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content" style="width: 730px; height: 640px;">
			<div class="modal-header">
				<h5 class="modal-title">보안접수 내역</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 보안접수내역 모달 -->





<!-- 보안일지 상세내역 모달 -->
<div class="modal fade" id="largeModal" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">보안일지 상세</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 보안일지 상세내역 모달 -->


<script>
const floorSelect = document.getElementById("floorSelect");
const zoneSelect = document.getElementById("zoneSelect");

floorSelect.addEventListener("change", function() {
    const selectedFloor = floorSelect.value;

    //기존 구역 옵션들 숨김
    for (const option of zoneSelect.options) {
        option.style.display = "none";
    }

    //선택된 층에 해당하는 구역 옵션들 표시
    for (const option of zoneSelect.options) {
        if (option.classList.contains(selectedFloor)) {
            option.style.display = "block";
        }
    }
});

zoneSelect.addEventListener("change", function() {
    const selectedZoneCode = zoneSelect.value;
});




//보안요청내역ID값 존재시 카테고리 상태 요청으로 insert
function updateslogCa() {
   let slogSrId = $(srIdInput).val().trim();
   console.log("slogid값", slogSrId);

   // "REQ"와 "COMM"을 각각 변수로 저장
   const reqValue = "REQ";
   const commValue = "COMM";

   // slogSrId가 비어있을 때만 slogCa 값 변경
   if (slogSrId !== "") {
      // 값이 들어가면 "REQ"로 설정
      $(slogCaInput).val(reqValue);
   } else {
      // 값이 없으면 "COMM"으로 설정
      $(slogCaInput).val(commValue);
   }
}


//보안접수 내역 모달창 상세조회 
$(modalDialogScrollable).on("show.bs.modal", function(event){
   
   let $modalBody = $(this).find(".modal-body");
   let viewURL = this.dataset['url'];
     let settings = {
           url : viewURL,
           dataType : "html",
           success : function(resp){
              $modalBody.html(resp);
           }
     }
     $.ajax(settings);
}).on("hidden.bs.modal", function(event){
   let $modalBody = $(this).find(".modal-body");
   if ($modalBody.find('.modal-content-to-preserve').length === 0){
   $modalBody.empty();
   }
});


//모달창에서 접수내역 선택시 해당값 input창에 들어감 
$("#modalDialogScrollable .modal-body").on("click", "tr", function(event) {
   let clickedRow = $(this); // 클릭된 행
   let srId = clickedRow.find(".secItem[data-slogid]").data('slogid');
   let srCa = clickedRow.find(".secItem[data-slogca]").data('slogca');
   let srFloor = clickedRow.find(".secItem[data-slogfloor]").data('slogfloor');
   let srCtgr = clickedRow.find(".secItem[data-slogctgr]").data('slogctgr');
   let srTs = clickedRow.find(".secItem[data-slogts]").data('slogts');
   let srMem = clickedRow.find(".secItem[data-slogmem]").data('slogmem');
   let srCt = clickedRow.find(".secItem[data-slogsrct]").data('slogsrct');
   let srPrcCt = clickedRow.find(".secItem[data-slogsrprct]").data('slogsrprct');
  
   console.log("시간:",srTs);
   let truncatedSrTs = srTs.replace("T"," ").slice(0, 16); 
   console.log("자른시간:",truncatedSrTs);
   
   //각 input 요소에 값을 설정
   $('#srIdInput').val(srId);
   $('#floorSelect').val(srFloor);
   $('#zoneSelect').val(srCtgr);
   $('#srTsInput').val(truncatedSrTs);
   $('#srCtInput').val(srCt);
   $('#srPrcCtInput').val(srPrcCt);
   
    //모달 닫기
    $('#modalDialogScrollable').modal('hide');
    
    $('#srIdInput').on('input', function() {
        if ($(this).val() === "") {
           const commValue = "COMM";
           $(slogCaInput).val(commValue);
        }
     });

    
    
    //상태업데이트
    updateslogCa();
    
});


//보안일지 등록
let $insertForm = $(insertForm).on("submit", function(event){	
   event.preventDefault();
   
   
   
   let slogTitle = $("input[name='slogTitle']").val();
   let slogPrcDt = $("input[name='slogPrcDt']").val();
   let slogIssue = $("input[name='slogIssue']").val();
   let floorSelect = $("#floorSelect").val();
   let slogFc = $("select[name='slogFc']").val();
   let slogConfis = $("select[name='slogConfis']").val();
   let slogContent = $("textarea[name='slogContent']").val();
   
   
   if (slogTitle === '' || slogPrcDt === '' || slogIssue ==='' || floorSelect ==='' || slogFc ==='' || slogConfis ==='' || slogContent ==='') {
       Swal.fire({
		  icon: 'warning',
		  text: '모든 필수 입력 필드를 채워주세요.'
		})
       return false; // submit을 막음
   }
   
   
   let settings = {
         url:insertForm.action,
         method:insertForm.method,
         data: JSON.stringify($insertForm.serializeObject()),
         contentType:"application/json;charset=UTF-8",
         dataType:"json"
   };
   $.ajax(settings)
      .done(resp=>{
         if(resp){
            console.log("보안일지 등록 결과값",resp);
            
            Swal.fire({
                icon: 'success',
                text: '보안일지 등록을 성공하였습니다.',
                showLoaderOnConfirm: true, // 동작 중 로더 표시
            })
                
           //리스트출력 함수 
            deptList1(); 
            insertForm.reset();
         }else{
            alert("보안일지 등록 실패");
         }
      });
   deptList1("");
});


//보안일지 필터링(요청/비요청)
$(document).ready(function () {
	
	$('#collapseBody').collapse('hide');
	
$(dept1).on("change", function (event) {
    let dept1Select = $(this).val();
    deptList1(dept1Select);
     });

   //초기화할 때 한 번 호출
   deptList1(""); // 빈 문자열로 초기 호출
});


//전체조회 리스트출력 (필터링한 값 리스트 출력)
function deptList1(dept1Select) {

  function formatDate(dateArray) {
      const year = dateArray[0];
      const month = String(dateArray[1]).padStart(2, '0');
      const day = String(dateArray[2]).padStart(2, '0');
      const hours = String(dateArray[3]).padStart(2, '0');
      const minutes = String(dateArray[4]).padStart(2, '0');
      
      return year + '-' + month + '-' + day + " " + hours + ":" + minutes;
  }
   
    $.getJSON("<c:url value='/safety/securityLog.do'/>", {deptSelect:dept1Select}).done(function(secLogList) {
        let tbody = $("#secLogListBody");
        tbody.empty();

		let secloglist = secLogList.secLogList;
        
		console.log("총개수",secLogList.totalCount);
		console.log("요청개수",secLogList.reqCount);
		console.log("비요청개수",secLogList.nonReqCount);
		
		$(countAll).html(secLogList.totalCount);
		$(countReq).html(secLogList.reqCount);
		$(countNonReq).html(secLogList.nonReqCount);
        
        if (secloglist.length > 0) {
            $.each(secloglist, function (index, secLog) {
                //커스텀 클래스를 추가할 변수 초기화
                let customClass = '';
               
                
                //slogCa 값에 따라 커스텀 클래스 지정
                if (secLog.slogCa == '일반(비요청)') {
                    customClass = 'commstatus';
                } else if (secLog.slogCa == '요청') {
                    customClass = 'reqstatus';
                }
                
                let tr = $("<tr>").append(
                    $("<td>").addClass("text-center").html(secLog.slogId).attr("data-bs-toggle", "modal").attr("data-bs-target", "#largeModal"),
                    $("<td>").addClass("text-center").html(secLog.slogTitle).attr("data-bs-toggle", "modal").attr("data-bs-target", "#largeModal"),
                    $("<td>").addClass("text-center").html(secLog.zone.zoneFloor + "층" + secLog.zone.zoneCtgr).attr("data-bs-toggle", "modal").attr("data-bs-target", "#largeModal"),
                    $("<td>").addClass("text-center").html(formatDate(secLog.slogPrcDt)).attr("data-bs-toggle", "modal").attr("data-bs-target", "#largeModal"),
                    $("<td>").addClass("text-center").html(secLog.slogWriter).attr("data-bs-toggle", "modal").attr("data-bs-target", "#largeModal"),
                    $("<td>").addClass("text-center").append($("<span>").addClass(customClass).html(secLog.slogCa)
                          ).attr("data-bs-toggle", "modal").attr("data-bs-target", "#largeModal"),
                    $("<td>").addClass("text-center").html(
                        $("<button type='button'>")
                            .addClass("btn btn-outline-dark")
                            .addClass("deletebtn")
                            .text("삭제")
                    )
                ).addClass("datatr")
                    .prop("id", secLog.slogId)
                    .data("source", secLog.slogId);
                
                   tr.css("cursor", "pointer");
                  
                tbody.append(tr);
                
    
            });
        } else {
            tbody.append("<tr><td colspan='7'>보안일지 없음.</td></tr>");
        }
    });
}

//검색기능 
$(searchBtn).on("click", function(event){
  //검색어 입력값 가져오기
  let searchWord = $("#searchInput").val();
  //선택된 필터값 가져오기 
  let dept1Value = $("#dept1").val();
  let viewURL = "${pageContext.request.contextPath }/safety/secLogSerch.do";
    let tbody = $("#secLogListBody");
  
  // AJAX 요청 보내기
  $.ajax({
     url: viewURL,
     method: "GET",
     data : {
        searchWord : searchWord,
        searchType : dept1Value
     },
     success: function(data){
        console.log("검색기능 응답데이터",data);
        
        let searchList = data;
        let trTags = null;
     
         if (searchList.length > 0) {
              trTags = [];
              
                   $.each(searchList, function (index, secLog) {
                      
                       //커스텀 클래스를 추가할 변수 초기화
                       let customClass = '';
                       
                       //slogCa 값에 따라 커스텀 클래스 지정
                       if (secLog.slogCa == '일반(비요청)') {
                           customClass = 'commstatus';
                       } else if (secLog.slogCa == '요청') {
                           customClass = 'reqstatus';
                       }
                      
                      let tr = $("<tr>").append(
                          $("<td>").addClass("text-center").html(secLog.slogId).attr("data-bs-toggle", "modal").attr("data-bs-target", "#largeModal"),
                          $("<td>").addClass("text-center").html(secLog.slogTitle).attr("data-bs-toggle", "modal").attr("data-bs-target", "#largeModal"),
                          $("<td>").addClass("text-center").html(secLog.zone.zoneFloor + "층" + secLog.zone.zoneCtgr).attr("data-bs-toggle", "modal").attr("data-bs-target", "#largeModal"),
                          $("<td>").addClass("text-center").html(secLog.slogPrcDt).attr("data-bs-toggle", "modal").attr("data-bs-target", "#largeModal"),
                          $("<td>").addClass("text-center").html(secLog.slogWriter).attr("data-bs-toggle", "modal").attr("data-bs-target", "#largeModal"),
                          $("<td>").addClass("text-center").append($("<span>").addClass(customClass).html(secLog.slogCa)).attr("data-bs-toggle", "modal").attr("data-bs-target", "#largeModal"),
                          $("<td>").addClass("text-center").html(
                                  $("<button type='button'>")
                                      .addClass("btn btn-outline-dark")
                                      .addClass("deletebtn")
                                      .text("삭제")
                       )
                   ).addClass("datatr")
                       .prop("id", secLog.slogId)
                       .data("source", secLog.slogId);
                      tr.css("cursor", "pointer");
                   
              trTags.push(tr);
               });
           } else {
              trTags = "<tr><td colspan='7'>보안일지 없음.</td></tr>";
           }
        tbody.html(trTags); //이렇게 다넣고 tbody에 html 넣어주면 empty() 안해줘도 됌 
     },
     error: function(){
        alert("실패");
     }
  });
});


//보안일지 상세정보 모달로 열기
$(largeModal).on("show.bs.modal", function(event){
 
    const target = event.relatedTarget;
    console.log("상세정보 모달 타겟",target);
    const what = $(target).parent().find(':first').html();
    
   let $modalBody = $(this).find(".modal-body");
   let viewURL = "${pageContext.request.contextPath }/safety/secLogView.do";
   
   let settings = {
           url : viewURL,
           data : { what : what },
           dataType : "html",
           success : function(resp){
              $modalBody.html(resp);
           }
     }
     $.ajax(settings);
     
}).on("hidden.bs.modal", function(event){
   let $modalBody = $(this).find(".modal-body");
   if ($modalBody.find('.modal-content-to-preserve').length === 0){
   $modalBody.empty();
   }
});


//보기버튼 눌렀을때 보안접수 내용 출력
$(document).on("click", "#secReqShow", function(event) {
 //버블링차단
 event.stopPropagation(); 
          
  //클릭된 버튼의 부모 요소인 <td>를 선택
  let tdElement = $(this).closest("td");

  //srId값 가져오기
  let slogSrId = tdElement.data("srid");
  let viewURL = "${pageContext.request.contextPath }/safety/secReqView.do";
  let reqArea = $("#ReqListArea");
  
  function formatDate(dateArray) {
      const year = dateArray[0];
      const month = String(dateArray[1]).padStart(2, '0');
      const day = String(dateArray[2]).padStart(2, '0');
      const hours = String(dateArray[3]).padStart(2, '0');
      const minutes = String(dateArray[4]).padStart(2, '0');
      
      return year + '-' + month + '-' + day + " " + hours + ":" + minutes;
  }
  
  
  
  //버튼을 누를 때마다 테이블이 추가되는 것을 방지
  if (!reqArea.has("table").length) {
     $.ajax({
        url : viewURL,
        method : "GET",
        data : {
           slogSrId : slogSrId
        },
        success: function(data){
           console.log("보안접수내용",data);
           
           let secRecView = data;
           
           if(secRecView){
                 let h5 = $("<h5>").html("보안지원접수 내역");
                 
                 let table = $("<table>").addClass("table table-bordered").css({
                     "margin-top": "10px",
                     "margin-bottom": "10px"
                 });
                 
                 let tbody = $("<tbody>");
                 
                 let tr1 = $("<tr>").append(
                    $("<th>").addClass("table-light thwidth").html("요청ID"),
                    $("<td>").html(secRecView.srId),
                    $("<th>").addClass("table-light thwidth").html("카테고리"),
                    $("<td>").html(secRecView.srCa)
                 );
                 
                 let tr2 = $("<tr>").append(
                     $("<th>").addClass("table-light thwidth").html("위치"),
                     $("<td>").html(secRecView.zone.zoneFloor + "층" + secRecView.zone.zoneCtgr),
                     $("<th>").addClass("table-light thwidth").html("요청일시"),
                     $("<td>").html(formatDate(secRecView.srTs))
                 );
                 
                 let tr3 = $("<tr>").append(
                     $("<th>").addClass("table-light thwidth").html("요청내용"),
                     $("<td>").attr("colspan","3").html(secRecView.srContent)
                 );
                 
                 let tr4 = $("<tr>").append(
                     $("<th>").addClass("table-light thwidth").html("작성자"),
                     $("<td>").html(secRecView.srReqMem),
                     $("<th>").addClass("table-light thwidth").html("접수상태"),
                     $("<td>").html(secRecView.srStatus).addClass("statuscomm btn btn-dark")
                 );
                 
                 tbody.append(tr1,tr2,tr3,tr4);
                 
                 table.append(tbody);
                 
                 reqArea.append(h5,table);
              
                 
              } else {
                 reqArea.html("보안지원접수 없음")
              }
           },
             error: function(xhr, status, error) {
                 console.error(error);
                 alert("실패")
           }
        });
     }
  });
  
  let slogIdValue;
  
  //삭제처리
  $(secLogListBody).on("click", "tr.datatr", function(event){
	  //이벤트전파금지
	  event.stopPropagation();
  }).on("click",".deletebtn",function(event){
	  event.stopPropagation();
	  let slogId = $(this).parents("tr.datatr").data("source");
	  
	  Swal.fire({
			  text: "삭제하시겠습니까?",
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.isConfirmed) {

				  let settings = {
						  url: "<c:url value='/safety/secLogDelete.do'/>",
						  method:"POST",
						  data:{
							  slogId : slogId
						  },
						  dataType :"json"
				  		};
				  
				  $.ajax(settings)
				  		.done(resp=>{
				  			console.log("삭제응답=>",resp);
				  			slogIdValue = resp.slogId;
				  			
				  			if(resp.resp=="OK"){
				  				
				  				$(slogIdValue).remove();
				  				deptList1();
				  				
				  			}else{
				  				alert("보안일지 삭제실패");
				  			}
				  		});
				  
			    Swal.fire(
			      '삭제',
			      '삭제가 완료되었습니다.',
			      'success'
			    )
			  }
			})

  		});
  
  
  // 시연용 등록버튼 값 넣기 
  $("#test").on("click", function(event){
	  
	  // input 불러오기
      let slogTitle = $("#slogTitle");
      let srTsInput = $("#srTsInput");
      let srCtInput = $("#srCtInput");
      let floorSelect = $("#floorSelect");
      let zoneSelect = $("#zoneSelect");
      let slogConfis = $("#slogConfis");
      let srPrcCtInput = $("#srPrcCtInput");
      let slogInh = $("#slogInh");
      
      // value에 넣을 값 지정해주기 
      let slogTitCaValue = '20230910_보안일지';
      let slogPrDtValue = '2023-09-10 02:56';
      let slogIssValue = '가짜 여권을 소지한 승객이 신분 확인 과정에서 발각됨.';
      let floorValue = '2'; 
      let slogFcValue = '2FC'; 
      let slogCfisValue = 'Y';
      let slogCntValue = '모든 출입구에서 신원 확인 절차가 철저히 이행되었습니다. 가짜여권 소지 안전 위반 사항이 있었습니다.'; 
      let slogInhValue = '제한 구역의 출입 통제 절차 검토'; 
      
      // input 요소에 값 설정
      slogTitle.val(slogTitCaValue);
      srTsInput.val(slogPrDtValue);
      srCtInput.val(slogIssValue);
      floorSelect.val(floorValue);
      zoneSelect.val(slogFcValue);
      slogConfis.val(slogCfisValue);
      srPrcCtInput.val(slogCntValue);
      slogInh.val(slogInhValue);
  });
    
</script>
