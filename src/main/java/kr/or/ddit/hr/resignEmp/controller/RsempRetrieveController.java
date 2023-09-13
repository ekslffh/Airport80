package kr.or.ddit.hr.resignEmp.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.hr.resignEmp.service.ResignEmpService;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hr/remp/")
public class RsempRetrieveController {
	
	private final ResignEmpService service;
	
	@RequestMapping("rempList.do")
	public void rempList(
		@RequestParam(name="page", required=false, defaultValue="1") long currentPage
		, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
		, Model model
	) {
		PaginationInfo<EmployeeVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<EmployeeVO> rempList = service.retrieveRempList(paging);
		
		paging.setDataList(rempList);
		
		model.addAttribute("paging", paging);
		
	}
	
	@RequestMapping("rempModal.do")
	public String empView (
		@RequestParam(name="what", required=true) String empNo
		, Model model
	) {
		EmployeeVO emp = service.retrieveRemp(empNo);
		model.addAttribute("emp", emp);
		
		return "hr/remp/ajax/rempModal";		
	}
}
