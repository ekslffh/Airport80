


package kr.or.ddit.operate.custNoticeBrd.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.operate.custNoticeBrd.dao.CustNoticeBrdDAO;
import kr.or.ddit.operate.custNoticeBrd.service.CustNoticeBrdService;
import kr.or.ddit.operate.vo.CustNoticeBrdVO;
import kr.or.ddit.validate.UpdateGroup;

@Controller
@RequestMapping("/operate/custNoticeBrd")
public class CnbUpdateController {
	
	@Inject
	private CustNoticeBrdService service;
	@Inject
	private CustNoticeBrdDAO dao;
	
	 @ModelAttribute("cnb")
	    public CustNoticeBrdVO cnb() {
	        return new CustNoticeBrdVO();
	    }
	
	@GetMapping("/cnbUpdate.do")
	public String updateForm(
			Model model
			, @RequestParam("what") int cnbNo
			) {
		CustNoticeBrdVO cnb = service.retrieveCnb(cnbNo);
		model.addAttribute("cnb", cnb);
		
		return "operate/custNoticeBrd/cnbEdit";
	}
	
	@PostMapping("/cnbUpdate.do")
	public String updateCnb(
			@ModelAttribute("cnb")
			@Validated(UpdateGroup.class) CustNoticeBrdVO cnb
			, Errors errors
			, RedirectAttributes redirectAttributes
			
			) {
		
		String viewName = null;
		
		if(!errors.hasErrors()) {
			boolean success = service.modifyCnb(cnb);
			if(success) {
				viewName = "redirect:/operate/custNoticeBrd/cnbView.do?what=" + cnb.getCnbNo();
			}else {
				viewName = "operate/custNoticeBrd/cnbForm";
			}
			
		}else {
			viewName = "operate/custNoticeBrd/cnbEdit";
		}
		return viewName;
	}

}
