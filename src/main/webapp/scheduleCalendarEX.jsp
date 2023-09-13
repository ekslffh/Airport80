<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

<style>
body {
	line-height: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

#form-div {
	background-color: '';
	padding: 5px 5px 5px;
	width: 100%;
	margin-top: 5px;
	-moz-border-radius: 7px;
	-webkit-border-radius: 7px;
}

.feedback-input {
	color: #3c3c3c;
	font-family: Helvetica, Arial, sans-serif;
	font-weight: 400;
	font-size: 11px;
	border-radius: 0;
	line-height: 22px;
	background-color: #ffffff;
	padding: 3px 3px 3px 6px;
	margin-bottom: 10px;
	width: 100%;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box;
	box-sizing: border-box;
	border: 3px solid rgba(0, 0, 0, 0);
}

.feedback-input:focus {
	background: #fff;
	box-shadow: 0;
	/*border: 3px solid #3498db;*/
	border-color: #3498db;
	color: #3498db;
	outline: none;
	/*padding: 13px 13px 13px 54px;*/
}

.focused {
	color: #30aed6;
	border: #30aed6 solid 3px;
}

/* Icons */
#name {
	background-image: url(http://rexkirby.com/kirbyandson/images/name.svg);
	background-size: 30px 30px;
	background-position: 11px 8px;
	background-repeat: no-repeat;
}

#email {
	background-image: url(http://rexkirby.com/kirbyandson/images/email.svg);
	background-size: 30px 30px;
	background-position: 11px 8px;
	background-repeat: no-repeat;
}

#comment {
	background-image:
		url(http://rexkirby.com/kirbyandson/images/comment.svg);
	background-size: 30px 30px;
	background-position: 11px 8px;
	background-repeat: no-repeat;
}

textarea {
	width: 100%;
	height: 150px;
	line-height: 150%;
	resize: vertical;
}

input:hover, textarea:hover, input:focus, textarea:focus {
	background-color: white;
}

#button-blue {
	font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	float: left; /* 플롯 중요(::after 가상요소 이용)*/
	width: 100%;
	border: #fbfbfb solid 4px;
	cursor: pointer;
	background-color: #3498db;
	color: white;
	font-size: 24px;
	padding-top: 22px;
	padding-bottom: 22px;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
	margin-top: -4px;
	font-weight: 700;
}

#button-blue:hover {
	background-color: rgba(0, 0, 0, 0);
	color: #0493bd;
}

.ease {
	width: 0;
	height: 74px;
	background-color: #fbfbfb;
	-webkit-transition: .3s ease;
	-moz-transition: .3s ease;
	-o-transition: .3s ease;
	-ms-transition: .3s ease;
	transition: .3s ease;
}

