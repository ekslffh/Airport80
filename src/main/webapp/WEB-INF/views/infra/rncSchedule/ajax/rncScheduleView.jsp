<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<table class="table table-bordered" style="margin-top: 10px; margin-bottom: 10px;">
	<tr>
		<th class="table-light thwidth">제목</th>
		<td>${schOne.rsTitle }</td>
		<th class="table-light thwidth">일정ID</th>
		<td>${schOne.rsId }</td>
	</tr>
	<tr>
		<th class="table-light">유형</th>
		<td>${schOne.rtCodeNm}</td>
		<th class="table-light">구분</th>
		<td colspan="3">${schOne.rdCodeNm }</td>
	</tr>
	<tr>
		<th class="table-light">시작일시</th>
		<td>${schOne.rsStartTs.toString().replace("T"," ")}</td>
		<th class="table-light">종료일시</th>
		<td>${schOne.rsEndTs.toString().replace("T"," ")}</td>
	</tr>
	<tr>
		<th class="table-light">위치</th>
		<td >${schOne.zone.zoneFloor }층${schOne.zone.zoneCtgr }</td>
		<th class="table-light">상태</th>
		<td >${schOne.rsCodeNm }</td>
	</tr>
	<tr>
		<th class="table-light">내용</th>
		<td colspan="3" type="text">${schOne.rsContent }</td>
	</tr>
</table>

 <!-- Accordion without outline borders -->
           <div class="accordion accordion-flush" id="accordionFlushExample">
             <div class="accordion-item">
             	<div class="accordion-item">
                  <h2 class="accordion-header" id="flush-headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                   	  <i class="bi bi-plus-square-fill"></i> &nbsp; 처리이력
                    </button>
                  </h2>
                  <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                    <table class="table table-bordered">
                    	<tr>
                    		<th class="table-light">일정 등록일시</th>
                    		<td>${schOne.rsCrtTs.toString().split(':')[0].replace('T', ' ')}:${schOne.rsCrtTs.toString().split(':')[1] }</td>
                    		<c:if test="${schOne.rsCodeNm ne '처리완료'}">
                    		<td>일정 등록일로부터 : + ${daysPassed}일</td>
							</c:if>
                    	</tr>
			            <c:if test="${schOne.rsCodeNm eq '처리완료'}">
			            <tr>
			              <th class="table-light">일정 종료일시</th>
			              <td colspan="2">${schOne.rsUpdTs.toString().split(':')[0].replace('T', ' ')}:${schOne.rsUpdTs.toString().split(':')[1]}</td>
			            </tr>
			            <tr>
			            	<th class="table-light">총 소요일</th>
			            	<td colspan="2">${totalDaysPassed }일</td>
			            	
			            </tr>
			          </c:if>
                    	
                    </table>
                    </div>
                  </div>
                </div>
                
               <h2 class="accordion-header" id="flush-headingOne">
                 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne" style="color: #4154f1;">
                  <i class="bi bi-plus-square-fill"></i> &nbsp; 처리완료
                 </button>
               </h2>
               <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                 <div class="accordion-body">
                 
                 <!-- Horizontal Form -->
			<form:form method="post" modelAttribute="schOne" id="statusForm">		
				<input type="hidden" name="rsId" value="${schOne.rsId}" id="rsId" />

				<div class="row mb-3" >
					<label for="inputPassword3" class="col-sm-2 col-form-label">처리일시</label>
					<div class="col-sm-10">
						<form:input class="form-control" type="datetime-local" path="rsEndTs"/>
					</div>
				</div>
				
				 <div class="col-sm-10">
				 	<label>사용한 품목</label>
    <input type="text" class="form-control" id="searchInput" placeholder="재고 검색..." autocomplete="off" />
</div>

<!-- 검색 결과 리스트 -->
<ul id="searchResults"></ul>

<!-- 선택된 재고 정보 표시 -->
<div id="stockInfoContainer"></div>
				<!-- 추가된 부분: 재고 검색 결과를 표시할 테이블 -->
<table class="table table-bordered" id="waitStock">
    <thead>
        <tr>
            <th></th>
            <th>제품명</th>
            <th>재고량</th>
        </tr>
    </thead>
    <tbody>
        <!-- 검색 결과가 여기에 동적으로 추가될 것입니다 -->
    </tbody>
