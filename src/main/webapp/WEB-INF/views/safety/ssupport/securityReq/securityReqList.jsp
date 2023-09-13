<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>


<script>
	<c:if test="${not empty message }">
	alert("${message}");
	</c:if>

	$(document).on("ajaxError", function(jqXHR, settings, errorText) {
		console.log("XMLHttpRequest : ", jqXHR);
		console.log("settings : ", settings);
		console.log("error : ", errorText);
	});
</script>



<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title"></h5>


					<div class="d-flex" style="justify-content: space-between;">
					<button type="button" class="btn btn btn-dark" data-bs-toggle="modal" data-bs-target="#verticalycentered" style="height: 40px; width: 70px; font-size: 17px;">
 						chart
					</button>

					<table class="table table-bordered" style="width: 370px;">
						<tr class="table-secondary">
							<th style="width: 17%;" class="text-center">총</th>
							<th style="width: 17%;" class="text-center">요청</th>
							<th style="width: 17%;" class="text-center">접수</th>
							<th style="width: 17%;" class="text-center">완료</th>
							<th class="text-center">평균처리시간</th>
						</tr>
						<tr>
							<td class="text-center">${process.countReq}</span>건</td>
							<td class="text-center">${countReq }건</td>
							<td class="text-center">${countRec }건</td>
							<td class="text-center">${countComp }건</td>
							<td class="text-center">${process.prosTime}</td>
						</tr>
					</table>
					</div>
					
			
						
						
					<ul class="d-flex reqstus">
						<li><span class="req"></span>요청</li>
						<li><span class="rec"></span>접수</li>
					</ul>
					<div>
						<table class="table Default Table">
							<tbody class="table-primary">
								<tr>
									<th>요청ID</th>
									<th>카테고리</th>
									<th>위치</th>
									<th>요청일시</th>
									<th>작성자</th>
									<th>상태</th>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="req-body" style="height: 444px;">
						<table class="table table-hover">
							<tbody id="listBody">
								<c:if test="${empty secReq }">
									<tr>
										<td colspan="4">보안요청 없음.</td>
									</tr>
								</c:if>
								<c:if test="${not empty secReq }">
									<c:forEach items="${secReq }" var="secReq">
										<tr>
											<td><a href="javascript:;" data-who="${secReq.srId}" data-where="${secReq.zone.zoneCd}" data-ca="${secReq.common.codeCont}" data-bs-toggle="modal" data-bs-target="#disablebackdrop" class="secReqid" >${secReq.srId } </a></td>
											<td>${secReq.srCa }</td>
											<td>${secReq.zone.zoneFloor }층${secReq.zone.zoneCtgr }</td>
											<td>${secReq.srTs.toString().split(':')[0].replace('T', ' ')}:${secReq.srTs.toString().split(':')[1]}</td>
											<td style="width: 60px;">${secReq.srReqMem }</td>

											<c:if test="${secReq.srStatus eq '요청' }">
												<td style="width: 61px;"><span class="commstatus">${secReq.srStatus }</span></td>
											</c:if>
											<c:if test="${secReq.srStatus eq '접수' }">
												<td style="width: 61px;"><span class="reqstatus">${secReq.srStatus }</span></td>
											</c:if>

										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>





				<c:url value="/safety/securityView.do" var="viewURL" />

				<!-- Disabled Backdrop Modal -->
				<div class="modal fade" data-url="${viewURL}" id="disablebackdrop" tabindex="-1" data-bs-backdrop="false">
					<div class="modal-dialog" style="margin-top: 200px; margin-right: 120px;">
						<div class="modal-content" style="box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);">
							<div class="modal-header">
								<h5 class="modal-title">보안지원접수</h5>
								<button type="button" class="btn-close poff" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">...</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary poff" id="closemodal" data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- End Disabled Backdrop Modal-->
				
				<c:url value="/safety/chartView.do" var="chartURL" />

			<!-- Vertically centered Modal -->
              <div class="modal fade" data-url="${chartURL}" id="verticalycentered" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">보안접수 현황 차트</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="cmodal-body echart" style="min-height: 400px; margin-top:15px"></div>
                    		
                    		
                   	<div class="info" style="width:100%; width: 94%; margin-left: 14px; margin-right: 14px;">
						<p class="cofistooltip" style="margin-bottom: 0;">
							<i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 구역별 카테고리유형 접수 건수 현황 차트 입니다.
						</p>
					</div>                    
                    
                    
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Vertically centered Modal-->
                    	
	

<script>
console.log("hello");

var myEchart;

// 모달창 상세조회 
$(disablebackdrop).on("show.bs.modal", function(event){
   let who = event.relatedTarget.dataset['who'];
   let $modalBody = $(this).find(".modal-body");
   let viewURL = this.dataset['url'];
   if(who){
      let settings = {
            url : viewURL,
            dataType : "html",
            data : {
               who : who
            },
            success : function(resp){
               $modalBody.html(resp);
            }
      }
      $.ajax(settings);
   }
}).on("hidden.bs.modal", function(event){
   let $modalBody = $(this).find(".modal-body");
   $modalBody.empty();
});


