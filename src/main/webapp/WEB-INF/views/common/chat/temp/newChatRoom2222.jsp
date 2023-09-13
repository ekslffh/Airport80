<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal.realUser" var="authMember"/>

<!DOCTYPE HTML>
<html lang="en">
<head>
    <title>Messenger</title>
    <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
		crossorigin="anonymous">
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" />
  	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chat/chatMain.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" />
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css" />
</head>
<style>
/* 스크롤 가능한 div 스타일 */
/* #chat { */
/*   max-height: 1000px; /* 스크롤 가능한 영역의 최대 높이를 설정합니다. */ */
/*   overflow-y: auto; /* 세로 스크롤이 필요할 때만 스크롤을 표시합니다. */ */
/* } */
</style>
<body>
<script type="text/javascript">
	const urlParams = new URL(location.href).searchParams;
	const bang_id = urlParams.get('bang_id');

	console.log("bang_id", bang_id);
	//웹소켓 연결하기
	var webSocket = {
			init : function(param) {
				this._initSocket();
			},
			sendChat : function() {
				console.log("보낼게유")
				this._sendMessage('CHAT_REQ', '${param.bang_id}', $('#inputMsg').val());
				$('#inputMsg').val('');
			},
			/* sendEnter : function() {
				this._sendMessage('${param.bang_id}', 'CMD_ENTER', $('#message').val());
				$('#message').val('');
			}, */
			receiveMessage : function(msgData) {
				console.log("bang_id:", msgData.bang_id);
				if (msgData.bang_id != bang_id) {
					console.log("방아이디 달라서 안들어옴!", msgData.msg)
					return;
				}
				
				let newDiv;
// 				= $('<li>').append(
// 					$('<div>').append(
// 						$('<h3>').text(msgData.sendTime),
// 						$('<h2>').text(msgData.senderName),
// 						$('<span>').addClass("status blue")
// 					).addClass("entete"),
// 					$('<div>').addClass("triangle"),
// 					$('<div>').text(msgData.msg).addClass("message"),
// 				);

				if (msgData.sender == "${authMember.empNo}") {
// 				    newDiv = $('<div>').append(
// 				        $('<div>').append(
// 				            $('<div>').append(
// 				                $('<div>').append(
// 				                    $('<div>').text(msgData.msg).addClass("pr-2"),
// 				                    $('<div>').addClass("pr-4")
// 				                ).addClass("d-flex flex-row")
// 				            ).addClass("mb-0 mr-3 pr-4")
// 				        ).addClass("right-chat-message fs-13 mb-2"),
// 				        $('<div>').append(
// 				            $('<div>').append(
// 				                $('<div>').append(
// 				                    $('<div>').text(msgData.sendTime).addClass("mr-2"),
// 				                    $('<div>').addClass("svg15 double-check")
// 				                ).addClass("d-flex flex-row")
// 				            ).addClass("message-time")
// 				        ).addClass("message-options dark")
// 				    ).addClass("d-flex flex-row-reverse mb-2");
					console.log("haha", msgData.sendTime);
					new Div = makeMyMsg({'message': msgData.msg, 'timeString': msgData.sendTime});
				    $('#chat').append(newDiv);
				} else {
					let newP = $('<p>').text(msgData.senderName);
				    newDiv = $('<div>').append(
				        $('<p>').text(msgData.msg).addClass("mb-0 mr-3 pr-4"),
				        $('<div>').append(
				            $('<div>').text(msgData.sendTime).addClass("message-time"),
				            $('<div>').append(
				                $('<i>').addClass("text-muted la la-angle-down fs-17")
				            ).addClass("message-arrow")
				        ).addClass("message-options")
				    ).addClass("left-chat-message fs-13 mb-2");
					$('#chat').append(newP);
					$('#chat').append(newDiv);
				}
				scrollToBottom();

//	 			location.href = "";
				// 정의된 CMD 코드에 따라서 분기 처리
				/* if (msgData.cmd == 'CMD_MSG_SEND') {
					$('#divChatData').append('<div>' + msgData.msg + '</div>');
				}
				// 입장
				else if (msgData.cmd == 'CMD_ENTER') {
					$('#divChatData').append('<div>' + msgData.msg + '</div>');
				}
				// 퇴장
				else if (msgData.cmd == 'CMD_EXIT') {
					$('#divChatData').append('<div>' + msgData.msg + '</div>');
				} */
			},
			/* closeMessage : function(str) {
				$('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>');
			}, */
//	 		disconnect : function() {
//	 			this._socket.close();
//	 		}, 
			_initSocket : function() {
				console.log("view_chat.jsp 소켓연결됐음다")
//	 			this._socket = new SockJS(this._url);
//	 			this._socket = window.opener.socket;
				this._socket = new SockJS("<c:url value='/alarm'/>");
				console.log("socket", this._socket);
//	 			this._socket.onopen = function(evt) {
//	 				webSocket.sendEnter();
//	 			};
				this._socket.onmessage = function(evt) {
					webSocket.receiveMessage(JSON.parse(evt.data));
				};
				/* this._socket.onclose = function(evt) {
					webSocket.closeMessage(JSON.parse(evt.data));
				} */
			},
			_sendMessage : function(type, bang_id, msg) {
				if (msg.trim() == "") {
					alert("메시지를 입력해주세요.");
					return;
				}
				var msgData = {
					type: type,
					bang_id : bang_id,
					msg : msg
				};
				var jsonData = JSON.stringify(msgData);
				this._socket.send(jsonData);
			}
		};
		
	$(window).on('load', function() {
		webSocket.init({
			url : '<c:url value="/chat" />'
		});
	});
