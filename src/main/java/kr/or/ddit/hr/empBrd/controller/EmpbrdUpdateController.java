
package kr.or.ddit.hr.empBrd.controller;

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

import kr.or.ddit.hr.empBrd.service.EmpbrdService;
import kr.or.ddit.hr.vo.EmpbrdVO;
import kr.or.ddit.validate.UpdateGroup;

@Controller
@RequestMapping("/hr/empbrd/empbrdUpdate.do")
public class EmpbrdUpdateController {

	@Inject 
	private EmpbrdService service;

	@GetMapping
	public String updateForm(
			Model model
			, @RequestParam("what") int ebNo
	) {
		EmpbrdVO empbrd = service.retrieveEmpbrd(ebNo);
		model.addAttribute("empbrd", empbrd);

		return "hr/empbrd/empbrdEdit";
	}

	@PostMapping
	public String updateEmpbrd (
			Model model
			, @Validated(UpdateGroup.class) @ModelAttribute("empbrd") EmpbrdVO empbrd
			, BindingResult errors
			) {

		String viewName = null;

		if (!errors.hasErrors()) {
			boolean success = service.modfiyEmpbrd(empbrd);
			if (success) {
				viewName = "redirect:/hr/empbrd/empbrdView.do?what=" + empbrd.getEbNo();
			} else {
				model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요.");
				viewName = "hr/empbrd/empbrdForm";
			}
		} else {
			viewName = "hr/empbrd/empbrdEdit";
		}
		return viewName;
	}
}
