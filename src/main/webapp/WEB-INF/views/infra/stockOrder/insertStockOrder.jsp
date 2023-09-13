<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<security:authentication property="principal.realUser" var="authMember" />
<style>
.center-align {
	text-align: center;
}
</style>


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="card-header"
						style="padding-bottom: 5px; margin-bottom: 15px;">
						<div class="card-header"
							style="padding-bottom: 5px; margin-bottom: 15px;">
							<h5 class="card-tit">발주등록</h5>
							<nav>
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html"><i
											class="bi bi-house-door"></i></a></li>
									<li class="breadcrumb-item"><a href="#">재고관리</a></li>
									<li class="breadcrumb-item active">발주</li>
								</ol>
							</nav>
						</div>
						<section class="section">
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title"></h5>
											<form:form method="post" modelAttribute="stockOrder">
												<table class="table Default Table">
													<tr>
														<th>카테고리</th>
														<td><select name="commonCode"
															class="form-select commonCode"
															onchange="updateSupplierOptions()">
																<option value="" label="카테고리" />
																<c:forEach items="${commonCode }" var="cCode">
																	<option value="${cCode.codeId }">
																		${cCode.codeNm }</option>
																</c:forEach>
														</select></td>
													</tr>
													<tr>
														<th>거래처선택</th>
														<td><select name="supplier"
															class="form-select supplier"
															onchange="updateStockOptions()">
																<option value="" label="거래처선택" />
																<c:forEach items="${supplier }" var="sup">
																	<option value="${sup.sprId}" class="${sup.sprGu }">${sup.sprNm }</option>
																</c:forEach>
														</select></td>
													</tr>
												</table>
												<table>
													<thead>
														<tr>
															<th><input type="checkbox" id="selectAllCheckbox"
																onchange="toggleSelectAll()"><label
																for="selectAllCheckbox">전체 선택</label> <input
																type="button" class="btn btn-outline-dark deletebtn"
																value="품목추가" onclick="addRow()"> <input
																type="button" class="btn btn-outline-dark deletebtn"
																value="삭제" onclick="deleteCheckedRows()"> <input
																type="button" class="btn btn-outline-dark deletebtn"
																value="초기화" onclick="showConfirmModal()"></th>
														</tr>
													</thead>
												</table>


												<table class="table Default Table" id="itemTable">
													<thead>
														<tr>
															<th></th>
															<th>품명</th>
															<th>품번</th>
															<th>발주단위</th>
															<th>단가</th>
															<th>현재고</th>
															<th>발주수량</th>
															<th>금액</th>
														</tr>
													</thead>
													<tbody id="itemTableBody">
														<tr id="noItemsMessageRow">
															<td colspan="8">추가된 내역 없음</td>
														</tr>
													</tbody>
													<tfoot>
														<tr>
															<th colspan="7"></th>
															<th colspan="1" class="center-align" id="totalAmountCell">총금액
																:</th>
														</tr>
														<tr>
															<th colspan="7"></th>
															<th colspan="1">
																<button type="button" value="발주하기"
																	onclick="showSelectedItemsModal()"
																	class="btn btn-primary">발주하기</button>
															</th>
														</tr>
													</tfoot>
												</table>
											</form:form>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- 모달 창 -->
						<div class="modal" id="confirmModal" tabindex="-1" role="dialog">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">초기화 확인</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">전체삭제하시겠습니까?</div>
									<div class="modal-footer">
										<!-- 아니오 버튼에 data-dismiss 속성 추가 -->
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal" id="confirmCancelButton">아니오</button>
										<!-- "네" 버튼에 id 추가 -->
										<button type="button" class="btn btn-primary"
											id="confirmClearButton">네</button>
									</div>
								</div>
							</div>
						</div>




						<!-- Full Screen Modal -->
						<div class="modal fade" id="fullscreenModal" tabindex="-1">
							<div class="modal-dialog modal-fullscreen">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">발주서</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body" style="padding: 200px;"
										id="selectedItemsList"></div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
										<button type="button" class="btn btn-primary"
											id="submitOrderBtn">발주</button>
									</div>
								</div>
							</div>
						</div>
						<!-- End Full Screen Modal-->


					</div>
				</div>
			</div>
		</div>
</section>

