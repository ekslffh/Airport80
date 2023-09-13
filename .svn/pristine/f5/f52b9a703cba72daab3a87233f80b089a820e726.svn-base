<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>
.card-body {
	padding: 25px 30px 30px 35px;
}

hr {
	border: 0.5px solid #000; /* 가로 구분선의 스타일을 설정합니다. */
	margin: 13px 0; /* 위 아래 여백을 조정합니다. */
}
th {
            border-right: 1px solid #ccccccad; /* 각 열 사이에 세로 구분선 스타일 추가 */
            padding: 5px;
            vertical-align : middle;
            text-align: center; 
        }
</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">정보 수정</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">인사 관리</a></li>
					        <li class="breadcrumb-item active">직원 정보 수정</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->

<div style="display: flex; justify-content: center; align-items: center;">
						<!-- <div class="card" style="width:800px;"> -->
						<div style="width: 800px;">
						
<form:form method="post" modelAttribute="emp" id="empForm" enctype="multipart/form-data">



<form:hidden path="empNo" value="${empNo}"/>
<form:hidden path="empNm" value="${empNm}" />
<form:hidden path="empBir" value="${empBir}" />
<form:hidden path="empGender" value="${empGender}" />

	<table class="table table-border">
		<tr>
			<th><spring:message code="emp.empNo" /></th>
			<td style="padding: 9px 0px 9px 15px;">
				<input class="form-control"style='width:200px;'
				 value="${emp.empNo }" disabled />
			</td>
			<th style = "border-left: 1px solid #ccccccad; /* 각 열 사이에 세로 구분선 스타일 추가 */
			padding: 5px;
			vertical-align : middle;
			text-align: center; ">			
			<spring:message code="emp.empNm" /></th>
			<td style="padding: 9px 0px 9px 15px;">
				<input class="form-control" maxlength='10' style="width:200px;" value="${emp.empNm }" disabled />	
			</td>
		</tr>
		<tr>
			<th><spring:message code="emp.empBir" /></th>
			<td style="padding: 9px 0px 9px 15px;">
				<input class="form-control" value="${emp.empBir }"  style="width:200px;" disabled />	
			</td>
			<th style = "border-left: 1px solid #ccccccad; /* 각 열 사이에 세로 구분선 스타일 추가 */
				padding: 5px;
				vertical-align : middle;
				text-align: center; ">
			<spring:message code="emp.empGender" /></th>
			<td style="padding: 9px 0px 9px 15px;">
				<input class="form-control"  style="width:200px;" value="${emp.empGender }" disabled />	
			</td>
		</tr>
		<tr>
			<th><spring:message code="emp.empStatus" /></th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;">
				<label>
			        <form:radiobutton path="empStatus" value="1" /> 출근
			    </label>
				<label>
			        <form:radiobutton path="empStatus" value="2" /> 퇴근
			    </label>
				<label>
			        <form:radiobutton path="empStatus" value="3" /> 휴가
			    </label>
				<label>
			        <form:radiobutton path="empStatus" value="4" /> 퇴사
			    </label>
			</td>
		</tr>
		<tr>
			<th><spring:message code="emp.empEmail" /></th>
			<td  colspan="3" style="padding: 9px 0px 9px 15px;">
				<div style="display: flex; align-items: center;">
				<form:input path="empEmail" class="form-control"  
				style="width:200px;" /> &nbsp; @ &nbsp;
				<form:select id="empEmailDo" path="empEmailDo"
					 class="form-control" style="width:200px;">
		            <form:option value="">-- 선택하세요 --</form:option>
		            <form:option value="naver.com">naver.com</form:option>
		            <form:option value="daum.net">daum.net</form:option>
		            <form:option value="gmail.com">gmail.com</form:option>
		            <form:option value="kakao.com">kakao.com</form:option>
		            <form:option value="hanmail.net">hanmail.net</form:option>
		        </form:select>
		        </div>
			</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td colspan="3" style="display:flex; aling-items:center; padding: 9px 0px 9px 15px;">
				<form:input id="emp_post" path="empPost" class="form-control" style="width:200px;" />
				&nbsp;&nbsp;
				<input class="btn btn-ligth btn-sm" onclick="findAddr()" 
					value="주소찾기" style="width:66px;"> 
				<form:errors path="empPost" class="error" />
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;">
				<form:input id="emp_addr" path="empAddr" class="form-control" />
				<form:errors path="empAddr" class="error" />
			</td>
		</tr>
		<tr>
			<th>상세 주소</th>
			<td  colspan="3" style="padding: 9px 0px 9px 15px;">
				<form:input path="empDetailAddr" class="form-control" style="width:200px;" />
				<form:errors path="empDetailAddr" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="emp.empContact" /></th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;">
				<form:input path="empContact" class="form-control" maxlength="15"  style="width:200px;"/>
				<form:errors path="empContact" class="error" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="emp.empJoinDt" /></th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;">
				<form:input path="empJoinDt" class="form-control" type="date"  style="width:200px;"/>
				<form:errors path="empJoinDt" class="error" />
			</td>
		</tr>
		
		<tr>
		    <th><spring:message code="emp.empDeptNo" /></th>
		    <td colspan="3" style="padding: 9px 0px 9px 15px;">
		        <form:select id="empDeptSelect" path="empDeptNo" class="form-control"  style="width:200px;">
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
		    <td colspan="3" style="padding: 9px 0px 9px 15px;">
		        <form:select path="empTeam" class="form-control"  style="width:200px;">
		            <form:option value="1">-- 선택하세요 --</form:option>
		            <form:option value="31">인사</form:option>
		            <form:option value="32">회계</form:option>
		        </form:select>
		        <form:errors path="empTeam" class="error" />
		    </td>
		</tr>
		<tr>
			<th><spring:message code="emp.empRoleNm" /></th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;">
				<form:select path="empRoleNm" class="form-control"  style="width:200px;">
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
			<th>거래 은행</th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;">
				<form:select id="empAccbank"  style="width:200px;" path="empAccbank" class="form-control">
		            <form:option value="">-- 선택하세요 --</form:option>
		            <form:option value="우리">우리</form:option>
		            <form:option value="하나">하나</form:option>
		            <form:option value="국민">국민</form:option>
		            <form:option value="기업">기업</form:option>
		            <form:option value="농협">농협</form:option>
		            <form:option value="경남">경남</form:option>
		            <form:option value="수협">수협</form:option>
		            <form:option value="대구">대구</form:option>
		            <form:option value="부산">부산</form:option>
		            <form:option value="전북">전북</form:option>
		        </form:select>
		        <form:errors path="empAccbank" class="error" />
			</td>
		</tr>
		<tr>
			<th>계좌 번호</th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;">
				<form:input path="empAccnum" class="form-control"   style="width:200px;"/>
				<form:errors path="empAccnum" class="error" />			
			</td>
		</tr>
		
		<tr>
			<th>프로필</th>
			<td colspan="3" style="padding: 9px 0px 9px 15px;">
				<input type="file" name="empFiles" multiple />		
			</td>
		</tr>
	</table>
		<div style="text-align: right; height: 100px; padding: 10px 0px 20px 20px; width: 701px;">
			<input class="btn btn-dark" type="reset" value="취소"> 
			<a class="btn gray_btn" href="<c:url value='/hr/emp/empList.do'/>">목록</a> 
			<input class="btn btn-primary" type="submit" value="수정">
		</div>
</form:form>

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


<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('emp_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("emp_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("emp_addr").value = jibunAddr;
            }
        }
    }).open();
}
</script>