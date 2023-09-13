<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal.realUser" var="authMember"/>
<c:url value="/chat/roominsert.do" var="insertURL" />    
    
<!DOCTYPE HTML>
<html lang="en">
<head>
  <title>Messenger</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chat/chatMain.css"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"/>
  <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css"/>
<style type="text/css">
/* 스크롤이 필요한 요소에 적용할 스타일 */
.scrollable-div {
	max-height: 1000px; /* 최대 높이를 설정 (스크롤이 나타날 높이) */
	overflow-y: auto; /* 세로 스크롤 활성화 */
	border: 1px solid #ccc; /* 스크롤 요소 주변에 경계선 추가 (선택사항) */
	padding: 10px; /* 내용 주변 여백 (선택사항) */
}
</style>
</head>
<body>
  <div class="main-wrapper">
    <div class="container">
      <div class="page-content">
        <div class="container mt-5">
          <div class="row">
            <div class="col-md-4 col-12 card-stacked">
              <div class="card shadow-line mb-3 chat">
                <div class="chat-user-detail">
                  <div class="p-3 chat-header">
                    <div class="w-100">
                      <div class="d-flex pl-0">
                        <div class="d-flex flex-row mt-1 mb-1">
                          <span class="margin-auto mr-2">
                            <a href="#" class="user-undetail-trigger btn btn-sm btn-icon btn-light active text-dark ml-2">
                              <svg viewBox="0 0 24 24" width="18" height="18" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="feather">
                                <polyline points="15 18 9 12 15 6"></polyline>
                              </svg>
                            </a>
                          </span>
                          <p class="margin-auto fw-400 text-dark-75">Profile</p>
                        </div>
                        <div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="p-3 chat-user-info">
                    <div class="card-body text-center">
                      <a href="#!">
                        <img src="https://user-images.githubusercontent.com/35243461/168796876-2e363a49-b32c-4218-b5a3-ce12493af69e.jpg" class="rounded-circle img-fluid shadow avatar-xxl">
                      </a>
                      <div class="pt-4 text-center animate4">
                        <h6 class="fw-300 mb-1">Quan Albert</h6>
                        <p class="text-muted">Web Developer</p>
                        <div class="mt-4">
                          <a href="#" class="btn btn-light-skype btn-icon btn-circle btn-sm btn-shadow mr-2"><i class="bx bxl-skype"></i></a>
                          <a href="#" class="btn btn-light-facebook btn-icon btn-circle btn-sm btn-shadow mr-2"><i class="bx bxl-facebook"></i></a>
                          <a href="#" class="btn btn-light-twitter btn-icon btn-circle btn-sm btn-shadow mr-2"><i class="bx bxl-twitter"></i></a>
                          <a href="#" class="btn btn-light-instagram btn-icon btn-circle btn-sm btn-shadow mr-2"><i class="bx bxl-instagram"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="p-3 chat-header">
                  <div class="d-flex">
                    <div class="w-100 d-flex pl-0">
                      <img class="user-detail-trigger rounded-circle shadow avatar-sm mr-3 chat-profile-picture" src="https://user-images.githubusercontent.com/35243461/168796876-2e363a49-b32c-4218-b5a3-ce12493af69e.jpg" />
                    </div>
                    <div class="flex-shrink-0 margin-auto">
                      <a href="#" class="btn btn-sm btn-icon btn-light active text-dark ml-2">
                        <svg viewBox="0 0 24 24" width="15" height="15" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="feather">
                          <rect x="2" y="7" width="20" height="15" rx="2" ry="2"></rect>
                          <polyline points="17 2 12 7 7 2"></polyline>
                        </svg>
                      </a>
                      <a href="#" class="btn btn-sm btn-icon btn-light active text-dark ml-2">
                        <svg viewBox="0 0 24 24" width="15" height="15" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="feather">
                          <path d="M12 20h9"></path>
                          <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                        </svg>
                      </a>
                      <a href="#" class="btn btn-sm btn-icon btn-light active text-dark ml-2">
                        <svg viewBox="0 0 24 24" width="15" height="15" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="feather">
                          <circle cx="12" cy="12" r="1"></circle>
                          <circle cx="12" cy="5" r="1"></circle>
                          <circle cx="12" cy="19" r="1"></circle>
                        </svg>
                      </a>
                    </div>
                  </div>
                </div>
                <div class="chat-search pl-3 pr-3">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search a conversation">
                    <div class="input-group-append prepend-white">
                      <span class="input-group-text pl-2 pr-2">
                        <i class="fs-17 las la-search drop-shadow"></i>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="archived-messages d-flex p-3">
                  <div class="w-100">
                    <div class="d-flex pl-0">
                      <div class="d-flex flex-row mt-1">
                        <span class="margin-auto mr-2">
                          <div class="svg15 archived"></div>
                        </span>
                        <p class="margin-auto fw-400 text-dark-75">Archived</p>
                      </div>
                      <div>
                      </div>
                    </div>
                  </div>
                </div>
                
                <div id="chatListDIV" class="scrollable-div"></div>
                <!-- 채팅방 목록까지 (chatRoomDIV) -->
                
              </div>
            </div>
            
            <div class="col-md-8 col-12 card-stacked">
              <div class="card shadow-line mb-3 chat chat-panel">
              
              <div id="chatRoomDIV" class="scrollable-div"></div>
              <!-- 채팅방 메시지 가져오기 -->
              
                <div class="chat-search pl-3 pr-3">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Write a message">
                    <div class="input-group-append prepend-white">
                      <span class="input-group-text pl-2 pr-2">
                        <i class="chat-upload-trigger fs-19 bi bi-file-earmark-plus ml-2 mr-2"></i>
                        <i class="fs-19 bi bi-emoji-smile ml-2 mr-2"></i>
                        <i class="fs-19 bi bi-camera ml-2 mr-2"></i>
                        <i class="fs-19 bi bi-cursor ml-2 mr-2"></i>
                        <div class="chat-upload">
                          <div class="d-flex flex-column">
                            <div class="p-2">
                              <button type="button" class="btn btn-secondary btn-md btn-icon btn-circle btn-blushing">
                                <i class="fs-15 bi bi-camera"></i>
                              </button>
                            </div>
                            <div class="p-2">
                              <button type="button" class="btn btn-success btn-md btn-icon btn-circle btn-blushing">
                                <i class="fs-15 bi bi-file-earmark-plus"></i>
                              </button>
                            </div>
                            <div class="p-2">
                              <button type="button" class="btn btn-warning btn-md btn-icon btn-circle btn-blushing">
                                <i class="fs-15 bi bi-person"></i>
                              </button>
                            </div>
                            <div class="p-2">
                              <button type="button" class="btn btn-danger btn-md btn-icon btn-circle btn-blushing">
                                <i class="fs-15 bi bi-card-image"></i>
                              </button>
                            </div>
                          </div>
                        </div>
                      </span>
                    </div>
                  </div>
                </div>
                
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.6.7/js/min/perfect-scrollbar.jquery.min.js"></script>
  <script>
     (function($) {
      "use strict";
      $('.scrollable-chat-panel').perfectScrollbar();
      var position = $(".chat-search").last().position().top;
      $('.scrollable-chat-panel').scrollTop(position);
      $('.scrollable-chat-panel').perfectScrollbar('update');
      $('.pagination-scrool').perfectScrollbar();

      $('.chat-upload-trigger').on('click', function(e) {
        $(this).parent().find('.chat-upload').toggleClass("active");
      });
      $('.user-detail-trigger').on('click', function(e) {
        $(this).closest('.chat').find('.chat-user-detail').toggleClass("active");
      });
      $('.user-undetail-trigger').on('click', function(e) {
        $(this).closest('.chat').find('.chat-user-detail').toggleClass("active");
      });
    })(jQuery); 
     
    function getChatList() {
    	let settings = {
   			url : "${pageContext.request.contextPath }/chat/roomlist3.do",
   			method : "GET",
   			dataType : "html",
   			success : function(resp) {
			// console.log(resp);
   				$(chatListDIV).html(resp);
   			},
   			error : function(jqXHR, status, error) {
   				console.log(jqXHR);
   				console.log(status);
   				console.log(error);
   			} //request line,header,body -> response processing
   		};

   		$.ajax(settings);
    }
    
    function getChatRoom(data) {
    	let settings = {
  			url : "${pageContext.request.contextPath }/chat3.do",
  			method : "GET",
  			data : data,
  			dataType : "html",
  			success : function(resp) {
  				console.log(resp);
  				$(chatRoomDIV).html(resp);
  			},
  			error : function(jqXHR, status, error) {
  				console.log(jqXHR);
  				console.log(status);
  				console.log(error);
  			} //request line,header,body -> response processing
  		};

  		$.ajax(settings);
    }
     
    $(document).ready(function() {
		// 채팅방목록 가져오기
    	getChatList();
		
		var data = {};
		data['bang_id'] = '4b286e91-c77d-4455-a84b-689495433a13';

		// 특정 채팅정보 가져오기
		getChatRoom(data);
    });
  </script>
</body>
</html>