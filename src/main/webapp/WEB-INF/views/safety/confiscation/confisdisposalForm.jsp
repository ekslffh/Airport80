<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

<style>
.dispoArea{
	background: #f3f3f3;
    padding: 18px 16px;
    border-radius: 5px;
    font-size: 16px; 
    font-weight: 600;
}

.dispoZone{
    width: 55%;
    padding: 38px;
}

#image_container{
	margin-top: 10px;
    width: 200px;
    height: 200px;
    border-radius: 6px;
}

#image_container img{
    width: 200px;
    height: 200px;
    border-radius: 6px;
}

.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 50%;
    color: #999999;
}	

.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
    border-radius: 5px;
    margin-right: 4px;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

#imgReset{
	padding: 7px 13px;
	font-size: 16px;
}
</style>


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">압수품폐기 등록</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">보안검색</a></li>
					        <li class="breadcrumb-item"><a href="#">압수품</a></li>
					        <li class="breadcrumb-item active">압수품 폐기등록</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->
					

<div class="d-flex">					
	<table class="table Default Table" style=" width: 45%;">
		<tr>
			<th style="width: 180px;">압수품ID</th>
			<td>${confis.csId }</td>
		</tr>
		<tr>
			<th>물품명</th>
			<td>${confis.csNm }</td>
		</tr>
		<tr>
			<th>압수품 품목</th>
			<td>${confis.csCtgr }</td>
		</tr>
		<tr>
			<th>압수품 수량</th>
			<td>${confis.csQtt }</td>
		</tr>
		
		<tr>
			<th>압수자 이름</th>
			<td>${confis.csPsName }</td>
		</tr>
		<tr>
			<th>압수자 여권번호</th>
			<td>${confis.csPno }</td>
		</tr>
		
		<tr>
			<th>압수일시</th>
			<td>${confis.csTs.toString().replace('T', ' ') }</td>
		</tr>
		<tr>
			<th>압수사유</th>
			<td>${confis.csRsn }</td>
		</tr>
		<tr>
			<th>압수장소</th>
			<td>${confis.zone.zoneFloor }층 ${confis.zone.zoneCtgr } </td>
		</tr>
		
		<c:if test="${empty confis.slogId}">
		
		</c:if>
		
		<c:if test="${not empty confis.slogId}">
		<tr>
			<th>보안일지ID</th>
			<td>${confis.slogId }</td>
		</tr>
		</c:if>
		
		<tr>
			<th>압수품 상태</th>
			<td>${confis.common.codeNm}</td>
		</tr>
	</table>	
	
	<div class="dispoZone">
		<p class="dispoArea">
		<i class="bi bi-plus-square-fill" style="margin-right: 3px;"></i>
		압수물 '${confis.csNm}'을 폐기합니다. 폐기 인증을 위해 인증 사진을 첨부해주세요.
		버튼을 클릭하면 압수물 폐기가 완료되며, 관련 내용은 시스템에 기록됩니다. </p>	
		
		<form:form method="post" modelAttribute="confis" enctype="multipart/form-data" style="margin-bottom:60px;" 
		action="${pageContext.request.contextPath}/safety/confisdisUpdate.do">
				<form:hidden path="csId" value="${confis.csId}"/>
				
			<div class="filebox d-flex">
			    <input class="upload-name" value="" placeholder="등록된 파일이 없습니다">
			    <label for="image">파일선택</label> 
			    <input type="file" name="flFiles" multiple="multiple" id="image" accept="image/*" class="form-control-file" onchange="setThumbnail(event);" />
				<p class="btn btn-outline-secondary btn-sm" id="imgReset"><i class="bi bi-trash3"></i> 파일삭제</p>
			</div>
			
				
				
				
				
				<div id="image_container"></div>
				
				<div class="d-flex justify-content-end">
					<button class="btn btn-primary" type="button" style="margin-right: 4px;" data-bs-toggle="modal" data-bs-target="#exampleModal">폐기</button>
					<a class="btn btn-secondary" href="<c:url value='/safety/confiscation.do' />">목록</a>
				</div>
				
				
				<!-- 폐기 모달 -->
				<div class="modal fade" id="exampleModal"
					tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">압수품 폐기</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
								<div class="modal-body">
									폐기 하시겠습니까? 
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">폐기</button>
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
								</div>
						</div>
					</div>
				</div>	


				
		</form:form>
	</div>
</div>


				</div>
			</div>
		</div>
	</div>
</section>	


	
				
				
<script>
	function setThumbnail(event) {
		var reader = new FileReader();
	    var imgContainer = document.querySelector("div#image_container");
	    imgContainer.innerHTML = ""; // 이전 섬네일 삭제

		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};

		reader.readAsDataURL(event.target.files[0]);
	}
	
	
	$(document).ready(function() {
	    // 파일 업로드 input 엘리먼트와 이미지 표시 엘리먼트를 선택합니다.
	    var fileInput = $("#image");
	    var imgElement = $("#image_container img");
	    var uploadName = $(".upload-name");

	    // 파일 선택이 변경될 때 이미지 업로드 및 리셋을 처리합니다.
	    fileInput.on("change", function() {
	        var reader = new FileReader();

	        reader.onload = function(e) {
	            // 이미지 업로드
	            imgElement.attr("src", e.target.result);
	        };

	        reader.readAsDataURL(this.files[0]);
	    });

	    // 이미지 리셋 버튼 클릭 이벤트 처리
	    $("#imgReset").on("click", function() {
	        var imgContainer = document.querySelector("div#image_container");
	        imgContainer.innerHTML = ""; // 섬네일 삭제
	        fileInput.val(""); // 파일 업로드 입력 필드 초기화
	        uploadName.val(""); // 파일 업로드 입력 필드 초기화
	        
	    });
	});

	$("#image").on('change',function(){
		  var fileName = $("#image").val();
		  $(".upload-name").val(fileName);
		});
</script>	
					