</script>
    <div class="card shadow-line mb-3 chat chat-panel">
        <div class="p-3 chat-header">
            <div class="d-flex">
                <div class="w-100 d-flex pl-0">
                    <img class="rounded-circle shadow avatar-sm mr-3 chat-profile-picture"
                        src="https://user-images.githubusercontent.com/35243461/168796877-f6c8819a-5d6e-4b2a-bd56-04963639239b.jpg">
                    <div class="mr-3">
                        <a href="!#">
                            <p class="fw-400 mb-0 text-dark-75">Beate Lemoine</p>
                        </a>
                        <p class="sub-caption text-muted text-small mb-0"><i class="la la-clock mr-1"></i>last seen
                            today at 09:15 PM</p>
                    </div>
                </div>
                <div class="flex-shrink-0 margin-auto">
                    <a href="#" class="btn btn-sm btn-icon btn-light active text-dark ml-2">
                        <svg viewBox="0 0 24 24" width="15" height="15" stroke="currentColor" stroke-width="2"
                            fill="none" stroke-linecap="round" stroke-linejoin="round" class="feather">
                            <circle cx="12" cy="12" r="10"></circle>
                            <line x1="12" y1="16" x2="12" y2="12"></line>
                            <line x1="12" y1="8" x2="12.01" y2="8"></line>
                        </svg>
                    </a>
                    <a href="#" class="btn btn-sm btn-icon btn-light active text-dark ml-2">
                        <svg viewBox="0 0 24 24" width="15" height="15" stroke="currentColor" stroke-width="2"
                            fill="none" stroke-linecap="round" stroke-linejoin="round" class="feather">
                            <polygon points="23 7 16 12 23 17 23 7"></polygon>
                            <rect x="1" y="5" width="15" height="14" rx="2" ry="2"></rect>
                        </svg>
                    </a>
                    <a href="#" class="btn btn-sm btn-icon btn-light active text-dark ml-2">
                        <svg viewBox="0 0 24 24" width="15" height="15" stroke="currentColor" stroke-width="2"
                            fill="none" stroke-linecap="round" stroke-linejoin="round" class="feather">
                            <circle cx="11" cy="11" r="8"></circle>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        </svg>
                    </a>
                    <a href="#" class="btn btn-sm btn-icon btn-light active text-dark ml-2">
                        <svg viewBox="0 0 24 24" width="15" height="15" stroke="currentColor" stroke-width="2"
                            fill="none" stroke-linecap="round" stroke-linejoin="round" class="feather">
                            <circle cx="12" cy="12" r="1"></circle>
                            <circle cx="12" cy="5" r="1"></circle>
                            <circle cx="12" cy="19" r="1"></circle>
                        </svg>
                    </a>
                </div>
            </div>
        </div>
        <div id="chatBG" class="d-flex flex-row mb-3 navigation-mobile scrollable-chat-panel chat-panel-scroll">
            <div id="chat" class="w-100 p-3">
