package kr.or.ddit.operate.bidNotice.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.operate.bidNotice.dao.BidCommonDAO;
import kr.or.ddit.operate.bidNotice.service.BidNoticeService;
import kr.or.ddit.operate.vo.bidNoticeVO;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/operate/bidNotice/bnUpdate.do")
public class BnUpdateController {
	
	@Inject
	private BidNoticeService service;
	
	@Inject
	private BidCommonDAO bidcommonDAO;
	
	@ModelAttribute("bidstuList")
	public List<CommonCodeVO> bidstuList(){
		return bidcommonDAO.selectBidStuList();
	}
	
	@ModelAttribute("bn")
	public bidNoticeVO bn() {
		return new bidNoticeVO();
	}
	
	@GetMapping
	public String updateEdit(
			Model model
			, @RequestParam(name = "what", required = true) int bnNo
			) {
		bidNoticeVO bn = service.retrieveBn(bnNo);
		model.addAttribute("bn", bn);
		
		return "operate/bidNotice/bnEdit";
	}
	
	@PostMapping
	public String updateBn(
//			@ModelAttribute("bn")
			@Validated(UpdateGroup.class) bidNoticeVO bn
			, Errors errors 
			, RedirectAttributes redirectAttributes
			
			) {
		
		String viewName = null;
		
		if(!errors.hasErrors()) {
			boolean success = service.modifyBn(bn);
			if(success) {
				viewName = "redirect:/operate/bidNotice/bnList.do";
			}else {
				viewName = "operate/bidNotice/bnList";
			}
		}else {
			viewName = "operate/bidNotice/bnList";
		}
		return viewName;
	}
	
	
	

}
