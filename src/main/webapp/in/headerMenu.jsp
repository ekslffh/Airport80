<%@page import="kr.or.ddit.common.chat.dao.ChatRoomMsgDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div class="d-flex align-items-center justify-content-between">
	<a href="/Airport80/in" class="logo d-flex align-items-center"> <img src="${pageContext.request.contextPath}/resources/in/assets/img/airportLogo2.png" alt="">
		<div style="margin-top: 5px;">
			<span style="display: block;">Airport:80</span> <span style="font-size: 12px; display: block; font-weight: 100; text-align: center;">airport Operations</span>
		</div>
	</a> <i class="bi bi-list toggle-sidebar-btn"></i>
</div>
<!-- End Logo -->

<nav class="header-nav">
	<ul class="d-flex align-items-center">
		<div class="flexbx">

			<li class="nav-item d-block d-lg-none"><a class="nav-link nav-icon search-bar-toggle " href="#"> <i class="bi bi-search"></i>
			</a></li>
			<!-- End Search Icon-->

			<li class="nav-item dropdown">
				<a class="nav-link nav-icon" href="/Airport80/hr/empbrd/empbrdList.do" > 
				<i class="bi bi-card-text"></i> 게시판
				</a>
			</li>
			
<!-- 				<div class="dropdown-menu"> -->
<!-- 					<a class="dropdown-item" href="/Airport80/operate/custNoticeBrd/cnbList.do">공지 게시판</a>  -->
<!-- 					<a class="dropdown-item" href="/Airport80/hr/empbrd/empbrdList.do">사내 게시판</a> -->
<!-- 				</div> End Notification Icon</li> -->
			<!-- 게시판 Nav -->
			
			<li class="nav-item dropdown"><a class="nav-link nav-icon" href="/Airport80/common/calender/scheduleList.do"> <i class="bi bi-calendar3"></i> 일정
			</a> <!-- End Notification Icon --></li>
			<!-- 캘린더 Nav -->

			<li class="nav-item dropdown"><a class="nav-link nav-icon" href="#" onclick="openPopup2()"> <i class="bi bi-chat-text"></i> <span id="msgNum"
					class="badge bg-danger badge-number"
				></span>메세지
			</a></li>
			
			<li class="nav-item dropdown"><a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown"> <i class="bi bi-envelope"></i> <span
					class="badge bg-primary badge-number"
				></span> <span>메일</span>
			</a>
				<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
					<li class="notification-item"><i class="bi bi-app text-primary"></i>
						<div>
							<h4>
								<a href="${pageContext.request.contextPath}/account/mail/send.do"> 메일 작성 </a>
							</h4>
						</div></li>
					<li class="notification-item"><i class="bi bi-app text-primary"></i>
						<div>
							<h4>
								<a href="${pageContext.request.contextPath}/account/mail/inbox.do"> 받은 메일함 </a>
							</h4>
						</div></li>
					<li class="notification-item"><i class="bi bi-app text-primary"></i>
						<div>
							<h4>
								<a href="${pageContext.request.contextPath}/account/mail/outbox.do"> 보낸 메일함 </a>
							</h4>
						</div></li>
					<li class="notification-item"><i class="bi bi-app text-primary"></i>
						<div>
							<h4>
								<a href="${pageContext.request.contextPath}/account/mail/deletebox.do"> 휴지통 </a>
							</h4>
						</div></li>
				</ul>
			</li>

			<li class="nav-item dropdown"><a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown"> <i class="bi bi-files"></i> 서비스
			</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="/Airport80/hr/parking/eplInsert.do">주차장</a>
					<a class="dropdown-item" href="/Airport80/infra/ConvFacilityList.do">편의시설</a>
				</div>
			</li>

			<li class="nav-item dropdown"><a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown"> <i class="bi bi-clipboard-check"></i> 요청
			</a> <!-- End Notification Icon -->

				<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">

					<li class="notification-item"><i class="bi bi-back text-primary"></i>
						<div>
							<h4>
								<a href="#" onclick="openRncPopup()">수리/청소요청</a>
							</h4>
						</div></li>

					<li class="notification-item"><i class="bi bi-app text-primary"></i>
						<div>
							<iframe name="resultFrame" style="display: none;"></iframe>
							<h4>
								<a href="${pageContext.request.contextPath}/accounting/budgetrequest/BudgetReqList.do"> 추가예산신청 </a>
							</h4>
						</div></li>

					<li class="notification-item"><i class="bi bi-app text-primary"></i>
						<div>
							<iframe name="resultFrame" style="display: none;"></iframe>
							<h4>
								<a href="${pageContext.request.contextPath}/accounting/history/list.do"> 회계내역 </a>
							</h4>
						</div></li>

					<li class="notification-item"><i class="bi bi-back text-primary"></i>
						<div>
							<h4>
								<a href="#" onclick="openSecReqPopup()">보안지원요청</a>
							</h4>
						</div></li>

					<li class="notification-item"><i class="bi bi-app text-primary"></i>
						<div>
							<iframe name="resultFrame" style="display: none;"></iframe>
							<h4>
								<a href="${pageContext.request.contextPath}/common/requestList.do"> 요청목록조회 </a>
							</h4>
						</div>
					</li>
				</ul> <!-- 요청 Nav -->
			
		</div>
		<security:authentication property="principal.realUser" var="authMember" />

		<div>
			<p><%@ include file="/WEB-INF/views/weather.html"%></p>
		</div>

		<div class="flexbx">


			<li class="nav-item dropdown pe-3"><a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown"> <img
					src="${pageContext.request.contextPath }/resources/images/emp/${authMember.fileGroup.detailList[0].fiNm}" class="rounded-circle" class="rounded-circle"
				> <span class="d-none d-md-block dropdown-toggle ps-2">${authMember.empNm }</span>
			</a> <!-- End Profile Iamge Icon -->
				<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
					<li class="dropdown-header">
						<h6>${authMember.empNm }</h6> <span>${authMember.empEmail }@${authMember.empEmailDo }</span>
					</li>
					<li>
						<hr class="dropdown-divider">
					</li>

					<li><a class="dropdown-item d-flex align-items-center" href="javascript:;" data-bs-toggle="modal" data-bs-target="#mypage" data-source="${authMember.empNo }">
							<i class="bi bi-person"></i> <span>내정보</span>
					</a></li>
					<li>
						<hr class="dropdown-divider">
					</li>



					<li>
	                   <a class="dropdown-item d-flex align-items-center" 
	                   href="javascript:;" data-bs-toggle="modal"
	                   data-bs-target="#vacreq" data-what="${authMember.empNo }">
	                   <i class="bi bi-stars"></i>
	                      <span>휴가</span>
	                   </a>
	                </li>
	                <li>
	                   <hr class="dropdown-divider">
	                </li>

					<li><a id="logoutBtn" class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath }/login/logout"> <i class="bi bi-box-arrow-right"></i> <span>로그아웃</span>
					</a></li>

				</ul>
		</div>
	</ul>
