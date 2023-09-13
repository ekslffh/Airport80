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
import kr.or.ddit.operate.bidNotice.dao.BidCommonDAO;
import kr.or.ddit.operate.bidNotice.service.BidNoticeService;
import kr.or.ddit.operate.vo.bidApplicationVO;
import kr.or.ddit.operate.vo.bidNoticeVO;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BaUpdateController {
	
	@Inject
	private BidApplService baservice;
	
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
	
	@GetMapping("/operate/bidApplication/baUpdate.do")
	public String updateEdit(
			Model model
			, @RequestParam(name = "what", required = true) String baId
			) {
		bidApplicationVO ba = baservice.retrieveBa(baId);
		model.addAttribute("ba", ba);
		
		return "operate/bidApplication/baEdit";
	}
	
	@PostMapping("/operate/bidApplication/baUpdate.do")
	public String updateBa(
			@ModelAttribute("ba") bidApplicationVO ba
			, Errors errors
			, RedirectAttributes redirectAttributes
			
			) {
		
		String viewName = null;
		
		if(!errors.hasErrors()) {
			boolean success = baservice.modifyBa(ba);
			if(success) {
				viewName = "redirect:/operate/bidApplication/baView.do?what=" + ba.getBaId();
			}else {
				viewName = "operate/bidApplication/baForm";
			}
		}else {
			viewName = "operate/bidApplication/baEdit";
		}
		return viewName;
	}
	
	
	
	
	//비로그인
	
	
	@GetMapping("/open/operate/baUpdate.do")
	public String oupdateEdit(
			Model model
			, @RequestParam(name = "what", required = true) String baId
			) {
		bidApplicationVO ba = baservice.retrieveBa(baId);
		model.addAttribute("ba", ba);
		
		return "open/operate/baEdit";
	}
	
	@PostMapping("/open/operate/baUpdate.do")
	public String oupdateBa(
			@ModelAttribute("ba") bidApplicationVO ba
			, Errors errors
			, RedirectAttributes redirectAttributes
			
			) {
		
		String viewName = null;
		
		if(!errors.hasErrors()) {
			boolean success = baservice.modifyBa(ba);
			if(success) {
				viewName = "redirect:/open/operate/baView.do?what=" + ba.getBaId();
			}else {
				viewName = "operate/bidApplication/baForm";
			}
		}else {
			viewName = "open/operate/baEdit";
		}
		return viewName;
	}
	
	

}
