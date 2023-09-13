
// 페이징
function fn_paging(page){
		searchForm.page.value = page;
		searchForm.requestSubmit();
		console.log(page);
}


// 검색
$(searchBtn).on("click", function(event){
	$(searchUI).find(":input[name]").each(function(idx, input){
		let name = input.name;
		let value = $(input).val();
		$(searchForm).find(`[name=${name}]`).val(value);
	});
	$(searchForm).submit();
});
	
	
// 모달
$(verticalycentered)
   .on("show.bs.modal", function(event) {
      let ctrStatus = event.relatedTarget.dataset['ctrStatus'];
      let ctrId = event.relatedTarget.dataset['ctrId'];
      let vendId = event.relatedTarget.dataset['vendId'];
      let vendCtrId = event.relatedTarget.dataset['vendCtrId'];
      
      console.log("ctrStatus", ctrStatus);
      console.log("ctrId", ctrId);
      console.log("vendId", vendId);
      console.log("vendCtrId", vendCtrId);
      
      $("#ctrStatusSelect").val(ctrStatus);
      $("#vendId").val(vendId);
      $("#vendCtrId").val(vendCtrId);
      $("#ctrId").val(ctrId);
   })
   .on("hidden.bs.modal", function() {
      let $modalBody = $(this).find(".modal-body");
      $modalBody.empty();
   });

function getVendorList() {
	console.log("선택됏다 우하하!");
	
}

function getVendorList2() {
	$("#vendorF").val(vendType);
	console.log("vendType", vendType);
}