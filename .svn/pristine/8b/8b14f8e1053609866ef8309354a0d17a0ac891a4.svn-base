package kr.or.ddit.operate.airline.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.operate.airline.service.AirlineService;
import kr.or.ddit.operate.vo.AirlineVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/hr/airline/")
@RequiredArgsConstructor
public class AirlineRetrieveController {
	
	private final AirlineService service;
	
	@ModelAttribute("airline")
	public AirlineVO airline() {
		return new AirlineVO();
	}
	
	// 항공사 조회
	@RequestMapping("airlineList.do")
	public void airlineList (
			@RequestParam(name = "page", required = false, defaultValue="1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
	) {
		PaginationInfo<AirlineVO> paging = new PaginationInfo<>();
		AirlineVO airline = new AirlineVO();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<AirlineVO> airlineList = service.retrieveAirlineList(paging);
		
		long totalCount = service.countTotal(paging);
		
		long alOn = service.countAirlineOn(airline);
		long alOff = service.countAirlineOff(airline);
		long alStop = service.countAirlineStop(airline);
		
		paging.setDataList(airlineList);
		
		model.addAttribute("alOn", alOn);
		model.addAttribute("alOff", alOff);
		model.addAttribute("alStop", alStop);
		model.addAttribute("paging", paging);
		model.addAttribute("totalCount", totalCount);
	}
	
	// 항공사 상세보기
	@RequestMapping("airlineView.do")
	public void airlineView (
			@RequestParam("what") String alCd
			, Model model
		){
		AirlineVO airline = service.retrieveAirline(alCd);
		model.addAttribute("airline", airline);
	}
	
	

	
}
