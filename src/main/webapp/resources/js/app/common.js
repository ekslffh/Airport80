// 페이징
function fn_paging(page) {
	searchForm.page.value = page;
	searchForm.requestSubmit();
}
// 검색
$(searchBtn).on("click", function(event) {
	$(searchUI).find(":input[name]").each(function(idx, input) {
		let name = input.name;
		let value = $(input).val();
		$(searchForm).find(`[name=\${name}]`).val(value);
	});
	$(searchForm).submit();
});