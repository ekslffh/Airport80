<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal.realUser" var="authMember"/>

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
   /* 부모 요소 */
        .profile-image {
            width: 200px;
            /* 프로필 이미지 요소의 너비 */
            height: 200px;
            /* 프로필 이미지 요소의 높이 */
            position: relative;
            /* 포지션을 상대적으로 설정하여 자식 요소를 포함합니다. */
            overflow: hidden;
            /* 자식 요소가 부모 요소를 벗어나지 않도록 설정합니다. */
            border-radius: 50%;
            /* 원형 모양의 프로필 이미지를 만듭니다. */
        }

        /* 자식 요소 (프로필 이미지) */
        .profile-image img {
            width: 50%;
            /* 이미지를 부모 요소의 50% 크기로 설정합니다. */
            height: 50%;
            /* 이미지를 부모 요소의 50% 크기로 설정합니다. */
            position: absolute;
            /* 포지션을 절대적으로 설정하여 겹치게 합니다. */
            border-radius: 50%;
            /* 원형 모양의 이미지로 만듭니다. */
        }

        /* 각 이미지의 위치 설정 */
        .top-left {
            top: 0;
            left: 0;
        }

        .top-right {
            top: 0;
            right: 0;
        }

        .bottom-left {
            bottom: 0;
            left: 0;
        }

        .bottom-right {
            bottom: 0;
            right: 0;
        }

        .img_wrap {
            width: 56px;
            height: 56px;
            overflow: hidden;
            margin-right: 20px;
        }

        .aimg{
            width: 27px;
            height: 27px;
            border-radius: 3px;
            margin-right: 2px;
             margin-bottom: 2px;
        }
        
        .bimg{
              width: 27px;
            height: 27px;
            border-radius: 3px;
             margin-bottom: 2px;
        }

                
        .cimg{
           width: 27px;
            height: 27px;
            border-radius: 3px;
            margin-right: 2px;
        }

                
        .dimg{
          width: 27px;
            height: 27px;
            border-radius: 3px;
        }

        .aimg img {
            width: 100%;
            height: 100%;
            border-radius: 9px;            
        }

        .bimg img {
            width: 100%;
            height: 100%;
            border-radius: 9px;
        }

        .cimg img {
            width: 100%;
            height: 100%;
            border-radius: 9px; 
        }

        .dimg img {
            width: 100%;
            height: 100%;
            border-radius: 9px;
        }
        

		.message-shortcut {
		 	color: gray;
		}
		
		.chat{
			overflow-y :scroll;
			height :690px;
		}
  </style>
</head>
<body>
<script src="https://bootstrapmade.com/assets/js/demo.js?v=5.0"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

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
	    <div class="d-flex align-items-center">
	        <a href="javascript:;"
	            class="btn modal-button" data-bs-toggle="modal"
	            data-bs-target="#chatRoomFormModal"> 
	            <i class="bi bi-plus-circle table-icon"></i> 
	            <span style="vertical-align: middle;">채팅방 생성</span>
	        </a>
	    </div>
	</div>
