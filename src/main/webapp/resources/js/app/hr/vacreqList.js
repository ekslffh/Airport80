
	
$(vacreqList)
   .on("show.bs.modal", function(event) {
   	console.log("dfdf")
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
   
   
