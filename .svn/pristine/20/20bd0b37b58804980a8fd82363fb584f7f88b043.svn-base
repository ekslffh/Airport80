<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<security:authentication property="principal.realUser" var="authMember" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script
   src='<%=request.getContextPath()%>/resources/js/fullcalendar-6.1.8/dist/index.global.js'></script>
<script
   src='<%=request.getContextPath()%>/resources/js/fullcalendar-6.1.8/packages/google-calendar/index.global.js'></script>
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/js/fullcalendar-6.1.8/calendarcss.css">
<!-- <div class="pagetitle"> -->
<!--    <h1>Main Page</h1> -->
<!--    <nav style="margin-top: 3px;"> -->
<!--       <ol class="breadcrumb" style="font-weight: 100;"> -->
<!--          <li class="breadcrumb-item" style="font-weight: 100;"><a -->
<!--             href="index.html">Home</a></li> -->
<!--          <li class="breadcrumb-item active" style="font-weight: 100;">Dashboard</li> -->
<!--       </ol> -->
<!--    </nav> -->
<!-- </div> -->
<!-- End Page Title -->
<style>
.button-container {
   display: flex;
   flex-direction: column;
   align-items: center;
   margin-top: 10px; /* 버튼과 시간 사이 간격 조정 */
}

.button-container button {
   margin-bottom: 5px; /* 버튼 사이 간격 조정 */
}

.rightpd {
   padding-right: 0;
}

.dataArea {
   font-size: 18px;
   letter-spacing: 0.8px;
   font-weight: 600;
   margin-top: -18px;
}

.fiftybar {
   width: 1px;
   height: 40px;
   margin-top: -8px;
   border-left: 4px dotted rgb(245, 51, 135);
   position: absolute;
   height: 30px;
}

.fifcolor {
   right: -7px;
   top: -28px;
   position: absolute;
   font-size: 13px;
   color: rgb(245, 51, 135);
   letter-spacing: -0.5px;
   cursor: pointer;
}

.workhour_zone {
   justify-content: center;
   margin-bottom: -26px;
}

#workHour {
   font-size: 33px;
}

.hour {
   font-size: 22px;
   margin-top: 10px;
   padding-left: 2px;
}

#budgetChart {
   margin-top: -20px;
}
</style>
<script
   src="<%=request.getContextPath()%>/resources/js/app/attendance/attendace.js"></script>
<section class="section dashboard">
   <div class="row">


      <div style="width: 60%;">
         <div class="row">

            <!-- 출퇴근버튼 시작 -->
            <div class="col-xxl-6 col-md-6 rightpd">
               <div class="card info-card sales-card">

                  <!-- 출퇴근버튼    -->
                  <div class="card-body">
                     <h5 class="card-title">
                        출퇴관리 <span>| Attendance</span>
                     </h5>
                     <div style="text-align: center; font-size: 22px">
                        <span id="timeDiv" class="middle pt-1 fw-bold col-md-6"></span>
                     </div>
                     <div class="d-flex justify-content-between mt-3"
                        style="padding-right: 10px; padding-left: 10px;">
                        <div class="col-md-6">
                           <button id="checkInButton"
                              class="btn btn-primary rounded-pill btn-sm"
                              onclick="onCheckInButtonClick()">출근</button>
                           <span id="checkInDisplay" class="time-display">${attVO.attInTime}</span>
                        </div>
                        <div class="col-md-6">
                           <button id="checkOutButton"
                              class="btn btn-secondary rounded-pill btn-sm">퇴근</button>
                           <span id="checkOutDisplay" class="time-display">${attVO.attOutTime}</span>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- 출퇴근버튼 끝 -->


            <!-- 근태관리 시작 -->
            <div class="col-xxl-6 col-md-6 rightpd">
               <div class="card info-card revenue-card">

                  <div class="filter">
                     <a class="icon" href="#" data-bs-toggle="dropdown"><i
                        class="bi bi-three-dots"></i></a>
                     <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                        <li class="dropdown-header text-start">
                           <h6>Filter</h6>
                        </li>

                        <li><a class="dropdown-item" href="#">Today</a></li>
                        <li><a class="dropdown-item" href="#">This Month</a></li>
                        <li><a class="dropdown-item" href="#">This Year</a></li>
                     </ul>
                  </div>

                  <div class="card-body">
                     <h5 class="card-title">
                        근태관리 <span>| 이번 달 주 근무시간</span>
                     </h5>

                     <div class="dataArea d-flex justify-content-center">
                        <span id="year"></span><span>.</span><span id="month"></span>
                     </div>

                     <div class="workhour_zone d-flex">
                        <p id="workHour"></p>
                        <p class="hour">h</p>
                     </div>

                     <div style="position: relative;">
                        <div class="fiftybar" style="left: 91%"></div>
                        <div class="fifcolor" data-bs-toggle="tooltip"
                           data-bs-placement="top" title="최대근무 시간은 52h 입니다.">
                           주 50시간 <i class="bi bi-exclamation-circle"></i>
                        </div>

                        <div class="progress mt-3">
                           <div class="progress-bar" role="progressbar"
                              style="width: 25%; background: radial-gradient(#040404, transparent);"
                              aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
                        </div>
                     </div>

                  </div>

               </div>
            </div>
            <!-- 근태관리 끝 -->
            <script>

