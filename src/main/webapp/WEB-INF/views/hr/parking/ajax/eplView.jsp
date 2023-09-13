<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<table class="table table-bordered" style="text-align:center;">
	<tr>
		<th class="table-light">신청 번호</th>
		<td>${eplstatus.eplId }</td>
	</tr>
	<tr>
		<th class="table-light">신청일</th>
		<td>${eplstatus.esCrtDt }</td>
	</tr>
	<tr>
		<th class="table-light">신청 직원</th>
		<td>${eplstatus.empNm }</td>
	</tr>
	<tr>
		<th class="table-light">주차<br>희망구역</th>
		<td style="vertical-align : middle;">${eplstatus.eplCd }</td>
	</tr>
	<tr>
		<th class="table-light">차종</th>
		<td>${eplstatus.esCarModel }</td>
	</tr>
	<tr>
		<th class="table-light">차번호</th>
		<td>${eplstatus.esCarNo }</td>
	</tr>
	<tr>
		<th class="table-light">상태</th>
		<td>${eplstatus.commoncode.codeNm }
		</td>
	</tr>
	
	<tr>
		<td colspan="2" style="text-align:right;">
		    <input type="button" class="btn btn-outline-secondary" value="결재"
		    	data-bs-toggle="modal" 
		            data-bs-target="#statusModal" 
		            data-what="${eplstatus.esStatus }"
		            data-who="${eplstatus.eplId }">
		</td>
	</tr>
</table>


<div class="modal fade" id="statusModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">직원 주차장 상태변경</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <form id="statusChangeForm" method="post" action="${pageContext.request.contextPath }/hr/parking/eplUpdate.do">            
      <div class="modal-body">
         
         <input id="eplId" type="hidden" name="eplId" value="${eplStatus.eplId }" />
           <span>상태</span> 
          <select class="form-select" name="esStatus" id="esStatusSelect" 
             style="display:inline; width:70%; margin-left: 40px;">
            <option value="" label="상태변경" />
            <option value="APP" label="신청" />
            <option value="APPR" label="승인" />
            <option value="REJ" label="반려" />
            <option value="CAN" label="취소" />
          </select>
          <br>
            <div id="reasonDiv" style="display:none;">
              <span>사유</span>
              <textarea name="eplReason" placeholder="사유를 입력해주세요." class="form-control" style="display:inline; width:70%; margin-top: 11px; margin-left: 40px;"></textarea>
          </div>
     </div>
          
   <div class="modal-footer">
     <button type="submit" class="btn btn-primary">변경</button>
     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
   </div>
        </form>
    </div>
  </div>
</div>


<script src="<c:url value='/resources/js/app/hr/eplStatusList.js'/>"></script>

<script>
$(document).ready(function() {
	// 선택 상태 변경 감지
 	document.getElementById("esStatusSelect").addEventListener("change", function () {
    var selectedValue = this.value;
    var reasonDiv = document.getElementById("reasonDiv");

    // 선택한 값이 'REJ'이면 사유 입력창을 보여주고, 그 외의 경우 숨김
    if (selectedValue === "REJ") {
        reasonDiv.style.display = "block";
    } else {
        reasonDiv.style.display = "none";
    }
});
});
</script>

<script>
$(statusModal)
.on("show.bs.modal", function(event) {
	
   let esStatus = event.relatedTarget.dataset['what'];
   let eplId = event.relatedTarget.dataset['who'];
   
   console.log("esStatus", esStatus);
   console.log("eplId", eplId);
   
   $("#esStatusSelect").val(esStatus);
   $("#eplId").val(eplId);
})
.on("hidden.bs.modal", function() {
   let $modalBody = $(this).find(".modal-body");
   $modalBody.empty();
});
</script>


