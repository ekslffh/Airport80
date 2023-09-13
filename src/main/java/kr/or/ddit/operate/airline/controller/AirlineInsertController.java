package kr.or.ddit.operate.airline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.operate.airline.service.AirlineService;
import kr.or.ddit.operate.vo.AirlineVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hr/airline/airlineInsert.do")
public class AirlineInsertController {
	
	private final AirlineService service;
	
	@ModelAttribute("airline")
	public AirlineVO airline() {
		return new AirlineVO();
	}
	
	@GetMapping
	public String airlineForm() {
		return "hr/airline/airlineForm";
	}
	
	@PostMapping
	public String airlineInsert(
		@Validated @ModelAttribute("airline") AirlineVO airline,
		BindingResult errors,
		Model model
	) {
		String viewName = null;
		
		if(!errors.hasErrors()) {
			boolean success = service.createAirline(airline);
			if (success) {
				viewName = "redirect:/hr/airline/airlineView.do?what=" + airline.getAlCd();
 			} else {
 				model.addAttribute("message", "계정 추가 중 문제 발생");
 				viewName = "hr/airline/airlineForm";
 			}
		} else {
			viewName = "hr/airline/airlineForm";
		}
		
		return viewName;
	}
}
