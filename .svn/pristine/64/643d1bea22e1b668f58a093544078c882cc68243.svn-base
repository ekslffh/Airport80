package kr.or.ddit.operate.vendor.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.operate.contract.service.ContractService;
import kr.or.ddit.operate.vendor.service.VendorService;
import kr.or.ddit.operate.vo.AirlineVO;
import kr.or.ddit.operate.vo.contractVO;
import kr.or.ddit.operate.vo.vendorVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hr/vendor/vendorInsert.do")
public class VendorInsertController {
	
	private final VendorService service;
	
	private final ContractService cserv;
	
	@ModelAttribute("vendor")
	public vendorVO vendor() {
		return new vendorVO();
	}
	
	@ModelAttribute("airline")
	public AirlineVO airline() {
		return new AirlineVO();
	}
	
	@GetMapping
	public String vendorForm(Authentication authentication) {
		
		
		return "hr/vendor/vendorForm";
	}
	
	@PostMapping
	public String vendorInsert(
		@Validated @ModelAttribute("vendor") vendorVO vendor,
		BindingResult errors,
		Model model
	) {
		
		String viewName = null;
		
		if(!errors.hasErrors()) {
			boolean success = service.createVendor(vendor);
			if(success) {
				viewName = "redirect:/hr/vendor/vendorView.do?what=" + vendor.getVendId();
			} else {
				model.addAttribute("message", "계정 추가 중 문제 발생");
				viewName = "hr/vendor/vendorForm";
			}
		} else {
			viewName = "hr/vendor/vendorForm";
		}
		
		return viewName;
	}
}