</table>
				<div class="text-center">
					<button type="button" class="btn btn-primary rncReqBtn" data-dismiss="modal">완료</button>
					<button type="reset" class="btn btn-secondary">취소</button>
				</div>
			</form:form>
<!-- End Horizontal Form -->
                 
                 </div>
               </div>
             </div>
           </div>
<!-- End Accordion without outline borders -->

<script>
//완료상태 업데이트 폼 제출
// $("#statusForm").submit(function(event){
// 	event.preventDefault(); 
// 	alert("success");
// 	$.ajax({
// 		type: 'POST',
// 		url: '<c:url value="/safety/secCompltUpdate.do"/>',
// 		data: $(this).serialize(),
// 		success: function (response){
// 			if(response == "success") {
// 				alert("완료 처리가 되었습니다.");
// 				//페이지 리로딩
// 				securityBoard();
// 				//모달닫기
// 				$('#disablebackdrop').modal('hide');
				
// 			}else {
// 				alert("완료처리가 실패했습니다.");
// 			}
// 		},
// 		 error: function (xhr, status, error) {
//              console.error(error);
//          }
// 	});
// });
// 페이지 로드 시 실행
// document.addEventListener('DOMContentLoaded', function () {
//     var rrStts = '${schOne.rrStts}'; // RR_STTS 값을 가져옴
//     console.log(rrStts);
//     var pcSection = document.getElementById('flush-headingOne'); // 처리완료 섹션의 헤더
//     var pcSectionBody = document.getElementById('flush-collapseOne'); // 처리완료 섹션의 내용

//     if (rrStts === 'PC') {
//         // RR_STTS가 'PC'인 경우 섹션 숨기기
//         pcSection.style.display = 'none';
//         pcSectionBody.style.display = 'none';
//     } else {
//         // RR_STTS가 'PC'가 아닌 경우 섹션 보이기
//         pcSection.style.display = 'block';
//         pcSectionBody.style.display = 'block';
//     }
// });

$(document).on('mouseenter', '#searchResults li', function () {
    // 마우스 커서를 가져갔을 때 배경 색상 변경 및 커서 스타일 변경
    $(this).css({
        'background-color': 'skyblue',
        'cursor': 'pointer'
    });
}).on('mouseleave', '#searchResults li', function () {
    // 마우스 커서가 벗어났을 때 배경 색상 원래대로 변경 및 커서 스타일 원래대로 변경
    $(this).css({
        'background-color': '',
        'cursor': ''
    });
});

$(document).ready(function() {
    var rsCodeNm = "${schOne.rsCodeNm}";

    if (rsCodeNm === "처리완료") {
        // rsCodeNm이 "처리완료"인 경우 처리완료 아코디언을 숨깁니다.
        $("#flush-collapseOne").css("display", "none");
    }
});