<!--                 <div class="svg36 loader-animate3 horizontal-margin-auto mb-2"></div> -->
<!--                 <div class="text-center letter-space drop-shadow text-uppercase fs-12 w-100 mb-3">Today</div> -->
            </div>
        </div>
        <div class="chat-search pl-3 pr-3">
            <div class="input-group">
                <input id="inputMsg" type="text" class="form-control" placeholder="Write a message" onkeypress="handleTextareaKeyPress(event);">
                <div class="input-group-append prepend-white">
                    <span class="input-group-text pl-2 pr-2">
                        <i class="chat-upload-trigger fs-19 bi bi-file-earmark-plus ml-2 mr-2"></i>
                        <i class="fs-19 bi bi-emoji-smile ml-2 mr-2"></i>
                        <i class="fs-19 bi bi-camera ml-2 mr-2"></i>
                        <i class="fs-19 bi bi-cursor ml-2 mr-2"></i>
                        <div class="chat-upload">
                            <div class="d-flex flex-column">
                                <div class="p-2">
                                    <button type="button"
                                        class="btn btn-secondary btn-md btn-icon btn-circle btn-blushing">
                                        <i class="fs-15 bi bi-camera"></i>
                                    </button>
                                </div>
                                <div class="p-2">
                                    <button type="button"
                                        class="btn btn-success btn-md btn-icon btn-circle btn-blushing">
                                        <i class="fs-15 bi bi-file-earmark-plus"></i>
                                    </button>
                                </div>
                                <div class="p-2">
                                    <button type="button"
                                        class="btn btn-warning btn-md btn-icon btn-circle btn-blushing">
                                        <i class="fs-15 bi bi-person"></i>
                                    </button>
                                </div>
                                <div class="p-2">
                                    <button type="button"
                                        class="btn btn-danger btn-md btn-icon btn-circle btn-blushing">
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
    
    <!-- Modal -->
	<div class="modal fade" id="memberModal" tabindex="-1"
		aria-labelledby="memberModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">멤버조회</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 사원정보
					</div>
					<div class="card-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>사번</th>
									<th>부서</th>
									<th>팀</th>
									<th>직급</th>
									<th>이름</th>
									<th>성별</th>
									<th>이메일</th>
									<th>-</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${chatRoom.chatRoomMembers }" var="crm">
									<tr>
										<td>${crm.employee.empNo }</td>
										<td>${crm.employee.empDeptNo }</td>
										<td>${crm.employee.empTeam }</td>
										<td>${crm.employee.empRoleNm }</td>
										<td>${crm.employee.empNm }</td>
										<td>${crm.employee.empGender }</td>
										<td>${crm.employee.empEmail }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<div id="addMemList"></div>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="inviteModal" tabindex="-1"
		aria-labelledby="memberModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">멤버조회</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 사원정보
					</div>
					<div class="card-body">
						<table id="datatablesSimple" class="table table-striped">
							<thead>
								<tr>
									<th>사번</th>
									<th>부서</th>
									<th>팀</th>
									<th>직급</th>
									<th>이름</th>
									<th>성별</th>
									<th>이메일</th>
									<th>-</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>사번</th>
									<th>부서</th>
									<th>팀</th>
									<th>직급</th>
									<th>이름</th>
									<th>성별</th>
									<th>이메일</th>
									<th>-</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${empList }" var="emp">
									<tr>
										<td>${emp.empNo }</td>
										<td>${emp.empDeptNo }</td>
										<td>${emp.empTeam }</td>
										<td>${emp.empRoleNm }</td>
										<td>${emp.empNm }</td>
										<td>${emp.empGender }</td>
										<td>${emp.empEmail }</td>
										<c:set var="memberFound" value="false" />
										<c:forEach var="member" items="${chatRoom.chatRoomMembers }">
											<c:if test="${member.empNo eq emp.empNo}">
												<td><button class="btn btn-sm" disabled>채팅멤버</button></td>
												<c:set var="memberFound" value="true" />
											</c:if>
										</c:forEach>

										<c:if test="${not memberFound}">
											<td><button class="btn btn-sm btn-outline-primary"
													onclick="fn_addMember({empNo: '${emp.empNo }', empNm: '${emp.empNm }'})">추가</button></td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<div id="addMemList"></div>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="fn_inviteMember()">추가하기</button>
				</div>
			</div>
		</div>
	</div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.6.7/js/min/perfect-scrollbar.jquery.min.js"></script>
    <script>
	var chatUl = document.getElementById('chat');
	
	console.log('chatUl', chatUl);
	// 새 메시지가 도착할 때 스크롤을 아래로 내리는 함수
	function scrollToBottom() {
		chatUl.scrollTop = chatUl.scrollHeight;
	}
	
    
	 //historyObj를 가지고 차트 데이터 만들어내기
	 // 바로 historyObj꺼내기 (알아서 파싱해주는 듯)
	 var msgListObj = ${msgListToJson};
	 var empListObj = ${empListToJson};
	 var chatRoomObj = ${chatRoomToJson};
	 
	 // 현재 날짜 가져오기
	 var currentDate = new Date();
	 
	 console.log("msgListObj", msgListObj);
	 console.log("empListObj", empListObj);
	 console.log("chatRoomObj", chatRoomObj);
	 
	 // 날짜에 따라 메시지 정렬 함수
	 function sortByDateAndTime(a, b) {
	   const dateA = new Date(a.crmCrtTs);
	   const dateB = new Date(b.crmCrtTs);

	   // 먼저 날짜로 정렬
	   if (dateA < dateB) return -1;
	   if (dateA > dateB) return 1;

	   // 날짜가 같을 경우 시간으로 정렬
	   return dateA.getTime() - dateB.getTime();
	 }
	 
	 function makeMyMsg(data) {
		 return $('<div>', {
			  class: 'd-flex flex-row-reverse mb-2',
			  html: $('<div>', {
			    class: 'right-chat-message fs-13 mb-2',
			    html: [
			      $('<div>', {
			        class: 'mb-0 mr-3 pr-4',
			        html: $('<div>', {
			          class: 'd-flex flex-row',
			          html: [
			            $('<div>', {
			              class: 'pr-2',
			              text: data.message
			            }),
			            $('<div>', {
			              class: 'pr-4'
			            })
			          ]
			        })
			      }),
			      $('<div>', {
			        class: 'message-options dark',
			        html: [
			          $('<div>', {
			            class: 'message-time',
			            html: $('<div>', {
			              class: 'd-flex flex-row',
			              html: [
			                $('<div>', {
			                  class: 'mr-2',
			                  text: data.timeString
			                }),
			                $('<div>', {
			                  class: 'svg15 double-check'
			                })
			              ]
			            })
			          }),
			          $('<div>', {
			            class: 'message-arrow',
			            html: $('<i>', {
			              class: 'text-muted la la-angle-down fs-17'
			            })
			          })
			        ]
			      })
			    ]
			  })
			});
	 }
	 
	 function makeOtherMsg(data) {
// 		 var sendTag = $('<p>').text(data.sender);
		 return $('<div>', {
		  class: 'left-chat-message fs-13 mb-2',
		  html: [
		    $('<p>', {
		      class: 'mb-0 mr-3 pr-4',
		      text: data.message
		    }),
		    $('<div>', {
		      class: 'message-options',
		      html: [
		        $('<div>', {
		          class: 'message-time',
		          text: data.timeString
		        }),
		        $('<div>', {
		          class: 'message-arrow',
		          html: $('<i>', {
		            class: 'text-muted la la-angle-down fs-17'
		          })
		        })
		      ]
		    })
		  ]
		});
// 		result.push[sendTag];
// 		result.push[leftChatMessage];
// 		return sendTag + leftChatMessage;
	 }

	 // 메시지 객체 배열을 날짜와 시간에 따라 정렬
	 msgListObj.sort(sortByDateAndTime);
	 
	// 정렬된 메시지를 한 번에 화면에 표시
	 var chatContainer = $("#chat"); // 채팅 내용을 표시할 jQuery 요소 선택
	 var chatContent = []; // 한 번에 모아서 추가할 채팅 내용 배열

	 var currentDateString = ""; // 현재 날짜를 기록할 변수 초기화

	 console.log("haha", msgListObj);
	 msgListObj.forEach(function (messageObj) {
	   const crmCrtTs = new Date(messageObj.crmCrtTs);
	   const message = messageObj.crmContent;
	   const sender = messageObj.employee.empNm;
	   const senderId = messageObj.employee.empNo;
	   
	   console.log("sender", sender);
		// 시간 추출
		const timeString = crmCrtTs.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: false });
	   
	   // 현재 메시지의 날짜와 이전 메시지의 날짜를 비교해서 새로운 날짜인 경우 헤더를 배열에 추가
	   const dateString = crmCrtTs.toLocaleDateString();
	   if (dateString !== currentDateString) {
		if (crmCrtTs.toDateString() === currentDate.toDateString()) {
		     chatContent.push($("<div>").addClass("text-center letter-space drop-shadow text-uppercase fs-12 w-100 mb-3").text("Today"));
		 } else {
		     chatContent.push($("<div>").addClass("text-center letter-space drop-shadow text-uppercase fs-12 w-100 mb-3").text(dateString));
		 }
	     currentDateString = dateString;
	   }
		
	   if (senderId == "${authMember.empNo }") {
		   // 내가 보낸 메시지는 오른쪽으로
		   // 동적으로 생성할 요소를 jQuery로 만듭니다.
		   // 동적으로 생성할 요소를 jQuery로 만듭니다.
			// 동적으로 생성할 요소를 jQuery로 만듭니다.
			// 새로운 요소를 생성하고 클래스를 추가합니다.
			var rightChatMessage = makeMyMsg({'message': message, 'timeString': timeString});

// 생성한 요소를 원하는 위치에 추가합니다.
// $('.your-container-class').append(rightChatMessage);

			
			// 생성한 요소를 원하는 위치에 추가합니다.
// 			$('.your-container-class').append(rightChatMessage);

			
			// 생성한 요소를 원하는 위치에 추가합니다.
// 			$('.your-container-class').append(rightChatMessage);
		    chatContent.push(rightChatMessage);

// 		    let newDiv = $('<div>').append(
// 		        $('<div>').append(
// 		            $('<div>').append(
// 		                $('<div>').append(
// 		                    $('<div>').text(message).addClass("pr-2"),
// 		                    $('<div>').addClass("pr-4")
// 		                ).addClass("d-flex flex-row")
// 		            ).addClass("mb-0 mr-3 pr-4")
// 		        ).addClass("right-chat-message fs-13 mb-2"),
// 		        $('<div>').append(
// 		            $('<div>').append(
// 		                $('<div>').append(
// 		                    $('<div>').text(timeString).addClass("mr-2"),
// 		                    $('<div>').addClass("svg15 double-check")
// 		                ).addClass("d-flex flex-row")
// 		            ).addClass("message-time")
// 		        ).addClass("message-options dark")
// 		    ).addClass("d-flex flex-row-reverse mb-2");
		    
		} else {
			// 상대방이 보낸 메시지는 왼쪽으로
			var sendTag = $('<p>').text(sender);
			var leftMsg = makeOtherMsg({'message': message, 'timeString': timeString});
			
			// 생성한 요소를 원하는 위치에 추가합니다.
// 			$('.your-container-class').append(leftChatMessage);
		    chatContent.push(sendTag);
		    chatContent.push(leftMsg);
			
			console.log(timeString, "zzz");
// 			let newP = $('<p>').text(sender);
// 		    let newDiv = $('<div>').append(
// 		        $('<p>').text(message).addClass("mb-0 mr-3 pr-4"),
// 		        $('<div>').append(
// 		            $('<div>').text(timeString).addClass("message-time"),
// 		            $('<div>').append(
// 		                $('<i>').addClass("text-muted la la-angle-down fs-17")
// 		            ).addClass("message-arrow")
// 		        ).addClass("message-options")
// 		    ).addClass("left-chat-message fs-13 mb-2");
// 		    chatContent.push(newP);
// 		    chatContent.push(newDiv);
		}
	 });

	 // 한 번에 모아서 화면에 추가
	 chatContainer.append(chatContent);
	 scrollToBottom();	 
	 
	 
