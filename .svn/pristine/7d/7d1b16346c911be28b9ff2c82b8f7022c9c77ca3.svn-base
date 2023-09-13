<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/4.1.1/es6-promise.auto.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<script src="/js/html2canvas.js"></script>
<script src="/js/jspdf.min.js"></script>
<style>
.content {
	float: left;
	width: 100%;
	padding: 0px;
}

.pdf-button {
	float: right;
	width: 30%;
	text-align: center;
	padding: 0px;
}

table {
	border-collapse: collapse;
	width: 100%;
}

/* th, td { */
/* 	border: 1px solid black; */
/* 	padding: 8px; */
/* 	text-align: left; */
/* } */
</style>
<form:form method="post" modelAttribute="orderDetail">
		<button type="button" class="btn btn-outline-dark deletebtn" id="pdf">PDF 다운로드</button>
	<div class="content">
		<h4 style= "margin-top: 30px;">발주서</h4>
		<table class="table table-bordered">
			<tr>
				<th colspan="1">발주ID</th>
				<td colspan="2">${orderDetail.soId }</td>
			</tr>
			<tr>
				<th colspan="1">납부ID</th>
				<td colspan="2">${orderDetail.vpId }</td>
			</tr>
			<tr>
				<th colspan="1">발주 날짜</th>
				<td colspan="2">${orderDetail.soTs }</td>
			</tr>
			<tr>
				<th colspan="1">거래처</th>
				<td>${orderDetail.supplier.sprNm }</td>
				<td>${orderDetail.supplier.sprId }</td>
			</tr>
		</table>
		</div>
</form:form>
	
	
<form method="post" id="completeForm">
	<table class="table table-bordered">
		<thead>
			<tr>
				
				<th>품번</th>
				<th>품명</th>
				<th>발주수량</th>
				<th>금액</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty detail }">
				<tr>
					<td colspan="6">발주내역 없음.</td>
				</tr>
			</c:if>
			<c:if test="${not empty detail }">
				<c:forEach items="${detail }" var="d">
					<tr>
						<td>${d.stId2 }</td>
						<td>${d.stock.stNm }</td>
						<td>${d.soCnt }</td>
						<td><fmt:formatNumber value="${d.soCnt * d.stock.stPrice }"
								type="number" pattern="#,##0"/></td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="1">총 금액</td>
				<td colspan="3"><fmt:formatNumber value="${orderDetail.soAmount}"
												type="number" pattern="#,##0" /></td>
	
			</tr>
		</tbody>
	
	</table>
	
</form>

 <script type="text/javascript">
    let all_area_array = ['.content']; //전체영역 area
    let area_array = ['.content']; //pdf 다운 영역

    $('#pdf').on("click", function () {
      let difference = all_area_array.filter(x => !area_array.includes(x));

      $.each(difference,function(index, item){
        $(item).attr('data-html2canvas-ignore', true);
      });
      setTimeout(pdfMake(),500);
    });

    const pdfMake = () => {
      html2canvas($('.content')[0]).then(function(canvas) {
        let imgData = canvas.toDataURL('image/png');
        
        
        

        let imgWidth = 190; // 이미지 가로 길이(mm) A4 기준
        let pageHeight = imgWidth * 1.8;  // 출력 페이지 세로 길이 계산 A4 기준
        let imgHeight = canvas.height * imgWidth / canvas.width;
        let heightLeft = imgHeight;

        let doc = new jsPDF('p', 'mm');
        let position = 0;

        // 첫 페이지 출력
        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
        heightLeft -= pageHeight;

        // 한 페이지 이상일 경우 루프 돌면서 출력
        while (heightLeft >= 20) {
            position = heightLeft - imgHeight;
            doc.addPage();
            doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
            heightLeft -= pageHeight;
        }
        
        

        let today = new Date();
        let year = today.getFullYear();
        let month = ('0' + (today.getMonth() + 1)).slice(-2);
        let day = ('0' + today.getDate()).slice(-2);
        let hours = ('0' + today.getHours()).slice(-2);
        let minutes = ('0' + today.getMinutes()).slice(-2);

        let dateString = year + month + day + hours + minutes;

        // 파일 저장
        doc.save("발주서_"+dateString+'.pdf');
        
        
        
      });
    }
   </script>
