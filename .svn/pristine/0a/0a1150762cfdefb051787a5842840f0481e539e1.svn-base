package kr.or.ddit.operate.bidNotice.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.operate.bidNotice.service.BidNoticeService;
import kr.or.ddit.operate.vo.bidApplicationVO;
import kr.or.ddit.operate.vo.bidNoticeVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;

@Controller
public class BnSelectController {
	
	@Inject
	private BidNoticeService service;
	
	@ModelAttribute("bn")
	public bidNoticeVO bn() {
		return new bidNoticeVO();
	}

	
	@RequestMapping("/operate/bidNotice/bnList.do")
	public String bnList
			(@RequestParam(name="page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
			) {
		
//		PaginationInfo<bidNoticeVO> paging = new PaginationInfo<>();
//		paging.setCurrentPage(currentPage);
//		paging.setSimpleCondition(simpleCondition);
		
		List<bidNoticeVO> bnList = service.retrieveBnList();
//		paging.setDataList(bnList);
		
		model.addAttribute("bnList", bnList);
//		model.addAttribute("paging", paging);
		
		return "operate/bidNotice/bnList";
		
	}
	
	@RequestMapping("/operate/bidNotice/bnView.do")
	public String bnView
		(@RequestParam(name = "what", required = true) int bnNo, Model model) {
		bidNoticeVO bn = service.retrieveBn(bnNo);
		model.addAttribute("bn", bn);
		return "operate/bidNotice/bnView";
		
	}

	@RequestMapping("/operate/bidNotice/bnStatusUpdate.do")
	public String bnstuUpdate(
			Model model, @ModelAttribute("bn") bidNoticeVO bn
			, BindingResult errors
			) {
		String logicalViewName = null;
		if(!errors.hasErrors()) {
			boolean success = service.modifyBnStatus(bn);
			if(success) {
				logicalViewName = "redirect:/operate/bidNotice/bnList.do";
			}else {
				logicalViewName = "operate/bidNotice/bnList";
			}
		}else {
			logicalViewName = "operate/bidNotice/bnList";
		}
		return logicalViewName;
	}
	
	
	
	//비로그인
	
	@RequestMapping("/open/operate/bnList.do")
	public String obnList
			(@RequestParam(name="page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
			) {
		
//		PaginationInfo<bidNoticeVO> paging = new PaginationInfo<>();
//		paging.setCurrentPage(currentPage);
//		paging.setSimpleCondition(simpleCondition);
		
		List<bidNoticeVO> bnList = service.retrieveBnList();
//		paging.setDataList(bnList);
		
		model.addAttribute("bnList", bnList);
//		model.addAttribute("paging", paging);
		
		return "open/operate/bnList";
		
	}
	
	@RequestMapping("/open/operate/bnView.do")
	public String obnView
		(@RequestParam(name = "what", required = true) int bnNo, Model model) {
		bidNoticeVO bn = service.retrieveBn(bnNo);
		model.addAttribute("bn", bn);
		return "open/operate/bnView";
		
	}
	

	
}