//     	$(function() {
//     		var data = {};
//     		data['bang_id'] = bang_id;
    		
//     		let settings = {
// 				url : "${pageContext.request.contextPath }/chat2.do",
// 				method : "GET",
// 				data : data,
// 				dataType : "json",
// 				success : function(resp) {
// 					console.log(resp);
// 				},
// 				error : function(jqXHR, status, error) {
// 					console.log(jqXHR);
// 					console.log(status);
// 					console.log(error);
// 				} //request line,header,body -> response processing
// 			};

// 			$.ajax(settings);
//     	})

		$(document).ready(function() {
			console.log("hahaa")
			var data = {};
    		data['bang_id'] = bang_id;
    		
    		let settings = {
				url : "${pageContext.request.contextPath }/chat2.do",
				method : "GET",
				data : data,
				dataType : "json",
				success : function(resp) {
					console.log(resp);
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				} //request line,header,body -> response processing
			};

			$.ajax(settings);
		});
    
        (function ($) {
            "use strict";
            $('.scrollable-chat-panel').perfectScrollbar();
            var position = $(".chat-search").last().position().top;
            $('.scrollable-chat-panel').scrollTop(position);
            $('.scrollable-chat-panel').perfectScrollbar('update');
            $('.pagination-scrool').perfectScrollbar();

            $('.chat-upload-trigger').on('click', function (e) {
                $(this).parent().find('.chat-upload').toggleClass("active");
            });
            $('.user-detail-trigger').on('click', function (e) {
                $(this).closest('.chat').find('.chat-user-detail').toggleClass("active");
            });
            $('.user-undetail-trigger').on('click', function (e) {
                $(this).closest('.chat').find('.chat-user-detail').toggleClass("active");
            });
        })(jQuery); 

		function handleTextareaKeyPress(event) {
		    if (event.key === 'Enter' && !event.shiftKey) {
		        // Enter 키를 눌렀고 Shift 키와 함께 누르지 않았을 때
		        event.preventDefault(); // Enter 키 기본 동작(새 줄 추가)을 막음
		        webSocket.sendChat(); // 전송 로직을 호출하거나 원하는 동작 수행
		    }
		}
		
		window.onload = function() {
		    document.getElementById("inputMsg").focus();
		};
		
		scrollToBottom();
		
		var memList = [];
		
		function fn_addMember(emp) {
			emp.chrId = bang_id;
			console.log(emp);
			memList.push(emp);
			
			const text = $(addMemList).text();
			$(addMemList).append(' ' + emp.empNm);
		}
		
		function fn_inviteMember() {
			console.log("초대할 멤버들 : ", memList);
			
			// 비동기 통신
			let settings = {
				url : "${pageContext.request.contextPath }/chat/memberinsert.do",
				method : "post",
				data : JSON.stringify(memList),
				contentType: "application/json",
				dataType : "json",
				success : function(resp) {
					console.log(resp.result);
					if (resp.result === "success") {
						alert("초대성공");
						location.href = "";
					} else { // 실패
						alert("초대실패");
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
		
		function fn_out() {
			console.log("out!!!");
			console.log("방이디: ", bang_id);
			console.log("나느누구? :", ${authMember.empNo });
			
			const data = {};
			data.chrId = bang_id;
			data.empNo = ${authMember.empNo };
			
			let settings = {
					url : "${pageContext.request.contextPath }/chat/memberdelete.do",
					method : "post",
					data : JSON.stringify(data),
					contentType: "application/json",
					dataType : "json",
					success : function(resp) {
						console.log(resp.result);
						if (resp.result === "success") {
							alert("채팅방 나가기 성공");
							window.close();
						} else { // 실패
							alert("채팅방 나가기 실패");
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
</script>
</body>
</html>