<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">이메일 보내기</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/in"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">메일</a></li>
					        <li class="breadcrumb-item active">이메일 보내기</li>
					      </ol>
					    </nav>
				
				    </div>
				    <div class="info" style="width: 100%; padding-bottom: 1px;">
						 <p class="cofistooltip">
							  <i class="bi bi-exclamation-circle-fill" style="margin-right: 4px;"></i> 
							       <span data-bs-toggle="tooltip" data-bs-placement="top">
							        우측 하단 버튼으로 메일을 전송할 수 있습니다.
							       </span>
							   </p>
					  </div>
					  <p></p>
						    

<form action="${pageContext.request.contextPath}/account/mail/send.do" method="post" enctype="multipart/form-data" onsubmit="prepareContent()">
    <label for="recipient">받는 사람</label><br>
    <input type="email" name="recipient" class="form-control" required><br>

    <label for="subject">제목</label><br>
    <input type="text" name="subject" class="form-control"  required><br>

    <label for="content">내용:</label><br>
    <textarea name="content" id="content"></textarea><br>

    <label for="file">첨부 파일:</label><br>
    <input type="file" name="files" id ="formFile" class="form-control" multiple><br>

    <div style="text-align: right;">
   	    <button type="submit" id="emailsand" class="btn btn-primary">이메일 보내기</button>
	</div>

</form>

<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script>
    // CKEditor 초기화 및 내용 준비 함수
    CKEDITOR.replace('content', {
        enterMode: CKEDITOR.ENTER_BR,
        shiftEnterMode: CKEDITOR.ENTER_BR,
        autoParagraph: false,
        removePlugins: 'elementspath' // body 태그 표시 제거
    });

    // 폼 제출 전 CKEditor 내용 textarea에 복사
    function prepareContent() {
        var content = CKEDITOR.instances.content.getData();
        document.getElementById("content").value = content;
    }
</script>

				</div>
			</div>
		</div>
	</div>
</section>
