package kr.or.ddit.operate.bidApplication.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.operate.bidApplication.service.BidApplService;
import kr.or.ddit.operate.bidNotice.service.BidNoticeService;
import kr.or.ddit.operate.vo.bidApplicationVO;
import kr.or.ddit.operate.vo.bidNoticeVO;
import kr.or.ddit.validate.DeleteGroup;

@Controller
@RequestMapping("/operate/bidApplication")
public class BaDeleteController {
	
	@Inject
	private BidApplService service;
	
	@GetMapping("/baDelete.do")
	public String baDelete(@Validated(DeleteGroup.class)bidApplicationVO ba,
			Errors errors){
		String viewName = null;
	
		if(!errors.hasErrors()) {
			boolean success = service.removeBa(ba.getBaId());
			if(success) {
				viewName = "redirect:/open/operate/bnList.do";
			}else {
				viewName = "redirect:/operate/bidApplication/baView.do?what=" + ba.getBaId();
			}
		}else {
			viewName = "redirect:/operate/bidApplication/baView.do?what=" + ba.getBaId();
		}
		return viewName;
	}

}
