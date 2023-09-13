<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal.realUser" var="authMember" />

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}" >
					<h5 class="card-tit">압수품 관리</h5>
				    <nav>
				      <ol class="breadcrumb">
				        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
				        <li class="breadcrumb-item"><a href="#">보안검색</a></li>
				        <li class="breadcrumb-item"><a href="#">압수품 관리</a></li>
				        <li class="breadcrumb-item"><a href="#">압수품 상세보기</a></li>
				        <li class="breadcrumb-item active">압수품 수정</li>
				      </ol>
				    </nav>
					</div>
					<!-- 게시판 헤더 영역 끝 -->
					
<form:form method="post" modelAttribute="confis">
	<form:hidden path="csId" />
	<form:hidden path="csWriter" value="${authMember.empNo }"/>
	<form:hidden path="csDispoMthd" value="REG" />
	<table class="table table-border">
		<tr>
			<th class="col-sm-2">물품명</th>
			<td class="col-sm-10">
			<form:input class="form-control" type="text" path="csNm" style="width:50%;"/>
			<form:errors path="csNm" class="error" />
			</td>
		</tr>
		<tr>
			<th>압수품 품목</th>
			<td>
				<form:select class="form-select" type="text" path="csCtgr" style="width:50%;">
					<form:option value="" label="품목선택" />
					<form:options items="${confisInfo }" itemLabel="ciGubun" itemValue="ciGubun"/>
				</form:select>
				<form:errors path="csCtgr" class="error"/>
			</td>
		</tr>
		<tr>
			<th>압수품 수량</th>
			<td>
			<form:input class="form-control" type="number" path="csQtt" style="width:50%;"/>
			<form:errors class="error" path="csQtt" />
			</td>
		</tr>

		<tr>
			<th>압수자 여권번호</th>
			<td>
			<form:input class="form-control" type="text" path="csPno" style="width:50%;"/>
			<form:errors class="error" path="csPno"/></td>
		</tr>
		<tr>
			<th>압수자 이름</th>
			<td>
			<form:input class="form-control" type="text" path="csPsName" style="width:50%;"/>
			<form:errors class="error" path="csPsName" /></td>
		</tr>

		<tr>
			<th>압수일시</th>
			<td>
			<form:input class="form-control" type="datetime-local" path="csTs" style="width:50%;"/>
			<form:errors class="error" path="csTs"/></td>
		</tr>
		
		
		<tr>
			<th>압수사유</th>
			<td><form:textarea class="form-control" path="csRsn" style="width:50%;"/><span class="error">${errors["csRsn"]}</span></td>
		</tr>
		
		
		<tr>
			<th>압수장소</th>
			<td>
			<select class="form-select" type="text" id="floorSelect" style="width:50%;">
		    <option value="" label="층수선택"/>
			    <c:forEach items="${zoneList}" var="zone" varStatus="status">
			        <c:if test="${status.index == 0 || zoneList[status.index - 1].zoneFloor != zone.zoneFloor}">
			            <option value="${zone.zoneFloor}" label="${zone.zoneFloor}" />
			        </c:if>
			    </c:forEach>
			</select>
			
			<form:select class="form-select" type="text" path="csLoc" id="zoneSelect" style="width:50%;"> 
				<form:option value="" label="구역선택" />
					<c:forEach items="${zoneList }" var="zone">
					<form:option value="${zone.zoneCd }" class="${zone.zoneFloor}" label="${zone.zoneCtgr }"/>
				</c:forEach> 
			</form:select>
			<form:errors path="csLoc" class="error"/>
			</td>
		</tr>
		
		
		<tr>
			<th>보안일지 ID</th>
			<td class="d-flex"><form:input class="form-control" type="text" path="slogId" id="slogIdInput" style="width:45%; margin-right: 5px;"/>
				<span class="error">${errors["slogId"]}</span>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ExtralargeModal">찾기</button>
			</td>
		</tr>
	</table>
			<div class="d-flex justify-content-end">
			<input type="submit" value="수정" class="btn btn-primary" style="margin-right:3px;"/> 
			<input type="reset" value="취소" class="btn btn-dark" style="margin-right:3px;"/>
			<a class="btn btn-secondary gray_btn" href="<c:url value='/safety/confiscation.do' />">목록으로</a>
			</div>
</form:form>
				</div>
			</div>
		</div>
	</div>
</section>



<!-- Extra Large Modal -->

<div class="modal fade" id="ExtralargeModal" tabindex="-1">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">압수품 등록된 보안일지</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
<!--       보안일지 출력 AREA      -->


      <table class="table table-bordered">
		<thead class="table-light">
			<th class="text-center">보안일지ID</th>
			<th class="text-center">유형</th>
			<th class="text-center">보안이슈</th>
			<th class="text-center">위치</th>
			<th class="text-center">압수품 여부</th>
		</thead>

		<tbody>
			<c:if test="${empty securityList }">
				<tr>
					<td colspan="4"> 압수품 등록된 보안일지 없음.</td>
				</tr>
			</c:if>
			<c:if test="${not empty securityList }">
				<c:forEach items="${securityList}" var="sclist">
					<tr style="cursor: pointer;">
						<td class="logItem" data-slogid="${sclist.slogId}">${sclist.slogId}</td>
						<td class="logItem" data-slogid="${sclist.slogId}">${sclist.common.codeNm}</td>
						<td class="logItem" data-slogid="${sclist.slogId}">${sclist.slogIssue}</td>
						<td class="logItem" data-slogid="${sclist.slogId}">${sclist.zone.zoneFloor}층 ${sclist.zone.zoneCtgr}</td>
						
						<c:if test="${sclist.slogConfis eq 'Y'}">
							<td class="text-center"><i class="bi bi-circle"></i></td>
						</c:if>
						<c:if test="${sclist.slogConfis eq 'N'}">
							<td class="text-center"><i class="bi bi-x-lg"></i> </td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		</table>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div><!-- End Extra Large Modal-->
              
              



<script>
    const floorSelect = document.getElementById("floorSelect");
    const zoneSelect = document.getElementById("zoneSelect");

    floorSelect.addEventListener("change", function() {
        const selectedFloor = floorSelect.value;

        // 기존 구역 옵션들 숨김
        for (const option of zoneSelect.options) {
            option.style.display = "none";
        }

        // 선택된 층에 해당하는 구역 옵션들 표시
        for (const option of zoneSelect.options) {
            if (option.classList.contains(selectedFloor)) {
                option.style.display = "block";
            }
        }
    });

    zoneSelect.addEventListener("change", function() {
        const selectedZoneCode = zoneSelect.value;
        // 선택된 구역 코드를 이용하여 다른 처리 수행 (예: 값 저장 등)
    });
    
    
    document.addEventListener("DOMContentLoaded", function() {
    	  const logItems = document.querySelectorAll(".logItem");
    	  const slogIdInput = document.getElementById("slogIdInput");
    	  const securityLogModal = new bootstrap.Modal(document.getElementById("ExtralargeModal")); 

    	  logItems.forEach(item => {
    	    item.addEventListener("click", function() {
    	      const selectedSlogId = this.getAttribute("data-slogid");
    	      console.log(selectedSlogId);
    	      slogIdInput.value = selectedSlogId;
    	      securityLogModal.hide(); // 모달 숨기기
    	    });
    	  });
    	});
</script>
