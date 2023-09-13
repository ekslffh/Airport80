function fn_paging(page){
		searchForm.page.value = page;
		searchForm.requestSubmit();
		console.log(page);
}

$(searchBtn).on("click", function(event){
	$(searchUI).find(":input[name]").each(function(idx, input){
		let name = input.name;
		let value = $(input).val();
		$(searchForm).find(`[name=${name}]`).val(value);
	});
	$(searchForm).submit();
});
	
