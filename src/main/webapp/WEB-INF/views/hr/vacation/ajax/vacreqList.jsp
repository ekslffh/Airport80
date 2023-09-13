
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    

<style>
        /* 스타일을 추가하여 드롭 영역을 시각적으로 나타낼 수 있습니다. */
        .drop-target {
            border: 2px dashed #ccc;
            padding: 10px;
        }
    </style>

<div>
    <table class="table table-sm" style="text-align:center" >
        <tbody class="table table-bordered">
            <tr class="table-light" style="height: 40.5px">
                <th style="width: 99.88;">휴가 아이디</th>
                <th style="width: 61.35px;">신청자</th>
                <th style="width: 130.57px;">일시</th>
                <th style="width: 46.81px;">일수</th>
                <th style="width: 61.35px;">유형</th>
                <th style="width: 46.6px;">상태</th>
            </tr>
        </tbody>
    </table>
</div>

<div style="overflow-y: scroll; height: 354px;" class="thtble req-body">
    <table class="table table-hover">
        <tbody style="text-align:center">
            <c:set var="vacreqList" value="${paging.dataList }" />
            <c:forEach items="${vacreqList }" var="vacreq">
                <c:if test="${vacreq.vrStatus == 'APP'}"> <!-- vrstatus가 'APP'인 경우만 표시 -->
<!--                     <tr draggable="true" ondragstart="handleDragStart(event)" style="vertical-align : middle;" -->
<%--                     	onclick="sendData('${vacreq.vrId}, ${vacreq.empNm}, ${vacreq.vrStartTs}, ${vacreq.vrEndTs}, --%>
<%--                     						${vacreq.vrPeriod}, ${vacreq.vrType}, ${vacreq.vrStatus}')"> --%>
					<tr onclick="chkbox('${vacreq.vrId}')" style="vertical-align : middle;">
                        <td>${vacreq.vrId }</td>
                        <td>${vacreq.empNm }</td>
                        <td>${vacreq.vrStartTs } ~ <br>${vacreq.vrEndTs }</td>
                        <td>${vacreq.vrPeriod }일</td>
                        <td>
                            <c:choose>
                                <c:when test="${vacreq.vrType == 'SK'}">병가</c:when>
                                <c:when test="${vacreq.vrType == 'PD'}">공가</c:when>
                                <c:when test="${vacreq.vrType == 'AL'}">연차</c:when>
                                <c:when test="${vacreq.vrType == 'PL'}">출산</c:when>
                                <c:when test="${vacreq.vrType == 'FE'}">경조사</c:when>
                                <c:when test="${vacreq.vrType == 'UP'}">무급</c:when>
                            </c:choose>	
                        </td>
                        <td>
                            <c:choose>
    <c:when test="${vacreq.vrStatus == 'APP'}"><span style="color: black;">신청</span></c:when>
    <c:when test="${vacreq.vrStatus == 'APPR'}"><span style="color: green;">승인</span></c:when>
    <c:when test="${vacreq.vrStatus == 'REJ'}"><span style="color: red;">반려</span></c:when>
</c:choose>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- <div class="drop-target" ondrop="handleDrop(event)" ondragover="allowDrop(event)">Drop Here</div> -->



<script>
function chkbox(vrId) {
	let settings = {
			url : "${pageContext.request.contextPath}/hr/vacation/vacreqView.do?what="+vrId,
			method : "get",
			dataType : "html",
			success : function(resp) {
				console.log("resp", resp);
				$(vpDiv).html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			} //request line,header,body -> response processing
		};
		$.ajax(settings);
}
</script>

<script>
// function sendData(vrId, empNm, vrStartTs, vrEndTs, vrPeriod, vrType, vrStatus) {
//     // 선택한 tr에서 데이터 추출하여 URL로 이 페이지로 이동
//     window.location.href = '${pageContext.request.contextPath}/hr/vacation/vacreqView.do?vrId=' 
//     		+ vrId + '&empNm=' + empNm + '&vrStartTs=' + vrStartTs + '&vrEndTs=' + vrEndTs 
//     		+ '&vrPeriod=' + vrPeriod + '&vrType=' + vrType + '&vrStatus=' + vrStatus;
// }

// function handleDragStart(event) {
//     event.dataTransfer.setData("text/plain", event.target.outerHTML);
// }

// function allowDrop(event) {
//     event.preventDefault();
// }

// function handleDrop(event) {
//     event.preventDefault();
//     const data = event.dataTransfer.getData("text/plain");
//     const div = document.createElement("div");
//     div.innerHTML = data;
    
//     // 드래그한 행을 테이블로 변환하여 추가
//     const table = document.createElement("table");
//     table.innerHTML = div.textContent;
//     div.textContent = ''; // 기존 내용 제거
//     div.appendChild(table);
    
//     event.target.appendChild(div);
// }
</script> 