<script type="text/javascript">

	// 카테고리 선택 시 실행되는 함수
	function updateSupplierOptions() {
		
	    var selectedCategory = document.getElementsByName("commonCode")[0].value;
	    console.log(selectedCategory)
	    var supplierSelect = document.getElementsByName("supplier")[0];
	    var supplierOptions = supplierSelect.options;
	
	    // 모든 옵션 숨기기
	    for (var i = 0; i < supplierOptions.length; i++) {
	        supplierOptions[i].style.display = "none";
	    }
	
	    if (selectedCategory === "") {
	        // 선택되지 않은 카테고리일 때 모든 거래처 옵션 표시
	        for (var i = 0; i < supplierOptions.length; i++) {
	            supplierOptions[i].style.display = "block";
	        }
	    } else {
	        // 선택한 카테고리에 해당하는 거래처 옵션만 표시
	        for (var i = 0; i < supplierOptions.length; i++) {
	            var supplier = supplierOptions[i];
	            if (supplier.classList.contains(selectedCategory)) {
	                supplier.style.display = "block";
	            }
	        }
	    }
	}
	
	// 거래처 선택 시 실행되는 함수
	function updateStockOptions() {
		
		console.log("update")
		console.log(authMember);
	}

	// 페이지 로드 시 초기 설정
	window.onload = function () {
	    checkAndDisplayMessage();
	};
	
	// 내역 유무를 확인하고 메시지를 표시 또는 숨김
	function checkAndDisplayMessage() {
	    var tbody = document.querySelector("#itemTable tbody");
	    var messageRow = document.querySelector("#noItemsMessageRow");
	
	    if (tbody.children.length === 0) {
	        messageRow.style.display = "table-row";
	    } else {
	        messageRow.style.display = "none";
	    }
}  

	
	
	// 재고 선택 후 정보 입력 폼 채우기
	function populateInputFields(event) {
		var et = $(event.target);
		let selectedStId = et.val();
		let etfnd = et.find("option:selected");
		let selectedStUnit = etfnd.data("unit");
		let selectedStPrice = etfnd.data("price");
		let selectedStQuantity = etfnd.data("quantity");
		let selectedStNm = etfnd.text();
		//console.log(selectedStNm);
		//console.log(selectedStId);
// 		this.value, this.options[this.selectedIndex].getAttribute('data-unit'), this.options[this.selectedIndex].getAttribute('data-price'), this.options[this.selectedIndex].getAttribute('data-quantity')

		var trparent = $(event.target).parents("tr:first");
	   
		  	var stIdInput = trparent.find('input[name="stId"]');
		    var stUnitInput = trparent.find('input[name="stUnit"]'); // 수정된 부분
		    var stPriceInput = trparent.find('input[name="stPrice"]'); // 수정된 부분
		    var stQuantityInput = trparent.find('input[name="stQuantity"]'); // 수정된 부분
		    
	    	var stNmInput = trparent.find();
		    
	    stIdInput.val(selectedStId);
	    stUnitInput.val(selectedStUnit);
	    stPriceInput.val(selectedStPrice);
	    stQuantityInput.val(selectedStQuantity);
	    stNmInput.val(selectedStNm);
	    console.log(stNmInput);
	    trparent.find('input[name="stNm"]').val(selectedStNm);
	}
	
	// 발주수량 입력했을 때 호출되는 함수
	function calculateAmount(event) {
	    var trparent = $(event.target).parents("tr:first");
	    var stPrice = parseFloat(trparent.find('input[name="stPrice"]').val());
	    var soCnt = parseFloat(trparent.find('input[name="soCnt"]').val());
	    var sAccountInput = trparent.find('input[name="sAccount"]');
	    
	    var calculatedAmount = stPrice * soCnt;
	    sAccountInput.val(calculatedAmount);
	    
	    calculateTotalAmount();
	}
	
	
	// 총금액 계산 함수
	function calculateTotalAmount() {
	    var totalAmount = 0;
	    var sAccountInputs = document.getElementsByName("sAccount");
	    
	    for (var i = 0; i < sAccountInputs.length; i++) {
	        var sAccount = parseFloat(sAccountInputs[i].value);
	        if (!isNaN(sAccount)) {
	            totalAmount += sAccount;
	        }
	    }
	    
	    var totalAmountCell = document.querySelector("#totalAmountCell");
	    
	 // 총금액을 형식화하여 패턴을 적용한 문자열로 변경
	    var formattedTotalAmount = new Intl.NumberFormat("ko-KR", {
	        style: "decimal",
	        minimumFractionDigits: 0,
	        maximumFractionDigits: 0
	    }).format(totalAmount);
	 
	    totalAmountCell.textContent = "총금액 : " + formattedTotalAmount;
	}
	
	
	// 추가 버튼을 누를 때 호출되는 함수
	function addRow() {
	    var sList = [];
	    <c:forEach items="${stockList }" var="stock">
	        var temp = {};
	        temp.stId = '${stock.stId}';
	        temp.stNm = '${stock.stNm}';
	        temp.stSprId = '${stock.stSprId}';
	        temp.stUnit = '${stock.stUnit}'; 
	        temp.stPrice = '${stock.stPrice}'; 
	        temp.stQuantity = '${stock.stQuantity}';
	        sList.push(temp);
	    </c:forEach>
	        
	    var selectedSupplierValue = document.querySelector('select[name="supplier"]').value;
	    console.log(selectedSupplierValue);
	    
	    console.log(sList);
	    var fList = sList.filter(s => selectedSupplierValue === s.stSprId);
	    console.log(fList);
		
	    // 얘는 for문 돌리고 
	    // 새로 추가한 행의 정보를 객체에 저장
	    var newRowInfo = {
	        stId: fList[0].stId,
	        stUnit: fList[0].stUnit,
	        stPrice: fList[0].stPrice,
	        stQuantity: fList[0].stQuantity
	        // 필요한 다른 정보도 여기에 추가할 수 있음
	        // 품번이 null값인것을 찾아서 넣기 
	    };
	    
	    
	    var tableBody = document.querySelector("#itemTableBody");
	    var newRow = document.createElement("tr");
	    var data = ``;
	    
	    data +=  `<td><input type="checkbox" class="itemCheckbox" /></td>
	                <td>
	                <select name="stockList" class="form-select stock" onchange="populateInputFields(event);">
	                <option value="" label="재고선택" />
	                `;
	    
	    for (let i = 0; i < fList.length; i++) {
	    	data += `<option value=\${fList[i].stId} data-unit=\${fList[i].stUnit} data-price=\${fList[i].stPrice} data-quantity=\${fList[i].stQuantity}>\${fList[i].stNm}</option>`;
	    }		
		
	
		
	    data += `</select></td>
	    	 <td><input class="form-control" type="text" name="stId" value="" readonly/></td>
	        <td><input class="form-control" type="text" name="stUnit" value="" readonly /></td>
	        <td><input class="form-control" type="number" name="stPrice" value="" readonly /></td>
	        <td><input class="form-control" type="number" name="stQuantity" value="" readonly /></td>
	        <td><input class="form-control" type="number" name="soCnt" oninput="calculateAmount(event);" /></td>
	        <td><input class="form-control" type="number" name="sAccount" value="" readonly /></td>
	        <td><input class="form-control" type="hidden" name="stNm" value="" /></td>
	    `;
          newRow.innerHTML = data;
          tableBody.appendChild(newRow);
          
          // 내역 유무를 확인하고 메시지를 업데이트
          checkAndDisplayMessage();
    }

	// 체크박스 전체선택
	function toggleSelectAll() {
	    var selectAllCheckbox = document.getElementById("selectAllCheckbox");
	    var checkboxes = document.querySelectorAll(".itemCheckbox");

	    for (var i = 0; i < checkboxes.length; i++) {
	        checkboxes[i].checked = selectAllCheckbox.checked;
	    }
	}
    // 체크박스 체크 시 호출되는 함수
    function deleteCheckedRows() {
        var checkboxes = document.querySelectorAll(".itemCheckbox");
        var tableBody = document.querySelector("#itemTableBody");

        for (var i = checkboxes.length - 1; i >= 0; i--) {
            if (checkboxes[i].checked) {
                tableBody.removeChild(checkboxes[i].parentNode.parentNode);
            }
        }

        // 내역 유무를 확인하고 메시지를 업데이트
        checkAndDisplayMessage();
    }
    

    // 초기화 버튼을 누를 때 호출되는 함수
    function clearAllRows() {
        var tableBody = document.querySelector("#itemTableBody");
        tableBody.innerHTML = ''; // 모든 내용 삭제

        // 내역 유무를 확인하고 메시지를 업데이트
        checkAndDisplayMessage();
    }
    
    
    // 모달 창 표시 함수
    function showConfirmModal() {
        $('#confirmModal').modal('show');
    }

    // 초기화 버튼을 누를 때 호출되는 함수
    function clearAllRows() {
        var tableBody = document.querySelector("#itemTableBody");
        tableBody.innerHTML = ''; // 모든 내용 삭제

        // 내역 유무를 확인하고 메시지를 업데이트
        checkAndDisplayMessage();

        // 모달 창 닫기
        $('#confirmModal').modal('hide');
    }

    // "네" 버튼에 click 이벤트 연결
    document.getElementById("confirmClearButton").addEventListener("click", clearAllRows);

    // "아니오" 버튼에 click 이벤트 연결
    document.getElementById("confirmCancelButton").addEventListener("click", function () {
        // "아니오" 버튼을 눌렀을 때 실행될 작업
        // 아무 작업 없음 (모달 창만 닫히도록 처리)
        $('#confirmModal').modal('hide'); // 모달 창 닫기
    });

    // "네" 버튼을 눌렀을 때 실행될 작업
    document.getElementById("confirmClearButton").addEventListener("click", function () {
        // 모달 창 닫기
        $('#confirmModal').modal('hide');
    });
    
    
 // 모달 발주 확인창  
    function showSelectedItemsModal() {
        var selectedItemsList = document.getElementById("selectedItemsList");
        selectedItemsList.innerHTML = ""; // 모달 내용 초기화

     // 제목 "발주서"를 추가
        var modalTitle = document.createElement("h5");
        modalTitle.textContent = "발주서";
        
     // 모달 내용에 제목을 추가
        selectedItemsList.appendChild(modalTitle);
     
        // 글꼴 스타일을 지정 (예: 진하게, 크게)
        modalTitle.style.fontWeight = "bold"; // 진하게
        modalTitle.style.fontSize = "24px"; // 크게

        var checkboxes = document.querySelectorAll(".itemCheckbox");
        var totalAmount = 0;

        // 첫 번째 테이블 생성 (거래처 정보 출력)
        var supplierTable = document.createElement("table");
        supplierTable.className = "table table-bordered";
        var supplierTbody = document.createElement("tbody");

        var selectedSupplier = document.querySelector(".supplier");
        var selectedSupplierId = selectedSupplier.value;
        var selectedSupplierName = selectedSupplier.options[selectedSupplier.selectedIndex].text;

        var supplierRow = document.createElement("tr");
        
        // 첫 번째 칸 (발주업체 아이디)
        var supplierIdCell = document.createElement("th");
        supplierIdCell.textContent = "발주업체 아이디 ";
        supplierRow.appendChild(supplierIdCell);
        
        // 두 번째 칸 (sprId)
        var sprIdCell = document.createElement("th");
        sprIdCell.textContent =  selectedSupplierId;
        supplierRow.appendChild(sprIdCell);
        
        // 세 번째 칸 (발주업체)
        var supplierCell = document.createElement("th");
        supplierCell.textContent = "발주업체 ";
        supplierRow.appendChild(supplierCell);
        
        // 네 번째 칸 (sprNm)
        var sprNmCell = document.createElement("th");
        sprNmCell.textContent = selectedSupplierName;
        supplierRow.appendChild(sprNmCell);
        
        supplierTbody.appendChild(supplierRow);
        supplierTable.appendChild(supplierTbody);

        selectedItemsList.appendChild(supplierTable);


        // 두 번째 테이블 생성 (품목 정보 출력)
        var itemsTable = document.createElement("table");
        itemsTable.className = "table table-bordered";
        var itemsThead = document.createElement("thead");
        var itemsHeaderRow = document.createElement("tr");
        var itemsHeaders = ["품번", "품명", "발주수량", "금액"];
        for (var i = 0; i < itemsHeaders.length; i++) {
            var th = document.createElement("th");
            th.textContent = itemsHeaders[i];
            itemsHeaderRow.appendChild(th);
        }
        itemsThead.appendChild(itemsHeaderRow);
        itemsTable.appendChild(itemsThead);

        var itemsTbody = document.createElement("tbody");
        
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
            	 var tr = checkboxes[i].closest("tr");
                 var stId = tr.querySelector('input[name="stId"]').value;
                 var stNm = tr.querySelector('input[name="stNm"]').value;
                 var soCnt = tr.querySelector('input[name="soCnt"]').value;
                 var calculatedAmount = parseFloat(tr.querySelector('input[name="sAccount"]').value);

                 totalAmount += calculatedAmount;
                 
                 var row = document.createElement("tr");
                 var cell1 = document.createElement("td");
                 cell1.textContent = stId;
                 row.appendChild(cell1);
                 var cell2 = document.createElement("td");
                 cell2.textContent = stNm;
                 row.appendChild(cell2);
                 var cell3 = document.createElement("td");
                 cell3.textContent = soCnt;
                 row.appendChild(cell3);
                 var cell4 = document.createElement("td");
                 cell4.textContent = calculatedAmount.toLocaleString("ko-KR", {
                     style: "currency",
                     currency: "KRW"
                 });
                 row.appendChild(cell4);
                 itemsTbody.appendChild(row); // 품목 정보 행을 tbody에 추가
            }
        }
        
        var itemsTotalRow = document.createElement("tr");
        var itemsTotalCell = document.createElement("td");
        itemsTotalCell.textContent = "총 금액";
        itemsTotalCell.colSpan = 3; // 3개의 열을 병합
        itemsTotalRow.appendChild(itemsTotalCell);
        var itemsTotalAmountCell = document.createElement("td");
        itemsTotalAmountCell.textContent = totalAmount.toLocaleString("ko-KR", {
            style: "currency",
            currency: "KRW"
        });
        itemsTotalRow.appendChild(itemsTotalAmountCell);
        itemsTbody.appendChild(itemsTotalRow);
        
        itemsTable.appendChild(itemsTbody);
        selectedItemsList.appendChild(itemsTable);

        var fullscreenModal = new bootstrap.Modal(document.getElementById("fullscreenModal"));
        fullscreenModal.show();
    }
    
