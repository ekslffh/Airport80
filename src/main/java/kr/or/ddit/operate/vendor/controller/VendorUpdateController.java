package kr.or.ddit.operate.vendor.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.operate.vendor.service.VendorService;
import kr.or.ddit.operate.vo.contractVO;
import kr.or.ddit.operate.vo.vendorVO;
import kr.or.ddit.validate.UpdateGroup;

@Controller
@RequestMapping("/hr/vendor")
public class VendorUpdateController {

	@Inject
	private VendorService service;
	
	@GetMapping("/vendorUpdate.do")
	public String updateForm(
		Model model
		, @RequestParam("what") String vendId
	) {
		vendorVO vendor = service.selectVendor(vendId);
		model.addAttribute("vendor", vendor);
		
		return "hr/vendor/vendorEdit";
	}
	
	@PostMapping("/vendorUpdate.do")
	public String updateVendor(
		Model model
		, @Validated(UpdateGroup.class) @ModelAttribute("vendor") vendorVO vendor
		, BindingResult errors
	) {
		String viewName = null;
		
		if (!errors.hasErrors()) {
			boolean success = service.modifyVendor(vendor);
			if(success) {
				viewName = "redirect:/hr/vendor/vendorView.do?what=" + vendor.getVendId();
			} else {
				model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요");
				viewName = "hr/vendor/vendorForm";
			}
		} else {
			viewName = "hr/vendor/vendorForm";
		}
		
		 return viewName;
	}
	
	@PostMapping("/vendorModal.do")
	public String vendorModal (
		Model model
		, @ModelAttribute("vendor") vendorVO vendor
		, BindingResult errors
	) {
		
		String viewName = null;
		String ctrStatus = vendor.getCtrStatus();
		System.out.println("ctrstatus : " + ctrStatus);
		
		contractVO cv = new contractVO();
		
		System.out.println("ctrId : " + cv.getCtrId());
		System.out.println("vrctrId : " + vendor.getVendCtrId());
		System.out.println("vrId : " + vendor.getVendId());
		
		model.addAttribute("vendor", vendor);
		
		if (!errors.hasErrors()) {
			boolean success = service.modifyVendStatus(vendor);
			
			if (success) {
				viewName = "redirect:/hr/vendor/vendorList.do";
			} else {
				model.addAttribute("message", "서버 오류, 다음에 다시 시도하세요");
				viewName = "hr/vendor/vendorList";
			}
		} else {
			viewName = "hr/vendor/vendorList";
		}
		
		return viewName;
	}
}
