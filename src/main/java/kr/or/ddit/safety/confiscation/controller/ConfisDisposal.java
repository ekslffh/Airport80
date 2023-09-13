package kr.or.ddit.safety.confiscation.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.safety.confiscation.service.ConfiscationService;
import kr.or.ddit.safety.vo.ConfiscationVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/safety/disposal")
public class ConfisDisposal {

	private final ConfiscationService service;
	
	@ModelAttribute("confis")
	public ConfiscationVO confis() {
		return new ConfiscationVO();
	}

	// 압수품(폐기) 조회
	@GetMapping("/list.do")
	public String confisDisposalList(
			 @RequestParam(name="page", required = false, defaultValue = "1" ) long currentPage
				, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
				, Model model
			) {
			//pagination 객체 생성
			PaginationInfo<ConfiscationVO> paging = new PaginationInfo<>(10,5);
			paging.setCurrentPage(currentPage);
			paging.setSimpleCondition(simpleCondition);
			
			List<ConfiscationVO> disposalList = service.retrieveDisposal(paging);
			
			//총개수
			long totalCount = service.disCountTotal(paging);
			
			paging.setDataList(disposalList);
			
			model.addAttribute("paging", paging);
			model.addAttribute("totalCount", totalCount);
			
			return "safety/confiscation/disposalList";
			
	}
	
	// 압수품(폐기) 상세조회
	@GetMapping("/view.do")
	public String confisDisposalView(
			@RequestParam(name = "what") String csId,
			Model model) {
		ConfiscationVO confis = service.retriveDisposalOne(csId);
		model.addAttribute("confis", confis);
		return "safety/confiscation/disposalViewjsp";
	}
}