$(document).ready(function () {
    // 검색어 입력창에 입력할 때마다 실시간 검색 결과 출력
    $('#searchInput').on('input', function () {
        var searchKeyword = $(this).val();
        // 검색어가 비어있으면 검색 결과를 지움
        if (searchKeyword === '') {
            clearSearchResults();
        } else {
            // 서버에 검색 요청하고 검색 결과를 받아와서 리스트를 업데이트하는 함수 호출
            updateSearchResults(searchKeyword);
        }
        
        
    });
    
    
    $('.rncReqBtn').click(function () {
    	
        // 처리일시와 사용한 품목 정보 가져오기
        var rsEndTs = $('#statusForm input[name="rsEndTs"]').val();
        var selectedStocks = [];
        var rsId = $("#rsId").val();
        $('#waitStock tbody tr').each(function () {
            var stId = $(this).find('td:nth-child(1)').text();
            var stName = $(this).find('td:nth-child(2)').text();
            var quantity = $(this).find('td:nth-child(3)').text();
            selectedStocks.push({ stId: stId, stName: stName, quantity: quantity });
        });

        var dataToSend = {
                rsEndTs: rsEndTs,
                selectedStocks: selectedStocks,
                rsId : rsId
            };
        console.log(dataToSend);
        // 서버로 데이터 전송
        $.ajax({
            type: 'POST',
            url: '<c:url value="/infra/scheduleUpdate.do"/>', // 수정 필요한 URL로 변경
            data: JSON.stringify(dataToSend),
            contentType: "application/json",
            success: function (res) {
                console.log(res);
                if (res.response === 'success') {
                    Swal.fire({
                        icon: 'success',
                        text: '완료 처리 되었습니다.',
                        timer: 1000, // 1초 후에 닫힘
                        showConfirmButton: false // 확인 버튼 감춤
                    });
                    setTimeout(function() {
                        location.href = "${pageContext.request.contextPath}/infra/rncScheduleList.do";
                    }, 1000);
                } else {
                    Swal.fire({
                        icon: 'error',
                        text: '완료 처리에 실패했습니다.',
                        timer: 1000, // 1초 후에 닫힘
                        showConfirmButton: false // 확인 버튼 감춤
                    });
                    setTimeout(function() {
                        location.href = "${pageContext.request.contextPath}/infra/rncScheduleList.do";
                    }, 1000);
                }
                var largeModal = new bootstrap.Modal(document.getElementById("largeModal"));
                largeModal.hide();
            },
            error: function (xhr, status, error) {
                console.error(error);
            }
        });
    });
    // 검색 결과 항목 클릭 시 처리
    $(document).on('click', '#searchResults li', function () {
     var stId = $(this).data('stId');
     var stName = $(this).text();

     // Create the input elements for stock information
     var stockInfoContainer = $('#stockInfoContainer');
     stockInfoContainer.empty();

     var newRow = $('<div>').addClass('stock-row');
     var stIdInput = $('<input>').attr({
         type: 'text',
         class: 'inputStId form-control',
         value: stId,
         readonly: true
     });

     var stNameInput = $('<input>').attr({
         type: 'text',
         class: 'inputStName form-control',
         value: stName,
         readonly: true
     });

     var quantityInput = $('<input>').attr({
         type: 'number',
         class: 'inputQuantity form-control',
         placeholder: 'Enter quantity'
     });

     var addRowButton = $('<button>').text('Add Row').click(function () {
         var newRow = $('<tr>').append(
             $('<td>').text(stId),
             $('<td>').text(stName),
             $('<td>').text(quantityInput.val())
         );

         $('#waitStock tbody').append(newRow);

         // Clear input fields after adding a row
         $('.inputStId').val('');
         $('.inputStName').val('');
         $('.inputQuantity').val('');

         // Clear the stock information container
         $('#stockInfoContainer').empty();
     });

     var addRowContainer = $('<div>').append(addRowButton);
     stockInfoContainer.append('품번: ', stIdInput, ' 품명: ', stNameInput, ' 사용한수량: ', quantityInput, addRowContainer);
 });

    // 검색어 입력창에 입력할 때마다 처리
    $('#searchForm').on('keyup', function (event) {
        if (event.keyCode == 2 || event.keyCode == 30 || $('#searchForm').val() == null || $('#searchForm').val() == '') {
            $("#waitPatnt").empty();
            
        } else {
            var searchKeyword = $('#searchForm').val();
            // 여기에서 원하는 로직을 추가하거나 함수를 호출할 수 있습니다
            if (searchKeyword.trim() === '') {
                clearSearchResults();
            } else {
                updateSearchResults(searchKeyword);
            }
        }
    });

    // 완료상태 업데이트 폼 제출 등 다른 코드도 이곳에 추가 가능
});

// 검색 결과 업데이트하는 함수
function updateSearchResults(searchKeyword) {
    $.getJSON("<c:url value='/infra/stockSearch.do'/>", { stNm: searchKeyword })
        .done(function (resp) {
            var $searchResultsList = $('#searchResults');
            $searchResultsList.empty();
            
            // 검색 결과 표시
            $.each(resp, function (index, result) {
                var listItem = $('<li>').text(result.stNm);
                listItem.data('stId', result.stId);
                $searchResultsList.append(listItem);
            });
        })
        .fail(function (jqxhr, textStatus, error) {
            console.log("Error:", textStatus, error);
        });
}
function clearSearchResults() {
    var $searchResultsList = $('#searchResults');
    $searchResultsList.empty();
}

$(document).ready(function () {
    var addButton = $('<button>').text('Add Row').click(function () {
        var stId = $('.inputStId').val();
        var stName = $('.inputStName').val();
        var quantity = $('.inputQuantity').val();

        var newRow = $('<tr>').append(
            $('<td>').text(stId),
            $('<td>').text(stName),
            $('<td>').text(quantity)
        );

        $('#waitStock tbody').append(newRow);
    });

    $('#stockInfoContainer').append(addButton);
});


</script>