.submit:hover .ease {
	width: 100%;
	background-color: white;
}
</style>
<script>
	var ctx = "${path}";
	var isAdm = "${isAdm}";
	var edit = false;
	if (isAdm == 1)
		edit = true;

	var diaLogOpt = {
		modal : true //모달대화상자
		,
		resizable : false //크기 조절 못하게
		,
		width : "570" // dialog 넓이 지정
		,
		height : "470" // dialog 높이 지정
	};

	//=========================================== function ===========================================
	//calFunc[s]
	var calFunc = {
		calcDate : function(arg, calendar) {
			var rObj = new Object();
			var start = null;
			var end = null;
			var allDay = arg.allDay;
			var startDisp = null;
			var endDisp = null;
			var id = null;
			var xcontent = null;
			var title = null;
			//============================== date get / set ======================================

			if (arg.id != "" && arg.id != null && arg.id != undefined)
				id = arg.id;
			if (arg.title != "" && arg.title != null && arg.title != undefined)
				title = arg.title;
			if (arg.extendedProps != undefined) {
				if (arg._def.extendedProps.xcontent != ""
						&& arg._def.extendedProps.xcontent != null
						&& arg._def.extendedProps.xcontent != undefined) {
					xcontent = arg._def.extendedProps.xcontent;
				}
			}

			if (allDay) {//하루종일이면
				var start = arg.start.toISOString().slice(0, 10); //returnCdate(calendar,arg.start);
				var end = null;
				if (arg.end != "" && arg.end != null && arg.end != undefined) {
					end = arg.end.toISOString().slice(0, 10); //실제 데이터는 날짜를 하루 빼지 않는다 
				}
				if (start == end)
					end = null; //같은날이면 end날짜 없음

				startDisp = start;
				if (end != null)
					endDisp = dateRel(arg.end.toISOString().slice(0, 10)); //알릴때만 날짜 하루 빼기 
			} else {//시간이 같이 들어오면
				start = arg.start.toISOString();
				if (arg.end != "" && arg.end != null && arg.end != undefined) {
					end = arg.end.toISOString();
				}
				startDisp = returnCdate(calendar, arg.start);
				if (end != null)
					endDisp = returnCdate(calendar, arg.end);
			}
			rObj.start = start;
			rObj.end = end;
			rObj.start = start;
			rObj.startDisp = startDisp;
			rObj.endDisp = endDisp;
			rObj.id = id;
			rObj.xcontent = xcontent;
			rObj.title = title;
			//============================== date get / set ======================================
			return rObj;
		},

		//등록초기
		setDateRangeView : function(xobj) {
			var dispStr = xobj.startDisp;
			if (xobj.endDisp != null)
				dispStr += " ~ " + xobj.endDisp;

			$("form#diaForm").find("input[name='xdate']").val(dispStr);
			$("form#diaForm").find("input[name='start']").val(xobj.start);
			$("form#diaForm").find("input[name='end']").val(xobj.end);
			$("form#diaForm").find("input[name='actType']").val("C"); //등록
		},

		//form안에 name값을 $obj에 주입
		getFormValue : function() {
			var $dForm = $("form#diaForm");
			var $obj = new Object();
			$("form#diaForm").find("input,textarea,select").each(function() {
				var xval = $(this).val();
				$obj[$(this).attr("name")] = xval;
			});

			return $obj;
		},

		//모든 태그 비활성화
		formDsbTrue : function() {
			$("form#diaForm").find("input,textarea,select").each(function() {
				$(this).attr("disabled", true);
			});
		},

		//모든 태그 활성화
		formDsbFalse : function() {
			$("form#diaForm").find("input,textarea,select").each(function() {
				$(this).attr("disabled", false);
			});
		},

		//데이터 조회
		setDataForm : function(xobj) {
			var dispStr = xobj.startDisp;
			if (xobj.endDisp != null)
				dispStr += " ~ " + xobj.endDisp;

			$("form#diaForm").find("input[name='xdate']").val(dispStr);
			$("form#diaForm").find("input[name='start']").val(xobj.start);
			$("form#diaForm").find("input[name='end']").val(xobj.end);
			$("form#diaForm").find("input[name='actType']").val("U"); //수정

			$("form#diaForm").find("input[name='id']").val(xobj.id);
			$("form#diaForm").find("input[name='title']").val(xobj.title);
			$("form#diaForm").find("textarea[name='xcontent']").val(
					xobj.xcontent);
		}
	};
	//calFunc[e]

	//등록 액션    
	function createClnd(cal, xobj) {
		if (!confirm("일정을 등록 하시겠습니까?"))
			return false;
		var $obj = calFunc.getFormValue();

		$.ajax({
			url : ctx + "/adms/calendar/management/create_ajx.do",
			type : "POST",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify($obj)
		}).done(function(data) {
			var result = jQuery.parseJSON(data);
			//모든 소스에서 이벤트를 다시 가져와 화면에 다시 렌더링
			cal.refetchEvents();
		}).fail(function(e) {
			alert("실패하였습니다." + e);
		}).always(function() {
			$("#name").val("");
			$("#comment").val("");
		});

	}

	//수정액션
	function updateClnd(cal, xobj, event) {
		if (!confirm("해당일정을 정말로 수정 하시겠습니까?")) {
			if (event != undefined)
				event.revert();
			return false;
		}
		var $obj = calFunc.getFormValue();

		$.ajax({
			url : ctx + "/adms/calendar/management/update_ajx.do",
			type : "POST",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify($obj)
		}).done(function(data) {
			var result = jQuery.parseJSON(data);
			cal.refetchEvents();
		}).fail(function(e) {
			alert("실패하였습니다." + e);
		}).always(function() {
			$("#name").val("");
			$("#comment").val("");
		});
	}

	//삭제액션
	function deleteClnd(cal, xobj) {
		if (!confirm("해당일정을 정말로 삭제 하시겠습니까?"))
			return false;

		var $obj = calFunc.getFormValue();
		$.ajax({
			url : ctx + "/adms/calendar/management/delete_ajx.do",
			type : "POST",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify($obj)
		}).done(function(data) {
			var result = jQuery.parseJSON(data);
			cal.refetchEvents();
		}).fail(function(e) {
			alert("실패하였습니다." + e);
		}).always(function() {
			$("#name").val("");
			$("#comment").val("");
		});
	}
	//=========================================== function =========================================== 

	//관리자만 ,주,일 옵션 뷰
	var rightm = "";
	rightm += ',listWeek';

	//달력 생성 [s]

	// DOMContentLoaded Event DOM Tree가 모두 로딩된 이후에 발생하는 이벤트
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth' + rightm
			},
			allDay : false,
			theme : true,
			themeSystem : 'bootstrap',
			locale : 'ko',
			timeZone : 'Asia/Seoul',
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,

			select : function(arg) {

				if (isAdm == 0)
					return false;
				var xObj = calFunc.calcDate(arg, calendar); //get event data     

				//================ dialog 옵션 추가 ===================
				var btnOpt = {
					"저장" : function() {
						createClnd(calendar, xObj); //저장클릭시 액션 함수
						$(this).dialog("close");
					},
					"취소" : function() {
						$(this).dialog("close");
					}
				}
				var dOpt = diaLogOpt;
				dOpt.buttons = btnOpt;
				$("#name").val("");
				$("#comment").val("");

				//================ dialog 옵션 추가 ===================
				calFunc.formDsbFalse(); //Form data disabeld false
				$('#dialog').dialog(dOpt); //다이얼로그 오픈
				calFunc.setDateRangeView(xObj); //SET Form data

				calendar.unselect();
			},

			//클릭 함수 [s]
			eventClick : function(calEvent, jsEvent) {

				var xObj = calFunc.calcDate(calEvent.event, calendar); //get event data          
				//================ dialog 옵션 추가 ===================
				var btnOpt = {
					"삭제" : function() {
						deleteClnd(calendar, xObj); //삭제클릭시 액션 함수
						$(this).dialog("close");
					},
					"수정" : function() {
						updateClnd(calendar, xObj); //수정클릭시 액션 함수
						$(this).dialog("close");
					},
					"닫기" : function() {
						$(this).dialog("close");
					}
				}
				//================ dialog 옵션 추가 ===================
				//======================관리자 =======================
				if (isAdm == 1) {
					calFunc.formDsbFalse(); //Form data disabeld false
				} else {
					calFunc.formDsbTrue(); //Form data disabeld true
					delete btnOpt['수정']; //일반사용자 수정 히든 처리
					delete btnOpt['삭제']; //일반사용자 삭제 히든 처리
				}
				//======================관리자 =======================

				//================ dialog 옵션 추가 ===================
				var dOpt = diaLogOpt;
				dOpt.buttons = btnOpt;
				//================ dialog 옵션 추가 ===================

				//================ 실행                      ===================
				$('#dialog').dialog(dOpt); //다이얼로그 오픈
				calFunc.setDataForm(xObj); //SET Form Data

				//================ 실행                      ===================

			},
			//클릭 함수 [e]

			editable : edit, //관리자 외 false
			dayMaxEvents : true, // allow "more" link when too many events 

			//새로운 이벤트 데이터가 필요할 때마다 이 함수를 호출 (데이터 조회)
			events : function(fetchInfo, successCallback, failureCallback) {
				var start = fetchInfo.start.toISOString().slice(0, 7);
				var end = fetchInfo.end.toISOString().slice(0, 7);
				var param = "";
				param += "start=" + start;
				param += "&end=" + end;

				$.ajax({
					url : ctx + "/adms/calendar/management/read_ajx.do",
					type : "POST",
					data : param
				}).done(function(data) {
					var result = jQuery.parseJSON(data);
					successCallback(result.list);
				}).fail(function(e) {
					alert("실패하였습니다." + e);
				}).always(function() {

				});

			},

			eventDrop : function(info) {
				var xObj = calFunc.calcDate(info.event, calendar); //get event data
				calFunc.setDataForm(xObj); //Set Form Data
				updateClnd(calendar, xObj, info);
			},
			eventResize : function(info) {
				var xObj = calFunc.calcDate(info.event, calendar); //get event data
				calFunc.setDataForm(xObj); //Set Form Data
				updateClnd(calendar, xObj, info);
			},
			eventTimeFormat : {
				hour : '2-digit',
				minute : '2-digit',
				hour12 : false
			},

		});

		calendar.render();

		$("span.fa-chevron-left").html("이전달");
		$("span.fa-chevron-right").html("다음달");
	});
	//달력 생성 [e]

	//특정일자 하루전
	function dateRel(date) {
		var selectDate = date.split("-");
		var changeDate = new Date();
		changeDate.setFullYear(selectDate[0], selectDate[1] - 1,
				selectDate[2] - 1);

		var y = changeDate.getFullYear();
		var m = changeDate.getMonth() + 1;
		var d = changeDate.getDate();

		if (m < 10) {
			m = "0" + m;
		}

		if (d < 10) {
			d = "0" + d;
		}
		var resultDate = y + "-" + m + "-" + d;
		return resultDate;
	}

	function returnCdate(cal, time) {
		return cal.formatDate(time, {
			month : 'long',
			year : 'numeric',
			day : 'numeric',
			hour : 'numeric',
			minute : 'numeric',
			timeZone : 'Asia/Seoul',
			locale : 'ko'
		});
	}
</script>

<div id="contents">
	<div id="dialog" title="일정 관리" style="display: none;">
		<div id="form-div">
			<form class="diaForm" id="diaForm">
				<input type="hidden" name="actType" value="C" />
				<!-- C:등록 U:수정 D:삭제 -->
				<input type="hidden" name="id" value="" /> <input type="hidden" name="start" value="" /> <input type="hidden" name="end" value="" />

				<p class="name">
					<input name="title" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="일정타이틀" id="name" />
				</p>

				<p class="email">
					<input name="xdate" type="text" readonly="readonly" class="validate[required,custom[email]] feedback-input" placeholder="선택된날짜 및 시간" />
				</p>

				<p class="text">
					<textarea name="xcontent" class="validate[required,length[6,300]] feedback-input" id="comment" placeholder="일정내용"></textarea>
				</p>
			</form>
		</div>
	</div>
	<br />
	<div id='calendar'></div>
</div>