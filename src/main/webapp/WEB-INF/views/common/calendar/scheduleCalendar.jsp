<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src='<%=request.getContextPath() %>/resources/js/fullcalendar-6.1.8/dist/index.global.js'></script>
<script src='<%=request.getContextPath() %>/resources/js/fullcalendar-6.1.8/packages/google-calendar/index.global.js'></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/js/fullcalendar-6.1.8/calendarcss.css">
<c:set var="path" value="${pageContext.request.contextPath}" />

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">일정</h5>
					    
					 </div>
<input type="hidden" id="selectedDate" name="selectedDate">
<ul class="d-flex reqstus">
	<li><span class="comm"></span>공통</li>
	<li><span class="dept"></span>부서</li>
</ul>
<div id='calendar'></div>

<!-- 등록 모달 -->
<div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="eventModalLabel">일정</h5>
				 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				<form id="eventForm">
					<input type="hidden" id="scheId" name="scheId">
					<div class="form-group">
						<label for="startDate">시작일</label> <input type="date" class="form-control" id="startDate" name="startDate">
					</div>
					<div class="form-group">
						<label for="endDate">종료일</label> <input type="date" class="form-control" id="endDate" name="endDate">
					</div>
					<div class="form-group">
						<label for="eventName">일정명</label> <input type="text" class="form-control" id="eventName" name="eventName">
					</div>
					<div class="form-group">
						<label for="eventLocation">일정 위치</label> <input type="text" class="form-control" id="eventLocation" name="eventLocation">
					</div>
					<div class="form-group">
						<label for="scheTarget">공통 일정</label> <input type="checkbox" id="scheTarget" name="scheTarget" value="">
					</div>
					<button type="submit" class="btn btn-primary">일정 저장</button>
					 <button type="button" class="btn btn-dark" id="deleteEventButton">취소/삭제</button>
				</form>
			</div>
		</div>
	</div>
