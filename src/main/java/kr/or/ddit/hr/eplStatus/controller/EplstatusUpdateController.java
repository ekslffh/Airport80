package kr.or.ddit.hr.eplStatus.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.hr.eplStatus.service.EplstatusService;
import kr.or.ddit.hr.vo.EplstatusVO;
import kr.or.ddit.operate.vo.AirlineVO;
import kr.or.ddit.validate.UpdateGroup;

@Controller
@RequestMapping("/hr/parking/eplUpdate.do")
public class EplstatusUpdateController {
	
	@Inject
	private EplstatusService service;
	
	@GetMapping
	public String updateForm(
	    Model model,
	    @RequestParam(name="what", required=true) String eplId
	) {
	    EplstatusVO eplstatus = service.retrieveEpl(eplId);
	    model.addAttribute("eplstatus", eplstatus); 
	    
	    return "hr/parking/eplUpdate";
	}
	
	@PostMapping
	public String updateEplstatus(
			Model model
			, @ModelAttribute("eplstatus") EplstatusVO eplstatus
			, BindingResult errors
			) {
		String viewName = null;

		if (!errors.hasErrors()) {
			boolean success = service.modifyEplstatus(eplstatus);
			if (success) {
				viewName = "redirect:/hr/parking/eplList.do";
			} else {
				model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요.");
				viewName = "hr/parking/eplInsert";
			}
		} else {
			viewName = "hr/parking/eplList";
		}

		return viewName;
	}
	
}