<!--     <div class="chat-search pl-3 pr-3"> -->
<!--       <div class="input-group"> -->
<!--         <input type="text" class="form-control" placeholder="Search a conversation"> -->
<!--         <div class="input-group-append prepend-white"> -->
<!--           <span class="input-group-text pl-2 pr-2"> -->
<!--             <i class="fs-17 las la-search drop-shadow"></i> -->
<!--           </span> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
    <div class="chat-user-panel">
      <div class="pb-3 d-flex flex-column navigation-mobile pagination-scrool chat-user-scroll">
      	<c:if test="${empty chatRoomList }">
      		<div>소속된 채팅방이 없습니다.</div>
      	</c:if>   
    	<c:if test="${not empty chatRoomList }">
 			<c:forEach items="${chatRoomList }" var="chatRoom">
 				<c:url value="/chat3.do" var="chatURL">
	               <c:param name="bang_id" value="${chatRoom.chrId }" />
	            </c:url>
	            <!-- 여기에 active 속성 줘야함 -->
 				<div class="chat-item d-flex pl-3 pr-0 pt-3 pb-3" onclick="fn_conn('${chatURL }')">
		          <div class="w-100 d-flex">
		          
		          
		          
		            <div class="pl-0 img_wrap">
            				 <c:choose>
						        <c:when test="${chatRoom.chatRoomMembers.size() == 1}">
										<div class="aimg">
											<img class=""
												src="${pageContext.request.contextPath }/resources/images/emp/${chatRoom.chatRoomMembers[0].employee.fileGroup.detailList[0].fiNm }"
												alt="프로필 이미지 1">
										</div>
						        </c:when>
						        <c:when test="${chatRoom.chatRoomMembers.size() == 2}">
						            <div style="display: flex;">
										<div class="aimg">
											<img class=""
												src="${pageContext.request.contextPath }/resources/images/emp/${chatRoom.chatRoomMembers[0].employee.fileGroup.detailList[0].fiNm }"
												alt="프로필 이미지 1">
										</div>

										<div class="bimg">
											<img class=""
												src="${pageContext.request.contextPath }/resources/images/emp/${chatRoom.chatRoomMembers[1].employee.fileGroup.detailList[0].fiNm }"
												alt="프로필 이미지 2">
										</div>
									</div>
						        </c:when>
						        <c:when test="${chatRoom.chatRoomMembers.size() == 3}">
						            <div style="display: flex;">
										<div class="aimg">
											<img class=""
												src="${pageContext.request.contextPath }/resources/images/emp/${chatRoom.chatRoomMembers[0].employee.fileGroup.detailList[0].fiNm }"
												alt="프로필 이미지 1">
										</div>

										<div class="bimg">
											<img class=""
												src="${pageContext.request.contextPath }/resources/images/emp/${chatRoom.chatRoomMembers[1].employee.fileGroup.detailList[0].fiNm }"
												alt="프로필 이미지 2">
										</div>
									</div>
									<div style="display: flex;">
										<div class="cimg">
											<img class=""
												src="${pageContext.request.contextPath }/resources/images/emp/${chatRoom.chatRoomMembers[2].employee.fileGroup.detailList[0].fiNm }"
												alt="프로필 이미지 3">
										</div>
									</div>
						        </c:when>
						        <c:otherwise>
									<div style="display: flex;">
										<div class="aimg">
											<img class=""
												src="${pageContext.request.contextPath }/resources/images/emp/${chatRoom.chatRoomMembers[0].employee.fileGroup.detailList[0].fiNm }"
												alt="프로필 이미지 1">
										</div>

										<div class="bimg">
											<img class=""
												src="${pageContext.request.contextPath }/resources/images/emp/${chatRoom.chatRoomMembers[1].employee.fileGroup.detailList[0].fiNm }"
												alt="프로필 이미지 2">
										</div>
									</div>
									<div style="display: flex;">
										<div class="cimg">
											<img class=""
												src="${pageContext.request.contextPath }/resources/images/emp/${chatRoom.chatRoomMembers[2].employee.fileGroup.detailList[0].fiNm }"
												alt="프로필 이미지 3">
										</div>

										<div class="dimg">
											<img class=""
												src="${pageContext.request.contextPath }/resources/images/emp/${chatRoom.chatRoomMembers[3].employee.fileGroup.detailList[0].fiNm }"
												alt="프로필 이미지 4">
										</div>
									</div>
								</c:otherwise>
						    </c:choose>
							<%-- 		              <img class="rounded-circle shadow avatar-sm mr-3" src="${pageContext.request.contextPath }/resources/images/emp/${chatRoom.chatRoomMembers[0].employee.fileGroup.detailList[0].fiNm }"> --%>
		            </div>
		            
		            
		            <div>
						<!-- 채팅방제목영역 -->
		                <p class="margin-auto fw-400 text-dark-75 fs-15"><span class="fs-17" style="font-weight: bold;">${chatRoom.chrNm }</span> ${chatRoom.chatRoomMembers.size() }</p>
		                <div class="d-flex flex-row mt-1">
		                  <span class="message-shortcut margin-auto fw-400 fs-14 ml-1 mr-4">
		                  	 <c:if test="${empty msgMap[chatRoom.chrId] }">
						           채팅내용 없음.
						      </c:if> 
						      <c:if test="${not empty msgMap[chatRoom.chrId] }">
								<td>
									${msgMap[chatRoom.chrId].crmContent }
								</td>
						      </c:if>   
		                  </span>
		                </div>
		            </div>
		            
		            
		          </div>
		          <div class="flex-shrink-0 margin-auto pl-2 pr-3">
		            <div class="d-flex flex-column">
		              <p class="text-muted text-right fs-13 mb-2">${msgMap[chatRoom.chrId].crmCrtTs }</p>
		              <span class="round badge badge-light-success margin-auto">${unRdMap[chatRoom.chrId] }</span>
		            </div>
		          </div>
		        </div>
    		</c:forEach>
      	</c:if>
      </div>
    </div>
  </div>
  
  <!-- Modal -->