</nav>

<!-- 토스트를 이용한 채팅 메시지 띄우기 -->
<div class="position-fixed top-0 end-0 p-3" style="z-index: 11">
	<div id="liveToast" class="toast bg-warning-subtle" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="5000" onclick="fn_conn()">
		<div class="toast-header">
			<strong class="me-auto">메세지알림</strong> <small id="send-time"></small>
			<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
		<div class="toast-body"></div>
	</div>
</div>

<!-- 토스트를 이용한 보안알림 띄우기 -->
<div class="position-fixed top-0 start-50 translate-middle-x" style="z-index: 11">
	<div id="securityToast" class="toast bg-body-secondary text-danger" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="5000"
		onclick="fn_secReqList()"
	>
		<div class="toast-header">
			<strong class="me-auto">보안요청</strong> <small id="send-time"></small>
			<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
		<div class="toast-body"></div>
	</div>
</div>

<!-- 토스트를 이용한 수리알림 띄우기 -->
<div class="position-fixed top-0 start-50 translate-middle-x" style="z-index: 11">
	<div id="repairToast" class="toast bg-warning" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="5000">
		<div class="toast-header">
			<strong class="me-auto">수리요청</strong> <small id="send-time"></small>
			<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
		<div class="toast-body"></div>
	</div>
