<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<security:authentication property="principal.realUser" var="authMember"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/chat/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style type="text/css">
.chat {
    display: flex;
    flex-direction: column;
}

.message {
    margin: 5px;
    padding: 10px;
    border-radius: 10px;
    max-width: 70%; /* 메시지 최대 폭 */
}

.other {
    background-color: #f0f0f0; /* 남이 쓴 메시지 배경색 */
    align-self: flex-start;
    border: 1px solid #ccc; /* 테두리 스타일 */
}

.mine {
    background-color: #4caf50; /* 내가 쓴 메시지 배경색 */
    color: white; /* 내가 쓴 메시지 텍스트 색상 */
    align-self: flex-end;
    border: 1px solid #4caf50; /* 테두리 스타일 */
}
</style>
</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script type="text/javascript">
const urlParams = new URL(location.href).searchParams;
const bang_id = urlParams.get('bang_id');

	var webSocket = {
		init : function(param) {
// 			this._url = param.url;
			// console.log("Url: ", this._url) //  /Airport80/chat
			this._initSocket();
		},
		sendChat : function() {
			this._sendMessage('CHAT_REQ', '${param.bang_id}', $('#message').val());
			$('#message').val('');
		},
		/* sendEnter : function() {
			this._sendMessage('${param.bang_id}', 'CMD_ENTER', $('#message').val());
			$('#message').val('');
		}, */
		receiveMessage : function(msgData) {
			console.log("bang_iddf", msgData.bang_id);
			if (msgData.bang_id != bang_id) {
				console.log("방아이디 달라서 안들어옴ㅁㅁ!!!!!!!", msgData.msg)
				return;
			}
			let newDiv = $('<div>').text(msgData.msg).addClass("message");
			if (msgData.sender == ${authMember.empNo }) {
				newDiv.addClass("mine");
			} else {
				newDiv.addClass("other");
			}
			$('#divChatData').append(newDiv);
			scrollToBottom();
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
			if (msg == "") {
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
</script>
<script type="text/javascript">
	$(window).on('load', function() {
		webSocket.init({
			url : '<c:url value="/chat" />'
		});
	});
</script>
<!-- <button class="btn"><i class="bi bi-person-plus-fill"></i></button> -->
<!-- Button trigger modal -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">${chatRoom.chrNm}</a>

			<div class="dropdown">
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
			</div>
		</div>
	</nav>

	<!-- Modal -->
<div class="modal fade" id="memberModal" tabindex="-1" aria-labelledby="memberModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">멤버조회</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	 <div class="card-header">
            <i class="fas fa-table me-1"></i>
           	사원정보
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
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="inviteModal" tabindex="-1" aria-labelledby="memberModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">멤버조회</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	 <div class="card-header">
            <i class="fas fa-table me-1"></i>
           	사원정보
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
              					<td><button class="btn btn-sm btn-outline-primary" onclick="fn_addMember({empNo: '${emp.empNo }', empNm: '${emp.empNm }'})">추가</button></td>
							</c:if>
        				</tr>
        			</c:forEach>
	      		</tbody>
	      	</table>
        </div>
      </div>
      <div class="modal-footer">
      	<div id="addMemList"></div>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="fn_inviteMember()">추가하기</button>
      </div>
    </div>
  </div>
</div>

<div
	style="width: 100%; height: 700px; padding: 10px; border: solid 1px #e1e3e9;">
	<div id="divChatData" class="chat" style="height: 660px; overflow: auto; border: 1px solid #ccc;">
		<c:forEach items="${msgList }" var="msg">
			<c:choose>
		        <c:when test="${msg.empNo eq authMember.empNo}">
		        	<div class="message mine">[${msg.crmCrtTs }] ${msg.employee.empNm} : ${msg.crmContent }</div>
		        </c:when>
		        <c:otherwise>
		        	<div class="message other">${msg.employee.empNm} : ${msg.crmContent } [${msg.crmCrtTs }]</div>
		        </c:otherwise>
	   		 </c:choose>
		</c:forEach>
	</div>
</div>
<div style="width: 100%; height: 10%; padding: 10px;">
	<input 
		type="text" id="message" size=80
		onkeypress="if(event.keyCode==13){webSocket.sendChat();}" 
		/> 
	<button
		class="btn btn-primary"
		type="button" id="btnSend"
		onclick="webSocket.sendChat()">
		<i class="bi bi-send"></i>
	</button>
</div>

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/app/chat/datatables-simple-demo.js"></script>

<script type="text/javascript">
window.onload = function() {
    document.getElementById("message").focus();
};

var chatDiv = document.getElementById('divChatData');

// 새 메시지가 도착할 때 스크롤을 아래로 내리는 함수
function scrollToBottom() {
  chatDiv.scrollTop = chatDiv.scrollHeight;
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