//근태관리 오늘날짜생성
function getCurrentYearAndMonth() {
    const currentDate = new Date();
    const currentYear = currentDate.getFullYear();
    const currentMonth = (currentDate.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 1을 더합니다.

    return {
      year: currentYear,
      month: currentMonth,
    };
  }

  // 함수 호출
  const { year, month } = getCurrentYearAndMonth();

  // jQuery를 사용하여 해당 HTML 요소에 텍스트를 설정합니다.
  $("#year").html(year); // yearElementId는 출력할 요소의 ID입니다.
  $("#month").html(month); // monthElementId는 출력할 요소의 ID입니다.

  console.log("현재 년도:", year);
  console.log("현재 월:", month);
  
  let viewURL = "${pageContext.request.contextPath }/in/workhour.do";
  let empNo = "${authMember.empNo }";
  
  //한달 근무시간 호출 
  $(document).ready(function(){
    $.ajax({
       url: viewURL,
       method: "GET",
       data : {
          empNo, empNo
       },
       dataType: "json",
       success: function(resp){
          console.log("한달근무시간:",resp);
          $(workHour).html(resp);
          
          var calculatedWidth = (resp / 52) * 100; // 예를 들어 52로 나눈 값을 백분율로 계산

            // width 및 텍스트 내용 설정
            var progressBar = $(".progress-bar");
            progressBar.css("width", calculatedWidth + "%");
            progressBar.text(calculatedWidth.toFixed(0) + "%"); // 백분율을 소수점 두 자리까지 표시
       },
       error: function(){
          
       }
    }) 
  });

</script>

            <!-- Recent Sales -->
            <div class="col-12">
               <div class="card recent-sales overflow-auto">
				  <div class="filter">
				  	<a href="/Airport80/hr/empbrd/empbrdList.do" style="padding-right:20px;">전체보기</a>
                  </div>
                  
                  <div class="card-body">
                     <h5 class="card-title">
                        필독<span>  | 사내게시판</span>
                     </h5>

                     <table class="table table-hover">
                        <thead>
                           <tr>
                              <th scope="col">글번호</th>
                              <th scope="col">제목</th>
                              <th scope="col">작성자</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <th scope="row"><a href="/Airport80/hr/empbrd/empbrdView.do?what=${empBordVO[0].ebNo}">No.${empBordVO[0].ebNo}</a></th>
                              <td><span class="badge bg-danger mr10">필독</span> ${empBordVO[0].ebTitle }</td>
                              <td>${empBordVO[0].empNm }</td>
                           </tr>
                           <tr>
                              <th scope="row"><a href="/Airport80/hr/empbrd/empbrdView.do?what=${empBordVO[1].ebNo}">No.${empBordVO[1].ebNo}</a></th>
                              <td><span class="badge bg-danger mr10">필독 </span> ${empBordVO[1].ebTitle }</td>
                              <td>${empBordVO[1].empNm }</td>
                           </tr>
                           <tr>
                              <th scope="row"><a href="/Airport80/hr/empbrd/empbrdView.do?what=${empBordVO[2].ebNo}">No.${empBordVO[2].ebNo}</a></th>
                              <td><span class="badge bg-danger mr10">필독 </span> ${empBordVO[2].ebTitle }</td>
                              <td>${empBordVO[2].empNm }</td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
            <!-- End Recent Sales -->


            <!-- 휴가 신청~~~~~ 시이이작~~~~~~  -->
            <div class="col-12">
               <div class="card">
                  <div class="card-body">
                     <h5 class="card-title">
                        휴가 신청 내역 <span> | 휴가 신청 내역을 확인하세요. </span>
                     </h5>
                     <table class="table table-hover">
                        <thead>
                           <tr>
                              <th scope="col">휴가 아이디</th>
                              <th scope="col">일시</th>
                              <th scope="col">일수</th>
                              <th scope="col">유형</th>
                              <th scope="col">상태</th>
                           </tr>
                        </thead>
                        <c:forEach items="${vacreqList }" var="vacreq" begin="0" end="5">
                           <tbody>
                              <tr>
                                 <td>${vacreq.vrId }</td>
                                 <td>${vacreq.vrStartTs }~${vacreq.vrEndTs }</td>
                                 <td>${vacreq.vrPeriod}</td>
                                 <td><c:choose>
                                       <c:when test="${vacreq.vrType == 'SK'}">병가</c:when>
                                       <c:when test="${vacreq.vrType == 'PD'}">공가</c:when>
                                       <c:when test="${vacreq.vrType == 'AL'}">연차</c:when>
                                       <c:when test="${vacreq.vrType == 'PL'}">출산</c:when>
                                       <c:when test="${vacreq.vrType == 'FE'}">경조사</c:when>
                                       <c:when test="${vacreq.vrType == 'UP'}">무급</c:when>
                                    </c:choose></td>
                                 <td>
                                 <c:choose>
								    <c:when test="${vacreq.vrStatus == 'APP'}"><span style="color: black;">신청</span></c:when>
								    <c:when test="${vacreq.vrStatus == 'APPR'}"><span style="color: green;">승인</span></c:when>
								    <c:when test="${vacreq.vrStatus == 'REJ'}"><span style="color: red;">반려</span></c:when>
								</c:choose>
                                 </td>
                              </tr>
                           </tbody>
                        </c:forEach>
                     </table>

                  </div>

               </div>
            </div>
         </div>
      </div>
      <!-- End Left side columns -->


      <!-- Right side columns -->
      <div style="width: 40%;">
         <script>
         document.addEventListener(
               'DOMContentLoaded',
               function() {
                  var calendarEl = document.getElementById('calendar');

                  var calendar = new FullCalendar.Calendar(
                        calendarEl,
                        {
                           selectable : true,
                           initialView : 'dayGridMonth',
                           events : "<c:url value='/common/calender/scheduleListDS.do'/>",
                           displayEventTime: false,
//                            locale: "ko",

                        headerToolbar: {
                                 start: "",
                                 center: "",
                                 end: "",
                               },
                           googleCalendarApiKey: "AIzaSyBY-EYwkoOXZIRqneemok8c00n5h96lSeg",
                           eventSources: [{ // 구글 캘린더 API 공휴일 데이터 추가
                           googleCalendarId: "ko.south_korea#holiday@group.v.calendar.google.com",
                           backgroundColor: "transparent",
                           borderColor: "transparent",
                           className: "kr-holiday",
                           textColor: "red"
                           }]
                        });
                  
                  calendar.render();
                  });
         </script>
         <!-- End Recent Activity -->

      <!-- Budget Report -->
      <div class="card" style="height: 457px; position: relative;">
          <div class="card-body pb-0">
              <h4 class="card-title">
                  예산 현황 <span>| 금년</span>
              </h4>
              <div style="position: relative; top: 3%; width: 100%; height: 340px;">
    			<canvas id="budgetChart" class="echart" style="position: absolute; left: 0; width: 100%; height: 100%;"></canvas>
			 </div>

               <script>
                  document.addEventListener("DOMContentLoaded", () => {
                      var budgetData = {
                          labels: ['1분기', '2분기', '3분기', '4분기'],
                          datasets: [
                              {
                                  label: '책정예산액',
                                  backgroundColor: 'rgba(255, 99, 132, 0.5)',
                                  borderColor: 'rgba(255, 99, 132, 1)',
                                  borderWidth: 1,
                                  data: [
                                      ${budgetInfo['oneq'].budAmt},
                                      ${budgetInfo['twoq'].budAmt},
                                      ${budgetInfo['threeq'].budAmt},
                                      ${budgetInfo['fourq'].budAmt}
                                  ]
                              },
                              {
                                 label: '사용예산액',
                                 backgroundColor: 'rgba(75, 192, 192, 0.5)',
                                 borderColor: 'rgba(75, 192, 192, 1)',
                                 borderWidth: 1,
                                 data: [
                                     ${usedAmtByQuarter['quarter1']}, // 1분기 사용예산액
                                     ${usedAmtByQuarter['quarter2']}, // 2분기 사용예산액
                                     ${usedAmtByQuarter['quarter3']}, // 3분기 사용예산액
                                     ${usedAmtByQuarter['quarter4']}  // 4분기 사용예산액
                                 ]
                              },
                              {
                                  label: '잔여예산액',
                                  backgroundColor: 'rgba(153, 102, 255, 0.5)',
                                  borderColor: 'rgba(153, 102, 255, 1)',
                                  borderWidth: 1,
                                  data: [
                                      ${budgetInfo['oneq'].budAmt - usedAmtByQuarter['quarter1']},
                                      ${budgetInfo['twoq'].budAmt - usedAmtByQuarter['quarter2']},
                                      ${budgetInfo['threeq'].budAmt - usedAmtByQuarter['quarter3']},
                                      ${budgetInfo['fourq'].budAmt - usedAmtByQuarter['quarter4']}
                                  ]
                              }
                          ]
                      };
                  
                      var ctx = document.getElementById('budgetChart').getContext('2d');
                      var myChart = new Chart(ctx, {
                          type: 'bar',
                          data: budgetData,
                          options: {
                              scales: {
                                  y: {
                                      beginAtZero: true,
                                      title: {
                                          display: true,
                                          text: '단위 : 원'
                                      }
                                  }
                              },
                              plugins: {
                                  legend: {
                                      labels: {
                                          padding: 11
                                      }
                                  }
                              }
                          }
                      });
                  });
               </script>

            </div>
         </div>
         <!-- End Budget Report -->



         <!-- 달력시작 -->
         <div class="card">
            <div class="card-body">
               <h5 class="card-title" style="padding:20px 0px 0px 0px;">
                  <b>2023.09</b> <span> | 사내 일정 </span>
               </h5>
               <div class="activity">
                  <div id='calendar'></div>
               </div>
            </div>
         </div>
         <!-- 달력 끝 -->
      </div>
      <!-- End Right side columns -->

   </div>
</section>