</div>

<c:url value="/hr/emp/ajax/empMypage.do?what=${authMember.empNo }" var="viewURL" />
<!--마이페이지 모달  -->
<div class="modal fade" data-url="${viewURL}" id="mypage" tabindex="-1" data-bs-backdrop="false">
	<div class="modal-dialog mypageModal">
		<div class="modal-content" style="width: 800px;">
			<div class="modal-header">
				<h5 class="modal-title"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">...</div>

		</div>
	</div>
</div>


<!-- 휴가 신청 모달 띄우기  -->
<c:url value="/hr/vacation/vacationForm.do" var="viewURL" />
<div class="modal fade" data-url="${viewURL}" id="vacreq" tabindex="-1"
   data-bs-backdrop="false">
   <div class="modal-dialog" style="top: 50px; left: 50px;">
      <div class="modal-content" style="width:500px;" >
         <div class="modal-header">
            <h5 class="modal-title">휴가 신청</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
            
        </div>
      </div>
   </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
// 웹소켓 전역변수 설정
var socket  = null; 

// 로그인한 멤버 기준으로 전체채팅방에 대해서 안읽은 메시지 개수 가져오고 보여주기
function showMsgCnt() {
	let settings = {
			url : "${pageContext.request.contextPath}/chat/countMsg",
			method : "get",
			dataType : "json",
			success : function(resp) {
				// 안읽은 메시지가 없으면 그냥 비워두기
				if (resp.totalCnt == 0) {
					$("#msgNum").text("");	
				} else { // 있으면 안읽은 메시지 개수 표시해주기
					$("#msgNum").text(resp.totalCnt);
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			} 
		};
	$.ajax(settings);
}

//페이지 로드 되었을 때 실행해야 하는 로직
$(document).ready(function(){
	// 메시지 개수 첫 초기화
	showMsgCnt(); 
	
	// 웹소켓 연결
	socket = new SockJS("<c:url value='/alarm'/>");
	
	// 데이터를 전달 받았을때 처리하는 방식 
	socket.onmessage = onMessage; 
	
	// 소켓이 닫혔을 때 다시 연결하는 이벤트 핸들러 등록
//     socket.onclose = function(event) {
//         console.log("WebSocket closed. Reconnecting...");
//         // 다른 창에서의 onclose를 막기 위해 onclose를 무시하고 재정의
//         socket.onclose = function() {};

//         // 새로운 소켓을 생성하여 연결 시도
//         socket = new SockJS("<c:url value='/alarm'/>");
//         socket.onmessage = onMessage;
//         socket.onclose = this.onclose; // 다시 연결할 때도 onclose 이벤트 핸들러 유지
//     };
});

// 보안요청 보내는 함수
function fn_security_req() {
	console.log("보안요청");
	var msgData = {
			type : "SECURITY_REQ",
			msg : "보안요청이 도착했습니다."
		};
	var jsonData = JSON.stringify(msgData);
	socket.send(jsonData);
}

// 수리요청 보내는 함수
function fn_repair_req() {
	console.log("수리요청");
	var msgData = {
			type : "REPAIR_REQ",
			msg : "수리요청이 도착했습니다."
		};
	var jsonData = JSON.stringify(msgData);
	socket.send(jsonData);
}

function formatDate(dateArray) {
    const year = dateArray[0];
    const month = String(dateArray[1]).padStart(2, '0');
    const day = String(dateArray[2]).padStart(2, '0');
    const hours = String(dateArray[3]).padStart(2, '0');
    const minutes = String(dateArray[4]).padStart(2, '0');
    
    return year + '-' + month + '-' + day + " " + hours + ":" + minutes;
}

// $(document).ready(function(){
// toast생성 및 추가
function onMessage(evt) {
	console.log("evt : ", evt);
	var json = evt.data;
	var obj = JSON.parse(json);
	if (obj.type == "security") {
		// 보안요청일 때 보안요청 페이지에 있다면 실시간으로 요청목록 자동갱신필요
		var currentPageUrl = window.location.href; // 현재 페이지의 URL 정보
		console.log("currentPageUrl", currentPageUrl);
	
// 		if (currentPageUrl === "http://www.airport80.co.kr/Airport80/safety/maincontroll.do") {
// 		    console.log("여기다!!!!!!!!!!!!!!!!!!!")

// 			location.href = "";
// 			 }
	    // 현재 페이지와 웹소켓으로 받은 데이터의 페이지 URL이 일치할 경우 특별한 처리를 수행
		
	  
		var toastElement = document.getElementById('securityToast');
		var toast = new bootstrap.Toast(toastElement);
		$(".toast-body").text(obj.msg);
		$("#send-time").text(obj.sendTime);
	  	toast.show();
	} else if (obj.type == "repair") {
		var toastElement = document.getElementById('repairToast');
		var toast = new bootstrap.Toast(toastElement);
		$(".toast-body").text(obj.msg);
		$("#send-time").text(obj.sendTime);
	  	toast.show();
	} else { // chat
		// 만약에 본인이 띄운 메시지라면 헤더에서 메시지 안뜸
		if (obj.sender == ${authMember.empNo }) return;	
		showMsgCnt();
		const bang_id = obj.bang_id;
		var toastElement = document.getElementById('liveToast');
		toastElement.dataset.bang = bang_id;
		var toast = new bootstrap.Toast(toastElement);
		$(".toast-body").text(obj.msg);
		$("#send-time").text(obj.sendTime);
	  	toast.show();
	}
}

// 채팅목록 팝업창 오픈
function openPopup() {
	var url = "${pageContext.request.contextPath}/chat/roomlist.do";
	var popupWindow = window.open(url, "ChatPopup", "width=600,height=1000");
	// 현재 웹소켓 팝업창에도 전달해서 공유해서 사용
	popupWindow.socket = socket;
}

// 채팅목록 팝업창 오픈
function openPopup2() {
	var width = 400;
	var height = 640;
	
  	// 화면 가운데 위치 계산
    var left = (window.innerWidth - width) / 2;
    var top = (window.innerHeight - height) / 2;
    
    var url = "${pageContext.request.contextPath}/chat/roomlist3.do";
	window.open(url, "_blank", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
}

// 채팅방 팝업창 오픈
function fn_conn() {
	const bang_id = document.getElementById('liveToast').dataset.bang;
	const url = "${pageContext.request.contextPath}/chat3.do?bang_id=" + bang_id;
  	var popupWindow = window.open(url, url, "ChatPopup", "width=600,height=1000");
    // 팝업 창에서 소켓 객체를 공유하기 위해 넘김
    popupWindow.socket = socket;
}



// 보안지원 요청 팝업창 오픈
function openSecReqPopup() {
	
	var popupWidth = 590; // 팝업 창의 너비
	var popupHeight = 390; // 팝업 창의 높이
	var left = (window.screen.width - popupWidth) / 2;
	var top = (window.screen.height - popupHeight) / 2;
	var url = "${pageContext.request.contextPath}/safety/secReqInsert.do";
	
	var popupWindow = window.open(url, "보안지원요청", "width=" + popupWidth + ", height=" + popupHeight + ", top=" + top + ", left=" + left);

	// 현재 웹소켓 팝업창에도 전달해서 공유해서 사용
	popupWindow.socket = socket;
}

// 청소 수리 요청 팝업창 오픈
function openRncPopup(){

	var popupWidth = 650; // 팝업 창의 너비
	var popupHeight = 500; // 팝업 창의 높이
	var left = (window.screen.width - popupWidth) / 2;
	var top = (window.screen.height - popupHeight) / 2;
	var url = "${pageContext.request.contextPath}/infra/rncInsert.do";

	var popupWindow = window.open(url, "청소수리요청", "width=" + popupWidth + ", height=" + popupHeight + ", top=" + top + ", left=" + left);
}



// 보안지원에 대한 토스트 클릭시에 보안지원 리스트로 이동하기
function fn_secReqList() {
	location.href = "${pageContext.request.contextPath}/safety/maincontroll.do";
}


//     console.log( "ready!" );
//     console.log("개똥이");
    
//     if(sessionStorage.getItem("gubun")==1){
// 	    //미등록
// 	 	$("#pills-x-tab").click();
	    
	    
	    
// 	}else if(sessionStorage.getItem("gubun")==2){
// 	    //반려
// 	 	$("#pills-x-tab").click();
// 	}else if(sessionStorage.getItem("gubun")==3){
// 	    //전체조회
// 		$("#pills-profile-tab").click();
// 	}

//     $(".nav-link").on("click",function(){
//     	console.log("gubun : " + $(this).data("gubun"));
    	
//     	sessionStorage.setItem("gubun",$(this).data("gubun"));
    	
//     });
    
   
    $(mypage).on("show.bs.modal", function(event) {
        
    	console.log('modal.....');
    	
    	let empNo = event.relatedTarget.dataset['source'];


        let $modalBody = $(this).find(".modal-body");
        let viewURL = this.dataset['url'];
        if (empNo) {
           let settings = {
              url : viewURL,
              dataType : "html",
              data : {
                 empNo : empNo
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
    
// });

</script>


<!-- 휴가 모달창 스크립트 -->
<script>
$(vacreq).on("show.bs.modal", function(event) {
    
   console.log('modal.....');
   
   let empNo = event.relatedTarget.dataset['what'];

   let $modalBody = $(this).find(".modal-body");
    let viewURL = this.dataset['url'];
    if (empNo) {
       let settings = {
          url : viewURL,
          dataType : "html",
          data : {
             empNo : empNo
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
 
</script>

<script>
document.addEventListener("DOMContentLoaded", function() {
   const modal = document.getElementById("mypage");
   const modalDialog = modal.querySelector(".mypageModal");
   modal.addEventListener("click", function(event) {
      if (event.target === modal) {
         closeModal();
      }
   });

   function closeModal() {
      modal.style.display = "none";
   }
});

   
// JavaScript 코드 (예: logout.js)
document.addEventListener('DOMContentLoaded', function () {
	var logoutButton = document.getElementById('logoutBtn');
       
	if (logoutButton) {
		logoutButton.addEventListener('click', function () {
			// 로컬 스토리지 데이터를 모두 삭제
			localStorage.clear();
		});
	}
});
</script>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const autoFillButton = document.getElementById("autoFillButton");

    $(document).on("click", "#autoFillButton", function() {
    	 const vrStartTsInput = document.querySelector('input[name="vrStartTs"]');
         const vrEndTsInput = document.querySelector('input[name="vrEndTs"]');
         const vrTypeInput = document.querySelector('select[name="vrType"]');
         const vrRsnInput = document.querySelector('input[name="vrRsn"]');

         // 각 필드에 값을 설정
         vrStartTsInput.value = "2023-09-19";
         vrEndTsInput.value = "2023-09-25";
         vrTypeInput.value = "AL";
         vrRsnInput.value = "힐링이 절실하게 필요합니다.";
    });
});
</script>