// 발주명세서 -> insert
   document.getElementById("submitOrderBtn").addEventListener("click", function() {
    // 발주 정보를 수집
    var selectedSupplierId = document.querySelector(".supplier").value;
    var checkboxes = document.querySelectorAll(".itemCheckbox:checked");
    var orderItems = [];
    var totalAmount = 0;
    var soAmount = 0;
    
    for (var i = 0; i < checkboxes.length; i++) {
        var tr = checkboxes[i].closest("tr");
        var stId = tr.querySelector('input[name="stId"]').value;
        var stNm = tr.querySelector('input[name="stNm"]').value;
        var soCnt = tr.querySelector('input[name="soCnt"]').value;
        var calculatedAmount = parseFloat(tr.querySelector('input[name="sAccount"]').value);
		    totalAmount += calculatedAmount;
        orderItems.push({
            stId2: stId,
//             stNm: stNm,
            soCnt: soCnt
//             calculatedAmount : calculatedAmount,
//             totalAmount : totalAmount
        });
    }
    
    var orderData = {
        sprId: selectedSupplierId,
        orderItems: orderItems,
        soAmount : totalAmount
    };
    
    console.log(orderData)
   
    $.ajax({
        type: "POST", // 전송 방식
        url: "${pageContext.request.contextPath }/infra/stockOrderInsert.do", // 서버 URL
        data: JSON.stringify(orderData), // 데이터를 JSON 형태로 변환하여 전송
        contentType: "application/json", // 데이터 타입 설정
        success: function(response) {
        	console.log(response);
        	if (response.result == "성공") {
        		location.href = "${pageContext.request.contextPath }/infra/stockOrderList.do";
        		
        	} else {
        		location.href = "${pageContext.request.contextPath }/infra/stockOrderList.do";
        	}
				alert("성공이예유")
        	
            var fullscreenModal = new bootstrap.Modal(document.getElementById("fullscreenModal"));
            fullscreenModal.hide();
        },
        error: function(error) {
            Swal.fire({
			     icon: 'error',
			     text: '발주 정보 전송 중 오류가 발생했습니다.'
			   })
            console.log(error);
        }
    });
});
</script>