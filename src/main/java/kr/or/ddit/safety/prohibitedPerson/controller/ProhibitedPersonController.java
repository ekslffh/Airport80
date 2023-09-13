package kr.or.ddit.safety.prohibitedPerson.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.safety.prohibitedPerson.service.ProhibitedPersonService;
import kr.or.ddit.safety.vo.ProhibitedPersonVO;
import kr.or.ddit.validate.InsertGroup;

@Controller
public class ProhibitedPersonController {

	@Inject
	private ProhibitedPersonService service;

	@ModelAttribute("enterPerson")
	public ProhibitedPersonVO enterPerson() {
		return new ProhibitedPersonVO();
	}
	
	// 출국금지자 등록
	@GetMapping("/safety/exinsertForm.do")
	public String exinsertForm(
			
			) {
		return "safety/prohibitPerson/exitPesonInsert";
	}

	// 입국금지자 등록
	@GetMapping("/safety/insertForm.do")
	public String insertForm() {
		return "safety/prohibitPerson/enterPesonInsert";
	}

	@PostMapping("/safety/enterPersonInsert.do")
	public String enterPersonInsert(
			@Validated(InsertGroup.class) @ModelAttribute("enterPerson") 
			ProhibitedPersonVO pperson, 
			Errors errors,
			Model model) {

		String logicalViewName = null;

		if (!errors.hasErrors()) {
			int result = service.createPPerson(pperson);
			if (result > 0) {
					logicalViewName = "redirect:/safety/PPersonView.do?what=" + pperson.getPpPno();
				
			} else {
				if("in".equals(pperson.getPpWw())) {
					model.addAttribute("message", "입국금지자 등록 중 문제 발생");
					logicalViewName = "safety/prohibitPerson/enterPesonInsert";
				}else if("out".equals(pperson.getPpWw())) {
					model.addAttribute("message", "출국금지자 등록 중 문제 발생");
					logicalViewName = "safety/prohibitPerson/exitPesonInsert";
				}
			}

		} else {
			if("in".equals(pperson.getPpWw())) {
				logicalViewName = "safety/prohibitPerson/enterPesonInsert";
			}else if("out".equals(pperson.getPpWw())) {
				logicalViewName = "safety/prohibitPerson/exitPesonInsert";
			}
		}

		return logicalViewName;
	}

	// 입국금지자 조회
	@RequestMapping("/safety/enterPerson.do")
	public String enterPersonList(Model model) {
		List<ProhibitedPersonVO> ppersonList = service.retrieveEnterPersonList();
		model.addAttribute("ppersonList", ppersonList);
		return "safety/prohibitPerson/ajax/enterPersonList";
	}

	// 출국금지자 조회
	@RequestMapping("/safety/exitPerson.do")
	public String exitPersonList(Model model) {
		List<ProhibitedPersonVO> ppersonList = service.retrieveExitPersonList();
		model.addAttribute("ppersonList", ppersonList);
		return "safety/prohibitPerson/exitPersonList";
	}

	
	
	
	// 상세조회(공통)
	@RequestMapping("/safety/PPersonView.do")
	public String PPersonView(
		@RequestParam(name = "what", required = true) String ppPno, Model model) {
		ProhibitedPersonVO pperson = service.retrievePPerson(ppPno);
		model.addAttribute("pperson", pperson);
		return "safety/prohibitPerson/ppersonView";
	}
	
	
	
	

	// 삭제
	@PostMapping("/safety/PPersonDelete.do")
	public String PPersonDelete(
			@RequestParam("ppPno") String ppPno, @RequestParam("ppWw") String ppWw,
			RedirectAttributes redirectAttributes) {
		int result = service.removePPerson(ppPno);

		String viewName = null;

		if (result > 0) {
			if ("in".equals(ppWw)) {
				viewName = "redirect:/safety/enterPerson.do";
			} else if ("out".equals(ppWw)) {
				viewName = "redirect:/safety/exitPerson.do";
			}
		} else {
			redirectAttributes.addFlashAttribute("message", "입국금지자 삭제 실패");
			viewName = "redirect:/safety/PPersonView.do?what=" + ppPno;
		}

		return viewName;
	}
}
