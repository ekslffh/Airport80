package kr.or.ddit.operate.custNoticeBrd.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.hr.empBrd.service.EmpbrdService;
import kr.or.ddit.hr.vo.EmpbrdVO;
import kr.or.ddit.operate.custNoticeBrd.service.CustNoticeBrdService;
import kr.or.ddit.operate.vo.CustNoticeBrdVO;
import kr.or.ddit.validate.DeleteGroup;

@Controller
@RequestMapping("/operate/custNoticeBrd")
public class CnbDeleteController {

	@Inject
	private  CustNoticeBrdService service;
	
	@GetMapping("/cnbDelete.do")
	public String cnbDelete(@Validated(DeleteGroup.class) CustNoticeBrdVO cnb,
			Errors errors) {
		String viewName = null;
		
		if(!errors.hasErrors()) {
			boolean success = service.removeCnb(cnb.getCnbNo());
			if(success) {
				viewName = "redirect:/operate/custNoticeBrd/cnbList.do";
			} else {
				viewName = "redirect:/operate/custNoticeBrd/cnbView.do?what=" + cnb.getCnbNo();
			}
		}else {
			viewName = "redirect:/operate/custNoticeBrd/cnbView.do?what=" + cnb.getCnbNo();
		}
		return viewName;
	}
}



