package kr.or.ddit.hr.empBrd.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.hr.empBrd.service.EmpbrdService;
import kr.or.ddit.hr.vo.EmpbrdVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/hr/empbrd")
public class EmpbrdRetrieveController {
	
	private final EmpbrdService service;
	
	@RequestMapping("empbrdList.do")
	public void empbrdList(
	        @RequestParam(name="page", required = false, defaultValue="1") long currentPage,
	        @ModelAttribute("simpleCondition") SimpleCondition simpleCondition,
	        Model model) {

	    PaginationInfo<EmpbrdVO> empbrdPaging = new PaginationInfo<>();
	    empbrdPaging.setCurrentPage(currentPage);
	    empbrdPaging.setSimpleCondition(simpleCondition);
	    
	    List<EmpbrdVO> ebPubList = service.retrieveEbpubList();
	    
	    List<EmpbrdVO> empbrdList = service.retrieveEmpbrdList(empbrdPaging);
	    empbrdPaging.setDataList(empbrdList);
	    
	    model.addAttribute("pubList", ebPubList);
	    model.addAttribute("paging", empbrdPaging);
	}
	
	@RequestMapping("empbrdView.do")
	public void empbrdView (
			@RequestParam("what") int ebNo
			, Model model
		) {
		service.increaseViews(ebNo);
		EmpbrdVO empbrd = service.retrieveEmpbrd(ebNo);
		model.addAttribute("empbrd", empbrd);
	}
}
