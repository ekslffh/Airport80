// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// AJAX를 사용하여 JSON 데이터 가져오기
$.ajax({
	url: '${pageContext.request.contextPath }/accounting/history/cntMonthAmt', // 컨트롤러 엔드포인트
	type: 'GET',
	dataType: 'json',
	success: function(data) {
		// 데이터 가져오기 성공 시 차트 그리기
		console.log("차트위한 josn데이터:", data);
	},
	error: function(error) {
		console.error('데이터를 가져오는 중 오류 발생:', error);
	}
});