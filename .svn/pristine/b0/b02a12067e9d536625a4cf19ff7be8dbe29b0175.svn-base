package kr.or.ddit.operate.bidApplication.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.operate.bidApplication.dao.BaCommonDAO;
import kr.or.ddit.operate.bidApplication.service.BidApplService;
import kr.or.ddit.operate.bidNotice.service.BidNoticeService;
import kr.or.ddit.operate.vo.bidApplicationVO;
import kr.or.ddit.operate.vo.bidNoticeVO;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.CommonCodeVO;

@Controller
public class BaInsertController {
	
	
	@Inject
	private BidApplService baService;
	
	@Inject
	private BidNoticeService service;
	
	@Inject
	private BaCommonDAO bacommonDAO;
	
	@ModelAttribute("bastuList")
	public List<CommonCodeVO> bastuList(){
		return bacommonDAO.selectBaStuList();
	}
	

	
	@ModelAttribute("bn")
	public bidNoticeVO bn() {
		return new bidNoticeVO();
	}
	
	@ModelAttribute("ba")
	public bidApplicationVO ba() {
		return new bidApplicationVO();
	}
	
	@GetMapping("/operate/bidApplication/baInsert.do")
	public String baForm(
			Model model,
			@ModelAttribute("what") int bnNo,
			@ModelAttribute("what") String bnEnterLoc,
			@ModelAttribute("what") String bnImg,
			@ModelAttribute("ba") bidApplicationVO ba
			) {
		
		bidNoticeVO bn = service.retrieveBn(bnNo);
		String bnEnterLoc1 = bn.getBnEnterLoc(); 
		String bnImg1 = bn.getBnImg();
		model.addAttribute("bn", bn);
		model.addAttribute("bnEnterLoc", bnEnterLoc);
		model.addAttribute("bnImg", bnImg);
		return "operate/bidApplication/baForm";
	}
	
	
	@PostMapping("/operate/bidApplication/baInsert.do")
	public String insertBa(
			@ModelAttribute("ba") bidApplicationVO ba
			, Errors errors
			, RedirectAttributes redirectAttributes){
		
		String viewName = null;
		
		if(!errors.hasErrors()) {
			boolean success = baService.createBa(ba);
			if(success) {
				viewName = "redirect:/operate/bidApplication/baView.do?what=" + ba.getBaId();
			}else {
				viewName = "operate/bidApplication/baForm";
			}
		}else {
			viewName = "operate/bidApplication/baForm";
		}
		return viewName;
	}

	
	
	//비로그인
	
	@GetMapping("/open/operate/ajaj/baInsert.do")
	public String obaForm(
			Model model,
			@RequestParam(name = "bnNo") int bnNo,
			
			
			@ModelAttribute("ba") bidApplicationVO ba
			) {
		
		bidNoticeVO bn = service.retrieveBn(bnNo);
		
		String bnEnterLoc = bn.getBnEnterLoc(); 
		model.addAttribute("bn", bn);
		model.addAttribute("bnEnterLoc", bnEnterLoc);
		return "open/operate/ajaj/baForm";
	}
	
	
	
	@PostMapping("/open/operate/ajaj/baInsert.do")
	public String oinsertBa(
			@ModelAttribute("ba") bidApplicationVO ba
			, Errors errors
			, RedirectAttributes redirectAttributes){
		
		String viewName = null;
		 
		if(!errors.hasErrors()) {
			boolean success = baService.createBa(ba);
			if(success) {
				viewName = "redirect:/open/operate/bnList.do#balist";
			}else {
				viewName = "open/operate/baForm";
			}
		}else {
			viewName = "open/operate/ajaj/baForm";
		}
		return viewName;
	}
	
//	@GetMapping("/open/operate/ajaj/baInsert.do")
//	public String insertBa(
//			@RequestParam(name="what", required = true) int bnNo,
//			Model model
//			) {
//		bidNoticeVO bnList = service.retrieveBn(bnNo);
//		model.addAttribute("bnList", bnList);
//		
//		return "open/operate/ajaj/baInsert";
//	}
//	
	
	

		
	

}
