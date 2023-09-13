package kr.or.ddit.operate.bidNotice.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.operate.bidNotice.service.BidNoticeService;
import kr.or.ddit.operate.vo.bidNoticeVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;

@Controller
@RequestMapping("/operate/bidNotice")
public class BnDeleteController {
	
	@Inject
	private BidNoticeService service;
	
	@GetMapping("/bnDelete.do")
	public String bnDelete(@Validated(DeleteGroup.class)bidNoticeVO bn,
			Errors errors){
		String viewName = null;
	
		if(!errors.hasErrors()) {
			boolean success = service.removeBn(bn.getBnNo());
			if(success) {
				viewName = "redirect:/operate/bidNotice/bnList.do";
			}else {
				viewName = "redirect:/operate/bidNotice/bnView.do?what=" + bn.getBnNo();
			}
		}else {
			viewName = "redirect:/operate/bidNotice/bnView.do?what=" + bn.getBnNo();
		}
		return viewName;
	}

}
