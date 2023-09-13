package kr.or.ddit.hr.eplStatus.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.hr.common.dao.HrCommonDAO;
import kr.or.ddit.hr.eplStatus.service.EplstatusService;
import kr.or.ddit.hr.vo.EplstatusVO;
import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/hr/parking")
public class EplstatusRetrieveController {

	private final EplstatusService service;
	
	@Inject
	private HrCommonDAO HCDao;
	
	@ModelAttribute("parkArea")
	public List<CommonCodeVO> parckArea(){
		return HCDao.selectEpList();
	}
	
	@RequestMapping("eplList.do")
	public void eplList(
		@RequestParam(name="page", required = false, defaultValue="1") long currentPage
		, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
		, Model model
	) {
		PaginationInfo<EplstatusVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<EplstatusVO> eplList = service.retrieveEplList(paging);
		paging.setDataList(eplList);
		
		model.addAttribute("paging", paging);
		
		model.addAttribute("eplstatus", new EplstatusVO());
	}
	
	@RequestMapping("eplView.do")
	public String eplView (
			@RequestParam("what") String eplId
			, Model model
		) { 
		
		EplstatusVO eplstatus = service.retrieveEpl(eplId);
		model.addAttribute("eplstatus", eplstatus);
		
		return "hr/parking/ajax/eplView";
		
	}
	
}
