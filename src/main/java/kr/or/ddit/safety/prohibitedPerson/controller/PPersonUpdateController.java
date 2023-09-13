package kr.or.ddit.safety.prohibitedPerson.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.safety.prohibitedPerson.service.ProhibitedPersonService;
import kr.or.ddit.safety.vo.ProhibitedPersonVO;
import kr.or.ddit.validate.UpdateGroup;

@Controller
public class PPersonUpdateController {

	@Inject
	private ProhibitedPersonService service;

	@ModelAttribute("pperson")
	public ProhibitedPersonVO pperson() {
		return new ProhibitedPersonVO();
	}

	@RequestMapping("/safety/enterUpdate.do")
	public String updateForm(@RequestParam(name = "what", required = true) String pno,
			@RequestParam("ppWw") String ppWw,
			Model model,
			@ModelAttribute("pperson") ProhibitedPersonVO properson) {

		ProhibitedPersonVO enterPerson = service.retrievePPerson(pno);
		model.addAttribute("enterPerson", enterPerson);
		
		String viewName = null;
		
		if("in".equals(ppWw)) {
			viewName = "safety/prohibitPerson/enterUpdate";
		}else if("out".equals(ppWw)) {
			viewName = "safety/prohibitPerson/exitUpdate";
		}
			
		return viewName;
	}

	
	
	
	
	@PostMapping("/safety/ppersonUpdate.do")
	public String ppersonUpdate(
			@Validated(UpdateGroup.class) 
			@ModelAttribute("enterPerson") ProhibitedPersonVO properson,
			Model model, Errors errors) {

		String logicalViewName = null;

		if (!errors.hasErrors()) {
			int result = service.modifyPPerson(properson);
			if (result > 0) {
					logicalViewName = "redirect:/safety/PPersonView.do?what=" + properson.getPpPno();
			} else {
				if("in".equals(properson.getPpWw())) {
					model.addAttribute("message", "입국금지자 수정 중 문제 발생");
					logicalViewName = "safety/prohibitPerson/enterUpdate";
				}else if("out".equals(properson.getPpWw())) {
					model.addAttribute("message", "출국금지자 수정 중 문제 발생");
					logicalViewName = "safety/prohibitPerson/exitUpdate";
				}
			}

		} else {
			if("in".equals(properson.getPpWw())) {
				model.addAttribute("message", "입국금지자 수정 중 문제 발생");
				logicalViewName = "safety/prohibitPerson/enterUpdate";
			}else if("out".equals(properson.getPpWw())) {
				model.addAttribute("message", "출국금지자 수정 중 문제 발생");
				logicalViewName = "safety/prohibitPerson/exitUpdate";
			}
		}

		return logicalViewName;

	}
}