//차트 불러오는 모달
$(verticalycentered).on("show.bs.modal", function(event){
   event.stopPropagation();
   
   let $cmodalBody = $(this).find(".cmodal-body");
   
       
   $cmodalBody.html();
   let chartURL = this.dataset['url'];
		
		var chartContainer = document.querySelector('.cmodal-body');
    // 높이와 너비 설정
    chartContainer.style.width = '500px'; // 원하는 너비로 설정
    chartContainer.style.height = '400px'; // 원하는 높이로 설정
   $.ajax({
       url: "${pageContext.request.contextPath }/safety/chart/getChart.do",
       dataType: 'json',
       success: function (data) {
    	   if (myEchart) {
    		   myEchart.dispose();
    	   } 
    	   
       	myEchart = echarts.init(chartContainer);
       	myEchart.setOption({
               angleAxis: {
                 type: 'category',
                 data: ['1층 게이트', '1층 일반', '1층 입국', '2층 게이트', '2층 일반', '2층 면세']
               },
               radiusAxis: {},
               polar: {},
               series: [{
                   type: 'bar',
                   data: [data.countF1cro, data.countC1cro, data.countM1cro, data.countF2cro, data.countC2cro, data.countM2cro],
                   coordinateSystem: 'polar',
                   name: '혼잡',
                   stack: 'a',
                   emphasis: {
                     focus: 'series'
                   }
                 },
                 {
                   type: 'bar',
                   data: [data.countF1per, data.countC1per, data.countM1per, data.countF2per, data.countC2per, data.countM2per],
                   coordinateSystem: 'polar',
                   name: '수상한 사람',
                   stack: 'a',
                   emphasis: {
                     focus: 'series'
                   }
                 },
                 {
                   type: 'bar',
                   data: [data.countF1art, data.countC1art, data.countM1art, data.countF2art, data.countC2art, data.countM2art],
                   coordinateSystem: 'polar',
                   name: '수상한 물건',
                   stack: 'a',
                   emphasis: {
                     focus: 'series'
                   }
                 },
                 {
                   type: 'bar',
                   data: [data.countF1oth, data.countC1oth, data.countM1oth, data.countF2oth, data.countC2oth, data.countM2],
                   coordinateSystem: 'polar',
                   name: '기타',
                   stack: 'a',
                   emphasis: {
                     focus: 'series'
                   }
                 }
               ],
               legend: {
                 show: true,
                 data: ['혼잡', '수상한 사람', '수상한 물건', '기타']
               }
             });
       },
       error: function (error) {
           console.error(error);
       }
   });
      
}).on("hidden.bs.modal", function(event){
   let $cmodalBody = $(this).find(".cmodal-body");
   $cmodalBody.empty();
});

//게시글 클릭시 상태변경 
$(document).ready(function(){
	 
	
   $(document).on("click", '.secReqid', function(event){
      event.preventDefault();//기본동작 방지
      

      let who = $(this).data('who');
      
      let viewURL = "${pageContext.request.contextPath }/safety/secStatus.do";

      function formatDate(dateArray) {
          const year = dateArray[0];
          const month = String(dateArray[1]).padStart(2, '0');
          const day = String(dateArray[2]).padStart(2, '0');
          const hours = String(dateArray[3]).padStart(2, '0');
          const minutes = String(dateArray[4]).padStart(2, '0');
          
          return year + '-' + month + '-' + day + " " + hours + ":" + minutes;
      }
      

      // 서버로 데이터 전송 및 응답 처리
      $.ajax({
         url: viewURL,
         method: 'POST',
         data : { who : who }, // 전달할 데이터
         success : function(response){
            console.log(response.resp);
             // 상태 변경 후 리스트 다시 가져오기'
               let dataList = response.data;
             let trTags = null;
            if (response.resp == "OK") {
               trTags = [];
               console.log("status OK");
               $.each(dataList, function(index, data) {
                  
                  let customClass = '';
                  //srStatus 값에 따라 클래스 지정
                  if(data.srStatus == '요청'){
                     customClass = 'commstatus';
                  }else if (data.srStatus == '접수'){
                     customClass = 'reqstatus';
                  }
                  
                  let tr = $("<tr>").append(
                         $("<td>").append(
                               $("<a>")
                                   .attr("href", "javascript:;")
                                   .attr("data-who", data.srId)
                                   .attr("data-where", data.zone.zoneCd)
                                   .attr("data-bs-toggle", "modal")
                                   .attr("data-bs-target", "#disablebackdrop")
                                   .addClass("secReqid")
                                   .text(data.srId)
                           ),
                           $("<td>").text(data.srCa),
                           $("<td>").text(data.zone.zoneFloor + "층 " + data.zone.zoneCtgr),
                           $("<td>").text(formatDate(data.srTs)),
                           $("<td>").css("width", "60px").text(data.srReqMem),
                           $("<td>").css("width", "61px").append($("<span>").addClass(customClass).text(data.srStatus))
                        
                     ).addClass("datatr")
                     .data("id", data.srId)
                     .data("source", data);
                     trTags.push(tr);
               });

               } else { // FAIL
               alert(response.msg);
               trTags = '<tr><td colspan="4">보안접수 없음</td></tr>';
            }
             $(listBody).html(trTags);
            
         },
         error:function(error){
            console.error(error);
         }
      });
   });
});
</script>