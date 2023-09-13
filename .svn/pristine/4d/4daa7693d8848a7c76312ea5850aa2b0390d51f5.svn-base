<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container{
            margin-top : 5%
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="${pageContext.request.contextPath}/accounting/salary/salaryInsert.do" method="post" onsubmit="return checkForm();">
            <label class="form-label">기본급 지정 (주 40시간 기준 최저시급 이상. 2023년 기준 2,010,580 원):</label>
            <input class="form-control" type="text" name="basicBaseString" id="basicBaseString" required  maxlength="9" onkeyup="inputNumberFormat(this);" value="2,010,580">


            <br>
            <label class="form-label">상여금 (extr):</label>
            <input class="form-control" type="text" name="extrString" onkeyup="inputNumberFormat(this);"maxlength="7" placeholder="상여금을 입력하세요" required min="0" value="100,000">
            <br>
            <label class="form-label">보너스 (Bns):</label>
            <input class="form-control" type="text" name="BnsString" onkeyup="inputNumberFormat(this);" maxlength="7" placeholder="보너스를 입력하세요" required min="0" value="100,000">
            <br>
      
            <!-- 부트스트랩 버튼 스타일 적용 -->
            <button class="btn btn-primary" type="submit">일괄 산정</button>
            <button class="btn btn-dark" type="button" onclick="window.close();">닫기</button>
        </form>
  
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script>
        // 창 닫기
        function closePopupAndRefreshParent() {
            setTimeout(function() {
            	alert("일괄산정이 완료되었습니다")
                window.opener.location.reload(); // 부모 페이지 새로고침
                window.close();
            }, 25); 
         
        }
     
     // 폼 제출 플래그 추가
        var shouldSubmitForm = false;

        // 폼 유효성 검사 및 알림 처리
        function checkForm() {
            var basicBaseInput = document.getElementById('basicBaseString');
            var basicBaseValue = parseInt(basicBaseInput.value.replace(/,/g, ''), 10);

            if (isNaN(basicBaseValue) || basicBaseValue < 2010580) {
                // Replace the standard alert with SweetAlert2
                Swal.fire({
                    icon: 'error',
                    title: '오류',
                    text: '최소 금액을 입력해 주세요.',
                });
                return false; // 폼 제출 중단
            } else {
                Swal.fire({
                    icon: 'question',
                    title: '확인',
                    text: '정말 이대로 산정합니까?',
                    showCancelButton: true,
                    confirmButtonText: '예',
                    cancelButtonText: '아니요',
                }).then((result) => {
                    if (result.isConfirmed) {
                    	  Swal.fire({
                              icon: 'success',
                              title: '산정 중...',
                              text: '해당 월 급여를 산정합니다.',
                              showConfirmButton: false, // Remove the "확인" (OK) button
                          });
                        setTimeout(function() {
                        	document.querySelector('form').submit(); // 폼 제출
                            closePopupAndRefreshParent(); 
                        }, 1500); // 1.5초 지연
                    }
                });

                // 사용자가 "예"를 선택한 경우에만 폼 제출 허용
                return shouldSubmitForm;
            }
        }

        
        function inputNumberFormat(input) {
            // 사용자가 입력한 값을 가져옴
            var inputValue = input.value.replace(/,/g, ''); // 쉼표 제거

            // 쉼표를 추가하여 가독성을 높임
            var formattedValue = parseInt(inputValue, 10).toLocaleString('en');

            // 입력 필드에 반영
            input.value = formattedValue;
        }
    </script>

