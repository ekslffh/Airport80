<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<security:authentication property="principal.realUser" var="authMember" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/chat/styles.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	background-color: #abd9e9;
	font-family: Arial;
}

#container {
	width: 750px;
	height: 800px;
	background: #eff3f7;
	margin: 0 auto;
	font-size: 0;
	border-radius: 5px;
	overflow: hidden;
}

aside {
	width: 260px;
	height: 800px;
	background-color: #3b3e49;
	display: inline-block;
	font-size: 15px;
	vertical-align: top;
}

main {
	width: 490px;
	height: 800px;
	display: inline-block;
	font-size: 15px;
	vertical-align: top;
}

aside header {
	padding: 30px 20px;
}

aside input {
	width: 100%;
	height: 50px;
	line-height: 50px;
	padding: 0 50px 0 20px;
	background-color: #5e616a;
	border: none;
	border-radius: 3px;
	color: #fff;
	background-image:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_search.png);
	background-repeat: no-repeat;
	background-position: 170px;
	background-size: 40px;
}

aside input::placeholder {
	color: #fff;
}

aside ul {
	padding-left: 0;
	margin: 0;
	list-style-type: none;
	overflow-y: scroll;
	height: 690px;
}

aside li {
	padding: 10px 0;
}

aside li:hover {
	background-color: #5e616a;
}

h2, h3 {
	margin: 0;
}

aside li img {
	border-radius: 50%;
	margin-left: 20px;
	margin-right: 8px;
}

aside li div {
	display: inline-block;
	vertical-align: top;
	margin-top: 12px;
}

aside li h2 {
	font-size: 14px;
	color: #fff;
	font-weight: normal;
	margin-bottom: 5px;
}

aside li h3 {
	font-size: 12px;
	color: #7e818a;
	font-weight: normal;
}

.status {
	width: 8px;
	height: 8px;
	border-radius: 50%;
	display: inline-block;
	margin-right: 7px;
}

.green {
	background-color: #58b666;
}

.orange {
	background-color: #ff725d;
}

.blue {
	background-color: #6fbced;
	margin-right: 0;
	margin-left: 7px;
}

main header {
	height: 110px;
	padding: 30px 20px 30px 40px;
}

main header>* {
	display: inline-block;
	vertical-align: top;
}

main header img:first-child {
	border-radius: 50%;
}

main header img:last-child {
	width: 24px;
	margin-top: 8px;
}

main header div {
	margin-left: 10px;
	margin-right: 145px;
}

main header h2 {
	font-size: 16px;
	margin-bottom: 5px;
}

main header h3 {
	font-size: 14px;
	font-weight: normal;
	color: #7e818a;
}

#chat {
	padding-left: 0;
	margin: 0;
	list-style-type: none;
	overflow-y: scroll;
	height: 535px;
	border-top: 2px solid #fff;
	border-bottom: 2px solid #fff;
}

#chat li {
	padding: 10px 30px;
}

#chat h2, #chat h3 {
	display: inline-block;
	font-size: 13px;
	font-weight: normal;
}

#chat h3 {
	color: #bbb;
}

#chat .entete {
	margin-bottom: 5px;
}

#chat .message {
	padding: 20px;
	color: #fff;
	line-height: 25px;
	max-width: 90%;
	display: inline-block;
	text-align: left;
	border-radius: 5px;
}

#chat .me {
	text-align: right;
}

#chat .you .message {
	background-color: #58b666;
}

#chat .me .message {
	background-color: #6fbced;
}

#chat .triangle {
	width: 0;
	height: 0;
	border-style: solid;
	border-width: 0 10px 10px 10px;
}

#chat .you .triangle {
	border-color: transparent transparent #58b666 transparent;
	margin-left: 15px;
}

#chat .me .triangle {
	border-color: transparent transparent #6fbced transparent;
	margin-left: 375px;
}

main footer {
	height: 155px;
	padding: 20px 30px 10px 20px;
}

main footer textarea {
	resize: none;
	border: none;
	display: block;
	width: 100%;
	height: 80px;
	border-radius: 3px;
	padding: 20px;
	font-size: 13px;
	margin-bottom: 13px;
}

main footer textarea::placeholder {
	color: #ddd;
}

main footer img {
	height: 30px;
	cursor: pointer;
}

main footer a {
	text-decoration: none;
	text-transform: uppercase;
	font-weight: bold;
	color: #6fbced;
	vertical-align: top;
	margin-left: 333px;
	margin-top: 5px;
	display: inline-block;
}



</style>
</head>
<body>
<script type="text/javascript">
const urlParams = new URL(location.href).searchParams;
const bang_id = urlParams.get('bang_id');

