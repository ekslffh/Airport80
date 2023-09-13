//// 휴가 신청 리스트 
//
//package kr.or.ddit.hr.vacationReq.controller;
//
//import java.util.List;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import kr.or.ddit.hr.vacationReq.service.VacationService;
//import kr.or.ddit.hr.vo.VacationReqVO;
//import kr.or.ddit.vo.PaginationInfo;
//import kr.or.ddit.vo.SimpleCondition;
//import lombok.RequiredArgsConstructor;
//
//@Controller
//@RequiredArgsConstructor
//@RequestMapping("/hr/vacation/")
//public class VacationReqRetrieveController {
//	
//	private final VacationService service;
//	
//	@ModelAttribute("simpleCondition")
//	public SimpleCondition simpleCondition() {
//	    return new SimpleCondition();
//	}
//	
//	@RequestMapping("vacreqList.do")
//	public void vacreqList(
//		@RequestParam(name="page", required=false, defaultValue="1") long currentPage
//		, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
//		, Model model
//	) {
//		PaginationInfo<VacationReqVO> paging = new PaginationInfo<>();
//		paging.setCurrentPage(currentPage);
//		paging.setSimpleCondition(simpleCondition);
//		
//		List<VacationReqVO> vacreqList = service.retrieveVacReqList(paging);
//		
//		paging.setDataList(vacreqList);
//		
//		model.addAttribute("paging", paging);
//	}
//	
//	@RequestMapping("vacreqView.do")
//	public String vacreqView (
//		@RequestParam(name="what", required=true) String vrId
//		, Model model
//	) {
//		VacationReqVO vacreq = service.retrieveVacReq(vrId);
//		model.addAttribute("vacreq", vacreq);
//		
//		return "hr/vacation/vacreqView";		
//	}
//	
//	@RequestMapping("vacreqModal.do")
//	public String vacreqModal (
//			@RequestParam(name="what", required=true) String vrId
//			, Model model
//			) {
//		VacationReqVO vacreq = service.retrieveVacReq(vrId);
//		model.addAttribute("vacreq", vacreq);
//		
//		return "hr/vacation/ajax/vacreqModal";		
//	}
//}