</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script>
	document.addEventListener(
					'DOMContentLoaded',
					function() {
						var calendarEl = document.getElementById('calendar');
						var startDateField = document.getElementById('startDate');
						var endDateField = document.getElementById('endDate');

						var calendar = new FullCalendar.Calendar(
								calendarEl,
								{
									selectable : true,
									initialView : 'dayGridMonth',
									events : "<c:url value='/common/calender/scheduleListDS.do'/>",
									displayEventTime: false,
									locale: "ko",
									googleCalendarApiKey: "AIzaSyBY-EYwkoOXZIRqneemok8c00n5h96lSeg",
									eventSources: [{ // 구글 캘린더 API 공휴일 데이터 추가
									googleCalendarId: "ko.south_korea#holiday@group.v.calendar.google.com",
									backgroundColor: "transparent",
									borderColor: "transparent",
									className: "kr-holiday",
									textColor: "red"
									}],
									// 수정, 상세정보
									eventClick : function(info) {
										var clickedEventId = info.event.id;
										var clickedEventTitle = info.event.title;
										var clickedEventLocation = info.event.extendedProps.location;
										var clickedEventStartDate = info.event.startStr;
										var clickedEventColor = info.event.backgroundColor;
										console.log(clickedEventColor);
										// 종료일 +1일
										var clickedEventEndDate = info.event.endStr;

										// 종료일 변환
										const enddateString = clickedEventEndDate
												.split('T')[0];
										const date = new Date(enddateString);
										const oneDayMilliseconds = 24 * 60 * 60 * 1000;
										const previousDate = new Date(date.getTime() - oneDayMilliseconds);

										// YYYY-MM-DD
										const formattedDate = previousDate.toLocaleDateString('en-CA'); // 'en-CA'로 북미권에성듸 날짜 표기 형식으로 변경

										startDateField.value = clickedEventStartDate.split('T')[0];
										endDateField.value = formattedDate;
										document.getElementById('scheId').value = clickedEventId;
										document.getElementById('eventName').value = clickedEventTitle;
										document.getElementById('eventLocation').value = clickedEventLocation;
										
										// 초록색 일정 = 공통일정
										if (clickedEventColor === 'green') {
									        document.getElementById('scheTarget').checked = true;
									    } else {
									        document.getElementById('scheTarget').checked = false;
									    }
										// Open the modal
										$('#eventModal').modal('show');
									},

									// 등록
									select : function(info) {

										// 종료일 +1일
										var clickedEventEndDate = info.endStr;
										// 종료일 변환
										const date = new Date(
												clickedEventEndDate);
										const oneDayMilliseconds = 24 * 60 * 60 * 1000;
										const previousDate = new Date(date
												.getTime()
												- oneDayMilliseconds);

										// YYYY-MM-DD
										const formattedDate = previousDate
												.toLocaleDateString('en-CA'); // 'en-CA'로 북미권 날짜 표기 형식으로 변경

										// 시작일
										startDateField.value = info.startStr;

										endDateField.value = formattedDate;
										
										// Open the modal
										$('#eventModal').modal('show');
									}
								});
						
						calendar.render();
						
						// 모달이 닫힐 때 입력 필드 값을 초기화
				        $('#eventModal').on('hidden.bs.modal', function () {
				            $('#scheId').val('');
				            $('#startDate').val('');
				            $('#endDate').val('');
				            $('#eventName').val('');
				            $('#eventLocation').val('');
				            $('#scheTarget').prop('checked', false);
				        });
						
				     // 삭제 버튼 클릭 이벤트에 대한 이벤트 리스너 추가
				        $('#deleteEventButton').on('click', function() {
				            var scheId = $('#scheId').val(); // 숨겨진 필드에서 이벤트 ID 가져오기
				            if (confirm('작성중인 일정을 삭제/취소 하시겠습니까?')) {
				                // 이벤트 삭제를 위해 서버로 요청 보내기
				                $.ajax({
				                    type: 'POST',
				                    url: '<c:url value="/common/calendar/deleteEvent.do" />', // 이벤트 삭제용 실제 URL로 교체
				                    data: { scheId: scheId },
				                    dataType: 'json',
				                    success: function(response) {
				                        $('#eventModal').modal('hide');
				                        console.log(response);
										if (response == 1){
				                        	// 캘린더에서 이벤트를 제거하기 (이벤트가 존재하는 경우에만)
				                       	 	var deletedEvent = calendar.getEventById(scheId);
				                       	 	if (deletedEvent) {
				                       	     	deletedEvent.remove();
				                       	 	}
				                       		Swal.fire({
				           				  		icon: 'success',
				           				  		title: "일정 삭제 완료"
				           					})
										} else {
											Swal.fire({
				           				  		icon: 'warning',
				           				  		title: "일정 등록 취소"
				           					})
										}
										
				                    },
				                    error: function(xhr, status, error) {
				                        console.error('이벤트 삭제 오류:', error);
				                    }
				                });
				            }
				        });

						// Save 버튼 클릭 이벤트 핸들러 추가
						$('#eventForm').on('submit', function(event) {
							event.preventDefault();

							var formData = new FormData(this);

							// 체크박스 상태에 따라 value 값 설정
						    if ($('#scheTarget').is(':checked')) {
						        formData.append('scheTarget', 'all');
						    } else {
						        formData.append('scheTarget', 'dep');
						    }

							$.ajax({
								type : 'POST',
								url : '<c:url value="/common/calendar/saveEvent.do" />', // 여기에 컨트롤러의 URL을 지정
								data : formData,
								processData : false,
								contentType : false,
								success : function(response) {
									$('#eventModal').modal('hide');
									
									// 해당 일정만 다시 렌더링
						            if (response.eventId) {
						                var updatedEvent = calendar.getEventById(response.eventId);
						                if (updatedEvent) {
						                    updatedEvent.setProp('title', response.eventTitle);
						                    updatedEvent.setProp('location', response.eventLocation);
						                    updatedEvent.setStart(response.startDate);
						                    updatedEvent.setEnd(response.endDate);
						                    updatedEvent.setProp('backgroundColor', response.eventColor);
						                }
						                Swal.fire({
			           				  		icon: 'success',
			           				  		title: "일정 수정"
			           					})
						            } else {
						                // 새로운 일정 추가 시
						                calendar.refetchEvents();
						                Swal.fire({
			           				  		icon: 'success',
			           				  		title: "일정 등록!"
			           					})
						            }

								},
								error : function(xhr, status, error) {
									console.error('Error saving event:', error);
								}
							});
						});
					});
	
</script>