//웹소켓 연결하기
var webSocket = {
		init : function(param) {
			this._initSocket();
		},
		sendChat : function() {
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
			
			let newUl = $('<li>').append(
							$('<div>').append(
								$('<h3>').text(msgData.sendTime),
								$('<h2>').text(msgData.senderName),
								$('<span>').addClass("status blue")
							).addClass("entete"),
							$('<div>').addClass("triangle"),
							$('<div>').text(msgData.msg).addClass("message"),
						);
					
			if (msgData.sender == ${authMember.empNo }) {
				newUl.addClass("me");
			} else {
				newUl.addClass("you");
			}
			
			$('#chat').append(newUl);
			scrollToBottom();

// 			location.href = "";
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
// 		disconnect : function() {
// 			this._socket.close();
// 		}, 
		_initSocket : function() {
			console.log("view_chat.jsp 소켓연결됐음다")
// 			this._socket = new SockJS(this._url);
// 			this._socket = window.opener.socket;
			this._socket = new SockJS("<c:url value='/alarm'/>");
			console.log("socket", this._socket);
// 			this._socket.onopen = function(evt) {
// 				webSocket.sendEnter();
// 			};
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
	<div id="container">
		<aside>
			<header>
				<input type="text" placeholder="search">
			</header>
			<ul>
				<li><img
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_10.jpg"
					alt="">
					<div>
						<h2>Prénom Nom</h2>
						<h3>
							<span class="status orange"></span> offline
						</h3>
					</div></li>
				<c:forEach items="${chatRoom.chatRoomMembers }" var="crm">
					<li><img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_10.jpg"
						alt="${crm.employee.empNm }" />
						<div>
							<h2>${crm.employee.empNm }</h2>
							<h3>
								<span class="status green"></span> online
							</h3>
						</div></li>
				</c:forEach>
			</ul>
		</aside>
		<main>
			<header>
				<img
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_01.jpg"
					alt="">
				<div>
					<h2>${chatRoom.chrNm}</h2>
					<h3>already 1902 messages</h3>
				</div>
				<!-- 				<nav class="navbar"> -->
				<!-- 					<div class="container-fluid"> -->
				<span class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">
						<i class="bi bi-list"></i>
					</button>
					<ul class="dropdown-menu dropdown-menu-end">
						<li>
							<button type="button" class="btn btn-primary dropdown-item"
								data-bs-toggle="modal" data-bs-target="#memberModal">
								<i class="bi bi-person-fill"></i> 채팅방멤버 조회하기
							</button>
						</li>
						<li>
							<button type="button" class="btn btn-primary dropdown-item"
								data-bs-toggle="modal" data-bs-target="#inviteModal">
								<i class="bi bi-plus"></i> 대화상대 초대하기
							</button>
						</li>
						<li>
							<button type="button" class="btn btn-danger dropdown-item"
								onclick="fn_out()">
								<i class="bi bi-box-arrow-right"></i> 채팅방 나가기
							</button>
						</li>
					</ul>
				</span>
				<!-- 					</div> -->
				<!-- 				</nav> -->
			</header>
			<ul id="chat">
				<li class="me">
					<div class="entete">
						<h3>10:12AM, Today</h3>
						<h2>Vincent</h2>
						<span class="status blue"></span>
					</div>
					<div class="triangle"></div>
					<div class="message">OK</div>
				</li>
				<c:forEach items="${msgList }" var="msg">
					<c:choose>
						<c:when test="${msg.empNo eq authMember.empNo}">
							<li class="me">
								<div class="entete">
									<h3>${msg.crmCrtTs }</h3>
									<h2>${msg.employee.empNm }</h2>
									<span class="status blue"></span>
								</div>
								<div class="triangle"></div>
								<div class="message">${msg.crmContent }</div>
								<div>${msg.unreadCnt }</div> <!-- 숫자를 여기에 추가 -->
							</li>
						</c:when>
						<c:otherwise>
							<li class="you">
								<div class="entete">
									<span class="status green"></span>
									<h2>${msg.employee.empNm }</h2>
									<h3>10:12AM, Today</h3>
								</div>
								<div class="triangle"></div>
								<div class="message">${msg.crmContent}</div>
								<div>${msg.unreadCnt }</div>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
			<footer>
				<textarea id="inputMsg" placeholder="Type your message" onkeypress="handleTextareaKeyPress(event);" ></textarea>
				<img
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_picture.png"
					alt=""> <img
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_file.png"
					alt=""> <a href="#" onclick="webSocket.sendChat();">Send</a>
			</footer>
		</main>
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
<script type="text/javascript">
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

var chatUl = document.getElementById('chat');

// 새 메시지가 도착할 때 스크롤을 아래로 내리는 함수
function scrollToBottom() {
	chatUl.scrollTop = chatUl.scrollHeight;
}

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