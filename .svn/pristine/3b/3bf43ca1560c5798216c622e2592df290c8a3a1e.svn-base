package kr.or.ddit.safety.confiscationInfo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.safety.confiscationInfo.service.ConfiscationInfoService;
import kr.or.ddit.safety.vo.ConfiscationInfoVO;
import kr.or.ddit.safety.vo.LiquidVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/safety")
public class ConfiscationInfoController {

	private final ConfiscationInfoService service;

	// 반입불가품목 조회, 액체류 조회 
	@RequestMapping("ConfisInfo.do")
	public String confisInfoList(
			 @RequestParam(name="page", required = false, defaultValue = "1" ) long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			,Model model
			) {
		
		//pagination 객체 생성
		PaginationInfo<ConfiscationInfoVO> paging = new PaginationInfo<>(10,5);
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<ConfiscationInfoVO> confisList = service.retrieveConfisInfoList(paging);
		
		List<LiquidVO> liquidList = service.retrieveLiquidList();
		
		
		paging.setDataList(confisList);
		
		model.addAttribute("paging",paging);
		model.addAttribute("liquidList", liquidList);
		
		return "safety/confisInfo/confisInfoList";
	}
	
	//상세조회
	@RequestMapping("confisInfoView.do")
	public String confisView(
			@RequestParam(name="what", required = true) int ciNo,
			Model model) {
		ConfiscationInfoVO confisInfo = service.retrieveConfisInfo(ciNo);
		model.addAttribute("confisInfo", confisInfo);
		
		return "safety/confisInfo/confisInfoView";
	}
	
	// 삭제
	@PostMapping("confisInfoDelete.do")
	public String confisInfoDelete(
			@RequestParam("ciNo") int ciNo,
			RedirectAttributes redirectAttributes
			) {
		int result = service.removeConfisInfo(ciNo);
		
		String viewName = null;
		
		if(result>0) {
			viewName = "redirect:/safety/ConfisInfo.do";
		}else {
			redirectAttributes.addFlashAttribute("message","반입불가품목 삭제 실패");
			viewName = "redirect:/safety/confisInfoView.do?what="+ciNo;
		}
		
		return viewName;
		
	}

	
}

