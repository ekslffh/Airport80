package kr.or.ddit.operate.vendor.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.operate.vendor.service.VendorService;
import kr.or.ddit.operate.vo.vendorVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class VendorRetrieveController {
	
	private final VendorService service;
	
	@RequestMapping("/hr/vendor/vendorList.do")
	public void vendorList(
		@RequestParam(name = "page", required = false, defaultValue="1") long currentPage
		, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
		, Model model
	) {
		
		PaginationInfo<vendorVO> paging = new PaginationInfo<vendorVO>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<vendorVO> vendorList = service.selectVendorList(paging);
		paging.setDataList(vendorList);
		
		model.addAttribute("paging", paging);
	}
	
	
	@RequestMapping("/hr/vendor/vendorView.do")
	public void vendorView(
		@RequestParam(name="what", required = true) String vendId
		, Model model
	) {
		vendorVO vendor = service.selectVendor(vendId);
		model.addAttribute("vendor", vendor);
	}
	
	
	// 비로그인
	@RequestMapping("/open/hr/vendorCos.do")
	public String vendorList(Model model) {
        List<vendorVO> vendorList = service.selectVendorCos();
        model.addAttribute("simpleCondition", new SimpleCondition());

        model.addAttribute("vendorList", vendorList);
        return "open/hr/vendorCos"; // 이 부분은 해당 JSP 페이지의 경로로 수정하세요.
    }
}
