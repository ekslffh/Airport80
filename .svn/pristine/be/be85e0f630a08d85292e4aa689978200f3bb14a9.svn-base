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
	
$(verticalycentered)
   .on("show.bs.modal", function(event) {
      let alStatus = event.relatedTarget.dataset['alstatus'];
      let alCd = event.relatedTarget.dataset['alcd'];
      console.log("alStatus", alStatus);
      console.log("alCd", alCd);
      $("#alStatusSelect").val(alStatus);
      $("#alCd").val(alCd);
   })
   .on("hidden.bs.modal", function() {
      let $modalBody = $(this).find(".modal-body");
      $modalBody.empty();
   });