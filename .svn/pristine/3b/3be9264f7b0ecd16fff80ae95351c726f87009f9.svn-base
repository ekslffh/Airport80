package kr.or.ddit.operate.bidApplication.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.operate.bidApplication.service.BidApplService;
import kr.or.ddit.operate.bidNotice.service.BidNoticeService;
import kr.or.ddit.operate.vo.bidApplicationVO;
import kr.or.ddit.operate.vo.bidNoticeVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;

@Controller
public class BaSelectController {
	
	@Inject
	private BidApplService service;
	
	@Inject
	private BidNoticeService bnService;
	
	@ModelAttribute("ba")
	public bidApplicationVO ba() {
		return new bidApplicationVO();
	}
	
	@ModelAttribute("bn")
	public bidNoticeVO bn() {
		return new bidNoticeVO();
	}
	
	
	@RequestMapping("/operate/bidApplication/ajaj/baList.do")
	public String baList
			(@RequestParam(name="page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
			) {
		
		PaginationInfo<bidApplicationVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<bidApplicationVO> baList = service.retrieveBaList(paging);
		paging.setDataList(baList);
		
		model.addAttribute("baList", baList);
		model.addAttribute("paging", paging);
		
		return "operate/bidApplication/ajaj/baList";
	}
	
	@RequestMapping("/operate/bidApplication/baView.do")
	public String baView
		(@RequestParam(name = "what", required = true) String baId, Model model) {
		bidApplicationVO ba = service.retrieveBa(baId);
		model.addAttribute("ba", ba);
		return "operate/bidApplication/baView";
		
	}

	@RequestMapping("/operate/bidApplication/ajaj/baStatusUpdate.do")
	public String bastuUpdate(
			Model model, @ModelAttribute("ba") bidApplicationVO ba
			,  @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			,BindingResult errors
			) {
		System.out.println("ba : "+ ba);
		String logicalViewName = null;
		if(!errors.hasErrors()) {
			boolean success = service.modifyBaStatus(ba);
			if(success) {
				logicalViewName = "redirect:/operate/bidApplication/ajaj/baList.do";
			}else { 
				logicalViewName = "operate/bidApplication/ajaj/baList";
			}
		}else {
			logicalViewName = "operate/bidApplication/ajaj/baList";
		}
		return logicalViewName;
	}
	
	
	@RequestMapping("/operate/bidApplication/ajaj/noBaList.do")
	public String noBaList(
			Model model, 
			@RequestParam(name="bnNo") int bnNo) {

			List<bidApplicationVO> noBaList = service.retrieveNoBaList(bnNo);
			model.addAttribute("noBaList", noBaList);
		return "operate/bidApplication/ajaj/noBaList";
		
		
		
	}
			

	//비로그인
	@GetMapping("/open/operate/ajaj/baList.do")
	public String obaList
			(@RequestParam(name="page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
			) {
		
		PaginationInfo<bidApplicationVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<bidApplicationVO> baList = service.retrieveBaList(paging);
		paging.setDataList(baList);
		
		model.addAttribute("baList", baList);
		model.addAttribute("paging", paging);
		
		return "open/operate/ajaj/baList";
		
	}
	
	@RequestMapping("/open/operate/baView.do")
	public String obaView
		(@RequestParam(name = "what", required = true) String baId, Model model) {
		bidApplicationVO ba = service.retrieveBa(baId);
		model.addAttribute("ba", ba);
		return "open/operate/baView";
		
	}
	
	
	@RequestMapping("/open/operate/ajaj/noBaList.do")
	public String onoBaList(
			Model model, 
			@RequestParam(name="bnNo") int bnNo) {

			List<bidApplicationVO> noBaList = service.retrieveNoBaList(bnNo);
			model.addAttribute("noBaList", noBaList);
		return "open/operate/ajaj/noBaList";
		
		
	}
	
	
}
