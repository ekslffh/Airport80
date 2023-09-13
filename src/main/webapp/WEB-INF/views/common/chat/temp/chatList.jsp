<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal.realUser" var="authMember"/>
<c:url value="/chat/roominsert.do" var="insertURL" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사내채팅목록</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style type="text/css">
html, body {overflow:hidden;}

/* 테이블 전체 스타일 */
.table-custom {
	width: 100%;
	border-collapse: collapse;
/* 	margin-top: 20px; */
}

/* 테이블 헤더 스타일 */
.table-custom th {
	background-color: #343a40;
	color: white;
	text-align: left; /* 변경: 헤더 텍스트 왼쪽 정렬 */
	padding: 15px; /* 변경: 헤더 패딩 추가 */
	font-weight: bold; /* 변경: 헤더 글꼴 굵게 */
}

/* 테이블 본문 스타일 */
.table-custom td {
	text-align: left;
	vertical-align: middle;
	padding: 10px; /* 변경: 본문 셀 패딩 추가 */
}

/* 테이블 모달 버튼 스타일 */
.modal-button {
	background-color: #343a40;
	color: white;
}

/* 테이블 아이콘 스타일 */
.table-icon {
	font-size: 24px;
	vertical-align: middle;
}

/* 읽지 않은 메시지 배지 스타일 */
.badge-number {
	background-color: red;
	color: white;
	border-radius: 50%;
	padding: 5px 10px;
}

/* 전체 글꼴 스타일 */
body {
	font-family: Arial, Helvetica, sans-serif; /* 변경: 전체 글꼴 설정 */
	font-size: 16px; /* 변경: 기본 글꼴 크기 설정 */
}

/* 모달 내 글꼴 스타일 */
.modal-body input {
	font-size: 16px; /* 변경: 모달 내 입력 필드 글꼴 크기 설정 */
}

/* 모달 버튼 글꼴 스타일 */
.modal-footer button {
	font-size: 16px; /* 변경: 모달 내 버튼 글꼴 크기 설정 */
}

/* 모달 제목 글꼴 스타일 */
.modal-title {
	font-size: 20px; /* 변경: 모달 제목 글꼴 크기 설정 */
}
</style>
</head>
<body>
<script src="https://bootstrapmade.com/assets/js/demo.js?v=5.0"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<table class="table table-custom table-striped-columns">
	<thead>
		<tr>
			<th colspan="4" class="text-right">
				<!-- 변경: 헤더 텍스트 오른쪽 정렬 --> <a href="javascript:;"
				class="btn modal-button" data-bs-toggle="modal"
				data-bs-target="#chatRoomFormModal"> <i
					class="bi bi-plus-circle table-icon"></i> 채팅방 생성
			</a>
			</th>
		</tr>
	</thead>
	<tbody>
      <c:if test="${empty chatRoomList }">
         <tr>
            <td colspan="4">소속된 채팅방이 없습니다.</td>
         </tr>
      </c:if>   
      <c:if test="${not empty chatRoomList }">
         <c:forEach items="${chatRoomList }" var="chatRoom">
            <c:url value="/chat.do" var="chatURL">
               <c:param name="bang_id" value="${chatRoom.chrId }" />
            </c:url>
            <tr>
               <td>${chatRoom.chrNm } (${chatRoom.chatRoomMembers.size() })</td>
               <c:if test="${empty msgMap[chatRoom.chrId] }">
		            <td colspan="2">채팅내용 없음.</td>
		      </c:if> 
		      <c:if test="${not empty msgMap[chatRoom.chrId] }">
				<td>
					${msgMap[chatRoom.chrId].crmContent }
	               	<span class="badge badge-number">${unRdMap[chatRoom.chrId] }</span>
				</td>
                <td>${msgMap[chatRoom.chrId].crmCrtTs }</td>
		      </c:if>   
               <td><a href="#" onclick="fn_conn('${chatURL }')" class="btn btn-warning">접속</a></td>
            </tr>
         </c:forEach>
      </c:if>
   </tbody>
</table>

<!-- 나머지


<!-- Modal -->
<div class="modal fade" data-url="${viewURL }" id="chatRoomFormModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">채팅방 생성</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
           <tr>
              <th>이름</th>
              <td><input name="chrNm" class="form-control" /></td>
           </tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="fn_makeRoom()">생성</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
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
// 		alert(obj.msg);
		if (obj.type == "chat") {
			location.href = "";
		}
	}
	
	function fn_makeRoom() {
	   const chrNm = $("input[name=chrNm]").val();
	   if (chrNm == "") {
		   alert("채팅방명을 입력해주세요.");
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
	            alert("채팅방이 생성되었습니다.");
	            location.href = "";
	         } else {
	            alert("채팅방 생성에 실패 : " + resp.error);
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