<div class="modal fade" data-url="${viewURL }" id="chatRoomFormModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
<!--       <div class="modal-header"> -->
<!--         <h1 class="modal-title fs-5" id="exampleModalLabel">채팅방 생성</h1> -->
<!--         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!--       </div> -->
      <div class="modal-body">
        <table class="table table-bordered">
           <tr>
              <th>이름</th>
              <td><input name="chrNm" class="form-control" /></td>
           </tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-primary" onclick="fn_makeRoom()">생성</button>
        <button type="button" class="btn btn-sm btn-warning" data-bs-dismiss="modal">닫기</button>
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
     
    var socket = null;
 	$(document).ready(function(){
 	var socket = new SockJS("<c:url value='/alarm'/>");
 	console.log("chatList 연결됨", socket);
 	socket.onmessage = onMessage;
 	});
 	
 	function onMessage(evt) {
 		console.log("evt : ", evt);
 		var json = evt.data;
 		var obj = JSON.parse(json);
//  		alert(obj.msg);
 		if (obj.type == "chat") {
 			location.href = "";
 		}
 	}
 	
 	function fn_makeRoom() {
 	   const chrNm = $("input[name=chrNm]").val();
 	   if (chrNm == "") {
//  		   alert("채팅방명을 입력해주세요.");

			Swal.fire({
			  icon: 'warning',
			  title: '입력오류',
			  text: '채팅방명을 입력해주세요.'
// 			  footer: '<a href="">Why do I have this issue?</a>'
			})
			return;
	      
// 	      Swal.fire({
// 				  icon: 'info',
// 				  title: response.result,
// 				  showConfirmButton: false,
// 				  timer: 1500
// 				})
 	   }
 	   const chrEmp = ${authMember.empNo }
 	   console.log(chrEmp)
 	   // FormData 객체 생성
 	   const data = {};
 	   data.chrNm = chrNm;
 	   data.chrEmp = chrEmp;
 	   
 	   let settings = {
 	      url : "${pageContext.request.contextPath }/chat/roominsert.do",
 	      method : "post",
 	      data : data,
 	      dataType : "json",
 	      success : function(resp) {
 	         if (resp.result === 'success') {
 	        	Swal.fire({
	        		  icon: 'success',
	        		  title: '성공',
	        		  text: '채팅방 생성에 성공하였습니다.',
// 	        		  footer: '<aㅊ href="">Why do I have this issue?</a>'
	        		})
 	            location.href = "";
 	         } else {
 	        	Swal.fire({
 	        		  icon: 'error',
 	        		  title: '오류',
 	        		  text: '채팅방 생성에 실패하였습니다.',
 	        		  footer: '<aㅊ href="">Why do I have this issue?</a>'
 	        		})
 	         }
 	         
 	      },
 	      error : function(jqXHR, status, error) {
 	         console.log(jqXHR);
 	         console.log(status);
 	         console.log(error);
 	      } //request line,header,body -> response processing
 	   };
 	
 	   $.ajax(settings);
 	}
 	
 	function fn_conn(url) {
 		console.log(url)
 		$(this).addClass('active');
 		var width = 400;
     	var height = 705;
     	
 	  	// 화면 가운데 위치 계산
 	    var left = (window.innerWidth - width) / 2;
 	    var top = (window.innerHeight - height) / 2;
 	    
 		window.open(url, "_blank", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
 		
 	    // 새 창에서 부모 창을 새로 고칩니다.
 	    window.opener.location.reload();
 	    location.href = "";
 	}
  </script>
</body>
</html>