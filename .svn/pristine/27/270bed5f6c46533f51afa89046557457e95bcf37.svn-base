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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.operate.bidNotice.dao.BidCommonDAO;
import kr.or.ddit.operate.bidNotice.service.BidNoticeService;
import kr.or.ddit.operate.vo.bidNoticeVO;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.CommonCodeVO;

@Controller
@RequestMapping("/operate/bidNotice/ajaj")
public class BnInsertController {
	
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
	
	@GetMapping("/bnInsert.do")
	public String bnForm(Model model) {
		model.addAttribute("bn", new bidNoticeVO());
		return "operate/bidNotice/ajaj/bnForm";
	}
	
	@PostMapping("/bnInsert.do")
	public String insertBn(
			@ModelAttribute("bn") @Validated(InsertGroup.class) bidNoticeVO bn
			, Errors errors
			, RedirectAttributes redirectAttributes
			,@RequestParam String bnAmtString
			){
		
		
		 String amt = bnAmtString.replace(",", ""); // 반점 제거
	     int amtint = Integer.parseInt(amt); // 정수로 변환
	     bn.setBnAmt(amtint);
		
		String viewName = null;
		
		if(!errors.hasErrors()) {
			boolean success = service.createBn(bn);
			if(success) {
				viewName = "redirect:/operate/bidNotice/bnList.do";
			}else {
				viewName = "operate/bidNotice/ajaj/bnForm";
			}
		}else {
			System.out.println("에러"+errors.getAllErrors());
			viewName = "operate/bidNotice/ajaj/bnForm";
		}
		return viewName;
	}

	

}
