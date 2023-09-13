<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title"></h5>
					<p></p>

<div class="card">
  <div class="card-body">
    <h5 class="card-title">계정 생성</h5>
    <ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
    
<!--     직원 계정 생성  -->
      <li class="nav-item flex-fill" role="presentation">
        <button class="nav-link w-100" id="emp-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-employee" type="button" role="tab" aria-controls="emp" aria-selected="false">Employee</button>
<%--         <%@ include file="/WEB-INF/views/hr/emp/empForm.jsp" %> --%>
        
      </li>
      
<!--       항공사 계정 생성  -->
      <li class="nav-item flex-fill" role="presentation">
        <button class="nav-link w-100 active" id="airline-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-airline" type="button" role="tab" aria-controls="airline" aria-selected="true">Airline</button>
<%--       	<%@ include file="/WEB-INF/views/hr/airline/airlineForm.jsp" %> --%>
      	
      </li>
      
<!--       외부 업체 계정 생성  -->
      <li class="nav-item flex-fill" role="presentation">
        <button class="nav-link w-100" id="vender-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-vendor" type="button" role="tab" aria-controls="vender" aria-selected="false">Vender</button>
<%--          <%@ include file="/WEB-INF/views/hr/vendor/vendorForm.jsp" %> --%>
         
         
      </li>
    </ul>
    
    
    <div class="tab-content pt-2" id="borderedTabJustifiedContent">
      <div class="tab-pane fade show active" id="bordered-justified-home" role="tabpanel" aria-labelledby="home-tab">
      		<form:form method="post" modelAttribute="emp" id="empForm">
			<table class="table table-border">
				<tr>
					<th><spring:message code="emp.empNo" /></th>
					<td>
						<form:input path="empNo" class="form-control" />
						<form:errors path="empNo" class="error" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="emp.empNm" /></th>
					<td>
						<form:input path="empNm" class="form-control" />
						<form:errors path="empNm" class="error" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="emp.empBir" /></th>
					<td>
						<form:input path="empBir" class="form-control" type="date" />
						<form:errors path="empBir" class="error" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="emp.empGender" /></th>
					<td>
						<label>
					        <form:radiobutton path="empGender" value="F" /> F <br>
					    </label>
						<label>
					        <form:radiobutton path="empGender" value="M" /> M
					    </label>
					</td>
				</tr>
				
				<tr>
					<th><spring:message code="emp.empEmail" /></th>
					<td>
						<form:input path="empEmail" class="form-control" />
						<form:errors path="empEmail" class="error" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="emp.empAddr" /></th>
					<td>
						<form:input path="empAddr" class="form-control" />
						<form:errors path="empAddr" class="error" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="emp.empContact" /></th>
					<td>
						<form:input path="empContact" class="form-control" />
						<form:errors path="empContact" class="error" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="emp.empJoinDt" /></th>
					<td>
						<form:input path="empJoinDt" class="form-control" type="date" />
						<form:errors path="empJoinDt" class="error" />
					</td>
				</tr>
				
				<tr>
				    <th><spring:message code="emp.empDeptNo" /></th>
				    <td>
				        <form:select id="empDeptSelect" path="empDeptNo" class="form-control">
				            <form:option value="">-- 선택하세요 --</form:option>
				            <form:option value="1201">사무</form:option>
				            <form:option value="1202">운영</form:option>
				            <form:option value="1203">보안</form:option>
				            <form:option value="1204">인프라</form:option>
				        </form:select>
				        <form:errors path="empDeptNo" class="error" />
				    </td>
				</tr>
				<tr id="subDeptRow">
				    <th><spring:message code="emp.empTeam" /></th>
				    <td>
				        <form:select path="empTeam" class="form-control">
				            <form:option value="1">-- 선택하세요 --</form:option>
				            <form:option value="31">인사</form:option>
				            <form:option value="32">회계</form:option>
				        </form:select>
				        <form:errors path="empTeam" class="error" />
				    </td>
				</tr>
				<tr>
					<th><spring:message code="emp.empRoleNm" /></th>
					<td>
						<form:select path="empRoleNm" class="form-control">
							<form:option value="">--선택하세요--</form:option>
							<form:option value="사원">사원</form:option>
							<form:option value="주임">주임</form:option>
							<form:option value="대리">대리</form:option>
							<form:option value="과장">과장</form:option>
							<form:option value="차장">차장</form:option>
							<form:option value="부장">부장</form:option>
						</form:select>
						<form:errors path="empRoleNm" class="error" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="emp.empAccnum" /></th>
					<td>
						<form:input path="empAccnum" class="form-control" />
						<form:errors path="empAccnum" class="error" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="btn btn-success" type="submit" value="저장"> 
						<input class="btn btn-danger" type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form:form>
      </div>
      
      
      <div class="tab-pane fade" id="bordered-justified-profile" role="tabpanel" aria-labelledby="profile-tab">
			<form:form method="post" modelAttribute="airline">
			<table class="table table-border">
				<tr>
					<th><spring:message code="airline.alKnm" /></th>
					<td>
						<form:input path="alKnm" class="form-control" />
						<form:errors path="alKnm" class="error" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="airline.alEnm" /></th>
					<td>
						<form:input path="alEnm" class="form-control" />
						<form:errors path="alEnm" class="error" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="airline.alCd" /></th>
					<td>
						<form:input path="alCd" class="form-control" />
						<form:errors path="alCd" class="error" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="airline.alCountry" /></th>
					<td>
						<form:input path="alCountry" class="form-control" />
						<form:errors path="alCountry" class="error" />
					</td>
				</tr>
				
				<tr>
					<th><spring:message code="airline.alCounCd" /></th>
					<td>
						<form:input path="alCounCd" class="form-control" />
						<form:errors path="alCounCd" class="error" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="airline.alFlag" /></th>
					<td>
				        <label>
					        <form:radiobutton path="alFlag" value="국적 항공사" /> 국내 <br>
					    </label>
						<label>
					        <form:radiobutton path="alFlag" value="외항사" /> 국외
					    </label>
				        <form:errors path="alFlag" class="error" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="airline.alScale" /></th>
					<td>
						<form:select path="alScale" class="form-control">
				            <form:option value="">-- 선택하세요 --</form:option>
				            <form:option value="FSC">FSC</form:option>
				            <form:option value="LCC">LCC</form:option>
				            <form:option value="Cargo">Cargo</form:option>
				        </form:select>
				        <form:errors path="alScale" class="error" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="airline.alHead" /></th>
					<td>
						<form:input path="alHead" class="form-control" />
						<form:errors path="alHead" class="error" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" class="btn btn-success"/>
						<a class="btn btn-secondary" href="<c:url value='/hr/airline/airlineList.do'/>">목록으로</a>
					</td>
				</tr>
			</table>
		</form:form>
      </div>
      
      
      <div class="tab-pane fade" id="bordered-justified-contact" role="tabpanel" aria-labelledby="contact-tab">
			<form:form method="post" modelAttribute="vendor" id="vendorForm">
		    <form class="row g-3" >
		      <div class="col-md-6">
		        <label for="vendId" class="form-label"><spring:message code="vendor.vendId" /></label>
		        <form:input path="vendId" class="form-control" />
		        <form:errors path="vendId" class="error" />
		      </div>
		      
		      <div class="col-md-6">
		        <label for="vendNm" class="form-label"><spring:message code="vendor.vendNm" /></label>
		        <form:input path="vendNm" class="form-control" />
		        <form:errors path="vendNm" class="error" />
		      </div>
		      
		      <div class="col-md-6">
		        <label for="vendOpHours" class="form-label"><spring:message code="vendor.vendOpHours" /></label>
		        <form:input path="vendOpHours" class="form-control" type="time"/>
		        <form:errors path="vendOpHours" class="error" />
		      </div>
		      
		      <div class="col-md-6">
		        <label for="vendClHours" class="form-label"><spring:message code="vendor.vendClHours" /></label>
		        <form:input path="vendClHours" class="form-control" type="time"/>
		        <form:errors path="vendClHours" class="error" />
		      </div>
		      
		      <div class="col-md-6">
		        <label for="vendContact" class="form-label"><spring:message code="vendor.vendContact" /></label>
		        <form:input path="vendContact" class="form-control" />
		        <form:errors path="vendContact" class="error" />
		      </div>
		      
		      <div class="col-md-6">
		     	<label for="vendLoc" class="form-label"><spring:message code="vendor.vendLoc" /></label>
		        <form:input path="vendLoc" class="form-control" />
		        <form:errors path="vendLoc" class="error" />
		      </div>
		      
		      <div class="col-md-6">
		        <label for="vendMvp" class="form-label"><spring:message code="vendor.vendMvp" /></label>
		     	<form:input path="vendMvp" class="form-control" />
		        <form:errors path="vendMvp" class="error" />
		      </div>
		      
		      <div class="col-md-6">
		        <label for="vendType" class="form-label">업체 <spring:message code="vendor.vendType" /></label>
		        <form:select id="vendType" path="vendType" class="form-control">
				    <form:option value="">-- 선택하세요 --</form:option>
				    <form:option value="F">식품(식당)</form:option>
				    <form:option value="B">뷰티</form:option>
				    <form:option value="L">명품</form:option>
				    <form:option value="E">전자제품</form:option>
				    <form:option value="C">패션</form:option>
				    <form:option value="A">주류·담배</form:option>
				</form:select>
		        <form:errors path="vendType" class="error" />
		      </div>
		      
		      <div class="col-md-6">
		        <label for="vendDesc" class="form-label"><spring:message code="vendor.vendDesc" /></label>
		     	<form:input path="vendDesc" class="form-control" />
		        <form:errors path="vendDesc" class="error" />
		      </div>
		      
		      <div class="text-center">
		      <br>
		        <input class="btn btn-success" type="submit" value="SUBMIT"> 
				<input class="btn btn-danger" type="reset" value="CANCEL">
		      </div>
		    </form><!-- End Multi Columns Form -->
		</form:form>
      </div>
    </div>
  </div>
</div>

				</div>
			</div>
		</div>
	</div>
</section>



<script type="text/javascript">

	$(subDeptRow).hide();
	$(empDeptSelect).on('change', function() {
		const deptNo = $(empDeptSelect).val();
    	if (deptNo == '1201') {
    		console.log("same")
    		$(subDeptRow).show();
    	} else {
    		$(subDeptRow).hide();
    	}
	});
	
</script>