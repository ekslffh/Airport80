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
      let what = event.relatedTarget.dataset['what'];
      let $modalBody = $(this).find(".modal-body");
      let viewURL = this.dataset['url'];
      if (what) {
         let settings = {
            url : viewURL,
            dataType : "html",
            data: {
               what : what
            },
            success : function(resp) {
               $modalBody.html(resp);
            }
         };

         $.ajax(settings);
      }
   })
   .on("hidden.bs.modal", function() {
      let $modalBody = $(this).find(".modal-body");
      $modalBody.empty();
   });
   
