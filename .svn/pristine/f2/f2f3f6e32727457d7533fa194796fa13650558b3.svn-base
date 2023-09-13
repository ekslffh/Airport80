<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

<style>
#node0 {
	display: flex;
}

#node1 {
	float: left;
	width: 860px;
	height: 472px;
	margin-right: 30px;
}

#node2 {
	width: 800px;
	height: 472px;
	margin-right: 30px;
	display: block;
}

#node3 {
	display: flex;
	box-sizing: border-box;
}

#node4 {
 	width: 860px;
	height: 460px;
	display: inline-flex;
	margin-right: 25px;
}

#node5 {
	display: inline-flex;
	width: 500px;
	height: 460px;
	margin-right: 25px;
}

#node6 {
	width: 600px;
}

#node1-1 {
	display: inline-flex;
	width: 54%;
}

#node1-2 {
    display: flex;
    padding-top: 25px;
    justify-content: center;
}

.card-body {
	text-align: center;
	padding: 0 10px 10px 10px;
}
.card-header, .card-footer {
    border-color: #ebeef4;
    background-color: #fff;
    color: #798eb3;
    padding: 12px;
}

#vrCalendar{
max-height:90%;
margin:0 auto;
}
</style>



<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body" style="padding: 0 20px 20px 20px;">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="text-align:left; padding-bottom: 5px; margin-bottom: 15px;">
					    <h5 class="card-tit">휴가 관리</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">인사 정보</a></li>
					        <li class="breadcrumb-item active">휴가 관리</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->


	<div id="node1-2">
		<div id="node4" class="card">
			<div class="card-header">
			    <div class="d-flex justify-content-between align-items-center">
			        <div>
			            휴가 결재 (대기)
			        </div>
			        <div class="text-right" style="font-size: 13px;">
			            승인 되지 않은 신청 내역만 조회할 수 있습니다.
			        </div>
			    </div>
			</div>
			<div class="card-body" id="vrDiv">
			</div>
		</div>

		<div id="node4" class="card">
			<div class="card-header" style="text-align:left;">휴가 결재</div>
			<div class="card-body" id="vpDiv">
				선택된 휴가 신청 내역이 없습니다.
			</div>
		</div>
	</div>

	<div id="node0">
		<div id="node1" class="card">
			<div class="card-header" style="text-align:left;">휴가 발생 일수</div>
			<div class="card-body" id="vacreqStatusList">
			</div>
		</div>
		<!-- #node1 end -->

		<div id="node1-1">
			<div id="node2" class="card">
				<div class="card-header" style="text-align:left;">직원 휴가 일정</div>
				<div id='calendar-container' style="height:100%;">
					<div class="card-body" id="vrCalendar" style="padding-top:10px;"></div>
				</div>
			</div>
		</div>
	</div>

				</div>
			</div>
		</div>
	</div>
</section>



<script type="text/javascript">

$(function() {
	getVrList();
	getVrHaveList();
})

function getVrList() {
	let settings = {
			url : "${pageContext.request.contextPath}/hr/vacation/vacreqList.do",
			method : "get",
			dataType : "html",
			success : function(resp) {
				console.log("resp", resp);
				$(vrDiv).html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			} //request line,header,body -> response processing
	};
	$.ajax(settings);
}

function getVrHaveList(data) {
	let settings = {
			url : "${pageContext.request.contextPath}/hr/vacation/vacreqHave.do",
			method : "get",
			data: data,
			dataType : "html",
			success : function(resp) {
				console.log("resp", resp);
				$(vacreqStatusList).html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			} //request line,header,body -> response processing
		};
	$.ajax(settings);
}


function fn_paging(page){
   var data = {};
   data.page = page;
//    data.searchType = $(searchForm).find('[name = searchType]').val();
//    data.searchWord = $(searchForm).find('[name = searchWord]').val();
   getVrHaveList(data);
}

var calendar;

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('vrCalendar');
    
    calendar = new FullCalendar.Calendar(calendarEl, {
        selectable: true,
        initialView: 'dayGridMonth',
		locale : 'ko',
        headerToolbar: {
            start: "",
            center: "title",
            end: "prev next",
            
          },
        events: "<c:url value='/hr/vacation/vrCalendar.do'/>",
        displayEventTime: false,
    });
    
    calendar.render();
});

// FullCalendar를 다시 렌더링
function updateCalendar() {
    calendar.refetchEvents();
}

// 선택 상태 변경 감지
$(document).ready(function() {
    // '승인' 라디오 버튼 클릭 시 사유 입력창 숨김
    $("input[name='vrStatus'][value='APPR']").click(function() {
        $("#reasonDiv").hide();
    });

    // '반려' 라디오 버튼 클릭 시 사유 입력창 표시
    $("input[name='vrStatus'][value='REJ']").click(function() {
        $("#reasonDiv").show();
    });
    
 // 완료상태 업데이트 폼 제출
    $(node4).on("click", "#statusBtn", (function(event) {
    	$.ajax({
    		type: 'POST',
    		url: "${pageContext.request.contextPath}/hr/vacation/vacreqUpdate.do",
    		data: $(statusForm).serialize(),
    		success: function(response) {
    			if (response == "success") {
   					getVrHaveList();
   					getVrList();
   					updateCalendar();
   					Swal.fire({
   					  icon: 'success',
   					  text: '휴가 신청 결재가 완료되었습니다.',
   					})
    			} else {
   					Swal.fire({
   					  icon: 'error',
   					  text: '휴가 신청 결재가 실패되었습니다.',
   					})
    			}
    		},
    		 error: function (xhr, status, error) {
                 console.error(error);
             }
    	});
    }));
});
</script>