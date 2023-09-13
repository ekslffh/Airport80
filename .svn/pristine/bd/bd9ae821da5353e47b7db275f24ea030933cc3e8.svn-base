package kr.or.ddit.operate.airline.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.operate.airline.service.AirlineService;
import kr.or.ddit.operate.vo.AirlineVO;

@Controller
@RequestMapping("/hr/airline")
public class AirlineUpdateController {
	
	@Inject
	private AirlineService service;
	
	@GetMapping("airlineUpdate.do")
	public String updateForm (
		Model model
		, @RequestParam("what") String alCd
	) {
		AirlineVO airline = service.retrieveAirline(alCd);
		model.addAttribute("airline", airline);
		
		return "hr/airline/airlineEdit";
	}
	
	@PostMapping("airlineUpdate.do")
	public String updateAirline (
		Model model
		, @ModelAttribute("airline") AirlineVO airline
		, BindingResult errors
	) {
		
		String viewName = null;
		
		model.addAttribute("airline", airline);
		
		if (!errors.hasErrors()) {
			boolean success = service.modifyAirline(airline);
			if(success) {
				viewName = "redirect:/hr/airline/airlineView.do?what=" + airline.getAlCd();
			} else {
				model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요");
				viewName = "hr/airline/airlineEdit";
			}
		} else {
			viewName = "hr/airline/airlineEdit";
		}
		return viewName;
	}
	
	// 항공사 상태 변경
	@RequestMapping("airlineModal.do")
	public String airlineModal (
		Model model
		, @ModelAttribute("airline") AirlineVO airline
		, BindingResult errors
	) {
		
		String viewName = null;
		
		model.addAttribute("airline", airline);
		
		if (!errors.hasErrors()) {
			boolean success = service.modfiyStatus(airline);
			if(success) {
//				viewName = "redirect:/hr/airline/airlineView.do?what=" + airline.getAlCd();
				viewName = "redirect:/hr/airline/airlineList.do";
			} else {
				model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요");
				viewName = "hr/airline/airlineList.do";
			}
		} else {
			viewName = "hr/airline/airlineList.do";
		}
		return viewName;
	}
	
}
